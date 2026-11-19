# on-traits-and-phenotypes

Built on [presentation-sanity](https://github.com/yakaboskic/presentation-sanity).

`manifest.yaml` is the single source of configuration: shared variables, manim
scenes and Excalidraw figures, plus the `outputs:` that print them. Today that's
one output — `blog.md` rendered by VitePress. Adding a `slides.md` deck later is
a few lines under `outputs:`; the variables, scenes and figures don't move.

## Setup

```bash
uv sync            # Python deps — resolves presentation-sanity from the local
                   # checkout at ../../personal-projects/presentation-sanity
npm install        # VitePress + the YAML and math plugins
```

## Workflow

```bash
uv run presentation-sanity outputs         # what this subject declares
uv run presentation-sanity dev blog        # hot reload at localhost:5173
uv run presentation-sanity build           # → site/blog/
uv run presentation-sanity preview blog    # serve the build at localhost:8000
uv run presentation-sanity build-manim     # re-render stale scenes only
```

`.vitepress/` is generated from `manifest.yaml` on every dev/build and is
gitignored — don't hand-edit it. Configure the site under `outputs.blog:` in the
manifest, style it in `blog.css`, and add components to `components/` (they're
registered globally under their filename).

See the
[template README](https://github.com/yakaboskic/presentation-sanity-template)
for the full manifest schema, the provenance panel, and manim/figure workflow.

## Deploying

```bash
uv run presentation-sanity build blog --base /on-traits/
aws s3 sync site/blog/ s3://…/on-traits/ --acl public-read
```

VitePress needs an **absolute** base (`/on-traits/`), unlike Slidev's relative
`./`. The build emits real `.html` routes (`cleanUrls: false`), so it works on a
static bucket with no rewrite rules.
