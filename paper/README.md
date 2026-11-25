# Paper

Active document: `src/manuscript/`. Its manifest orders the sections and registers
figures. Edit the Markdown in `docs/` and bibliography in `references.bib`.
The presentation project links to that bibliography.

From the repository root, use `make paper` to refresh previews and validate/build
PDF, HTML, and Word. Use `make serve-paper` to open the HTML viewer on port 8001.
From this directory, `uv run document-sanity ... -V manuscript` uses the shared
workspace environment. `make help` lists the framework's other commands.

Original sources live in `recovery/`; `recovery/MIGRATION.md` explains their use.
The supplement distinguishes the historical figure from validated current data.
