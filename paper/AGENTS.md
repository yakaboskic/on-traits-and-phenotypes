# Paper authoring

Use document-sanity from this directory; the shared Python workspace is one
level above. The active document is `src/manuscript/`; always select it with
`-V manuscript` (or use `make paper` at the repository root).

- Edit `src/`, templates, and styles; never generated `out/` or `site/`.
- After source changes run `document-sanity preview -V manuscript`, then
  `document-sanity check manuscript`.
- Preserve `recovery/` originals. Record editorial changes in its migration log.
- The bibliography in `src/manuscript/references.bib` also serves the blog.
- The ontology figure is historical and unpinned; keep its qualification.
- Audit results and causal identification theorems are proposed work, not findings.
