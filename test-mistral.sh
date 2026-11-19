#!/usr/bin/env bash

set -Eeuo pipefail

BASE_URL="${LITELLM_BASE_URL:-http://litellm-test.rc.tch.harvard.edu}"
MODEL="${LITELLM_MODEL:-mistral-small}"
MODEL_WAS_EXPLICIT=false
LIST_MODELS=false

if [[ -n "${LITELLM_MODEL:-}" ]]; then
  MODEL_WAS_EXPLICIT=true
fi

usage() {
  printf '%s\n' \
    'Usage:' \
    '  ./test-mistral.sh [PROMPT]' \
    '  ./test-mistral.sh --model MODEL [PROMPT]' \
    '  ./test-mistral.sh --list-models' \
    '' \
    'The script prompts securely for LITELLM_API_KEY if it is not already set.'
}

case "${1:-}" in
  --list-models)
    LIST_MODELS=true
    shift
    ;;
  --model)
    if [[ $# -lt 2 ]]; then
      printf 'Error: --model requires a model name.\n' >&2
      usage >&2
      exit 2
    fi
    MODEL="$2"
    MODEL_WAS_EXPLICIT=true
    shift 2
    ;;
  -h|--help)
    usage
    exit 0
    ;;
esac

PROMPT="${*:-In two sentences, explain what a phenotype is.}"

for command_name in curl jq; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf 'Error: %s is required but was not found.\n' "$command_name" >&2
    exit 1
  fi
done

if [[ -z "${LITELLM_API_KEY:-}" ]]; then
  if [[ ! -t 0 ]]; then
    printf 'Error: set LITELLM_API_KEY when running non-interactively.\n' >&2
    exit 1
  fi

  read -r -s -p 'LiteLLM API key: ' LITELLM_API_KEY
  printf '\n' >&2
fi

if [[ -z "$LITELLM_API_KEY" ]]; then
  printf 'Error: the API key cannot be empty.\n' >&2
  exit 1
fi

api_request() {
  # Supplying the authorization header over stdin keeps the key out of `ps` output.
  printf 'header = "Authorization: Bearer %s"\n' "$LITELLM_API_KEY" |
    curl --config - --fail-with-body --silent --show-error \
      --connect-timeout 15 \
      --max-time 120 \
      "$@"
}

print_response() {
  local response_body="$1"

  if ! jq . <<<"$response_body" >&2 2>/dev/null; then
    printf '%s\n' "$response_body" >&2
  fi
}

printf 'Checking models available to your key ...\n' >&2

if ! models_response="$(api_request "$BASE_URL/v1/models")"; then
  printf '\nCould not retrieve the available models. Server response:\n' >&2
  print_response "$models_response"
  exit 1
fi

if [[ "$LIST_MODELS" == true ]]; then
  if ! jq -er '.data[]?.id' <<<"$models_response"; then
    printf 'No model IDs were returned. Full response:\n' >&2
    print_response "$models_response"
    exit 1
  fi
  exit 0
fi

if ! jq -e --arg model "$MODEL" 'any(.data[]?; .id == $model)' \
  <<<"$models_response" >/dev/null; then
  mistral_count="$(
    jq '[.data[]?.id | select(test("mistral"; "i"))] | length' \
      <<<"$models_response"
  )"

  if [[ "$MODEL_WAS_EXPLICIT" == false && "$mistral_count" -eq 1 ]]; then
    MODEL="$(
      jq -r '.data[]?.id | select(test("mistral"; "i"))' \
        <<<"$models_response"
    )"
    printf 'Using the available Mistral model: %s\n' "$MODEL" >&2
  else
    printf 'Error: model %s is not available to your key.\n' "$MODEL" >&2

    if [[ "$mistral_count" -gt 0 ]]; then
      printf '\nAvailable Mistral models:\n' >&2
      jq -r '.data[]?.id | select(test("mistral"; "i")) | "  \(.)"' \
        <<<"$models_response" >&2
      printf '\nChoose one with: ./test-mistral.sh --model MODEL "your prompt"\n' >&2
    else
      printf '\nNo Mistral models are available to this key. All available models:\n' >&2
      jq -r '.data[]?.id | "  \(.)"' <<<"$models_response" >&2
    fi
    exit 1
  fi
fi

payload="$(
  jq -n \
    --arg model "$MODEL" \
    --arg prompt "$PROMPT" \
    '{
      model: $model,
      messages: [{role: "user", content: $prompt}],
      max_tokens: 200,
      temperature: 0.2
    }'
)"

printf 'Querying %s at %s ...\n' "$MODEL" "$BASE_URL" >&2

if ! response="$(
  api_request \
    "$BASE_URL/v1/chat/completions" \
    -H 'Content-Type: application/json' \
    --data "$payload"
)"; then
  printf '\nRequest failed. Server response:\n' >&2
  print_response "$response"
  exit 1
fi

if ! jq -er '.choices[0].message.content' <<<"$response"; then
  printf '\nUnexpected response:\n' >&2
  jq . <<<"$response" >&2
  exit 1
fi
