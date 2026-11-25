# On Traits and Phenotypes

Test change

One research project, two authoring roots: a **paper** built with document-sanity,
and **blogs and talks** built with presentation-sanity.

```text
paper/
  src/manuscript/
    manifest.yaml              Metadata, ordered sections, figures
    docs/                      Active paper, algebra, discussion, supplement
    references.bib             Canonical bibliography for paper and blogs
    figures/efo_bmi_tree/       Recovered PDF and PNG together
  templates/  styles/          document-sanity article templates
  recovery/                    Original chat exchanges and manuscript artifacts
  out/manuscript/               Generated PDF, HTML, Word, and LaTeX
presentation/
  manifest.yaml                Shared math, assets, bibliography, output defaults
  presentations/traits/v1/
    blog.md                    Blog essay
    supplementary.md           Blog supplement
    slides.md                  Slidev presentation
    manifest.yaml              This presentation's metadata and overrides
  shared/                      Shared components, layouts, and styling
  scenes/  public/              Shared Manim sources and static assets
  refs.bib                     Relative symlink to the paper bibliography
  site/                        Generated gallery, decks, and blogs
pyproject.toml  uv.lock         One Python workspace for both tools
Makefile                       Commands usable from this repository root
```

## Install and build

```bash
make setup
make build
```

The Python workspace uses the local editable checkouts at
`/Users/cyakaboski/src/personal-projects/presentation-sanity` (currently 0.4.3)
and `/Users/cyakaboski/src/personal-projects/document-sanity` (currently 0.2.2).
Both paths are declared once in the root `pyproject.toml`. The child projects
use the root environment and lockfile. On another machine, provide those
checkouts in the same relative locations or change the root dependency sources.
Node dependencies are installed only under `presentation/` and locked there.
PDF builds require TeX with `pdflatex` and `bibtex`.

| Command | Result |
|---|---|
| `make paper` | Refresh previews; build and validate PDF, HTML, Word, references |
| `make blog` | Build the selected blog |
| `make slides` | Build the selected Slidev deck |
| `make build` | Build the paper and every blog/deck |
| `make check` | Validate paper outputs and presentation references |
| `make dev-blog` | Blog editing server; use the URL printed by the tool |
| `make dev-slides` | Slidev editing server; use the URL printed by the tool |
| `make serve-paper` | Serve the paper viewer at http://localhost:8001 |
| `make serve-presentation` | Serve the gallery at http://localhost:8000 |

The current outputs are:

- `paper/out/manuscript/pdf/main.pdf`
- `paper/out/manuscript/html/index.html`
- `paper/out/manuscript/word/main.docx`
- `presentation/site/traits/v1/blog/index.html`
- `presentation/site/traits/v1/slides/index.html`

## Multiple blogs and presentations

Each folder under `presentation/presentations/` containing `blog.md` and/or
`slides.md` is independently buildable. It may contain only a blog, only slides,
or both. Shared components, bibliography, math, scenes, and assets are declared
at the presentation project root; local manifests contain metadata and output
overrides. IDs can group versions, such as `traits/v1` and `traits/v2`.

```bash
make new-presentation NEW=traits/v2 FROM=traits/v1
make blog TALK=traits/v2
make dev-slides TALK=traits/v2
```

For a separate new talk, omit `FROM`. Use the generated folder's `blog.md` for
its companion post, or make a blog-only folder with `blog.md`. Extra Markdown
pages beside a blog are included in that blog's site. To create a new paper
version, use document-sanity's `new-version` command from `paper/` and select it
with `DOC=<name>` in root make commands.

## Sources and recovery

The manuscript is an active perspective draft, not an empirical study with
completed results. It integrates the recovered introduction and the algebra,
phenotype equivalence, partial profiles, causal research directions, and audit
plan. The blog and slides are separately editable treatments of the same work;
prose is not automatically synchronized across formats. The bibliography is shared.

`paper/recovery/README.md` records provenance and reconstruction limits.
The five accessible chat exchanges and original manuscript artifacts remain
unchanged in that archive. `paper/recovery/MIGRATION.md` maps the archive into
active sections and records the corrections made to the introduction.
The archive is outside all publishing roots. No deployment is configured.

The historical ontology figure is registered in the paper manifest and shown
with a qualification in the supplement. Its editable Draw.io source was not
recovered. No new ontology counts or causal identification results are claimed.
