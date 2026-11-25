# Blogs and presentations

This is a presentation-sanity project, with one folder per talk or blog under
`presentations/`. The initial set is `traits/v1`: `blog.md`, `supplementary.md`,
and `slides.md`. Shared configuration lives in `manifest.yaml`, components and
styles in `shared/`, and assets in `public/` and `scenes/`.

From the repository root, use `make dev-blog`, `make dev-slides`, `make blog`,
`make slides`, or `make serve-presentation`. Override `TALK=traits/v2` to select
another folder. `make new-presentation NEW=traits/v2 FROM=traits/v1` creates a
new version using the framework's own command.

The relative symlink `refs.bib` shares the paper's canonical bibliography.
Python dependencies come from the root workspace; Node dependencies and their
lockfile live here. Run `make setup` at the repository root after cloning.
