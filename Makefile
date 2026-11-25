.DEFAULT_GOAL := help
UV ?= uv
export UV_CACHE_DIR ?= $(CURDIR)/.cache/uv
DOC ?= manuscript
TALK ?= traits/v1
NEW ?=
FROM ?=
.PHONY: help setup build check paper blog slides dev-blog dev-slides serve-paper serve-presentation new-presentation
help:
	@echo 'make setup                 Install both Python tools and presentation Node dependencies'
	@echo 'make build                 Build/check paper PDF + HTML + Word, blog, and slides'
	@echo 'make check                 Check paper outputs and presentation references'
	@echo 'make paper | blog | slides Build one format'
	@echo 'make dev-blog | dev-slides Start the chosen presentation in development mode'
	@echo 'make serve-paper           Serve paper HTML on localhost:8001'
	@echo 'make serve-presentation    Serve built blog/deck gallery on localhost:8000'
	@echo 'make new-presentation NEW=traits/v2 FROM=traits/v1'
	@echo 'Override DOC=manuscript and TALK=traits/v1 to select other documents/talks.'
setup:
	$(UV) sync --locked --all-packages
	npm --prefix presentation ci --cache $(CURDIR)/.cache/npm
paper:
	$(UV) run --directory paper document-sanity preview -V $(DOC)
	$(UV) run --directory paper document-sanity check $(DOC)
blog:
	$(UV) run --directory presentation presentation-sanity build $(TALK):blog
slides:
	$(UV) run --directory presentation presentation-sanity build $(TALK):slides
build: paper
	$(UV) run --directory presentation presentation-sanity check
	$(UV) run --directory presentation presentation-sanity build
check: paper
	$(UV) run --directory presentation presentation-sanity check
dev-blog:
	$(UV) run --directory presentation presentation-sanity dev $(TALK):blog
dev-slides:
	$(UV) run --directory presentation presentation-sanity dev $(TALK):slides
serve-paper:
	python3 -m http.server 8001 --directory paper/out/$(DOC)/html
serve-presentation:
	$(UV) run --directory presentation presentation-sanity preview
new-presentation:
	@test -n "$(NEW)" || (echo 'Set NEW, for example NEW=traits/v2'; exit 1)
	$(UV) run --directory presentation presentation-sanity new $(NEW) $(if $(FROM),--from $(FROM))
