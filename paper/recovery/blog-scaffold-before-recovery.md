---
title: "On the Distiction of Traits and Phenotypes: The phenotype side of the genotype-phenotype map"
outline: [2, 3]
---

# On the Distiction of Traits and Phenotypes: The phenotype side of the genotype-phenotype map
<!--
  Scaffolding — delete freely. This file is the VitePress entry declared in
  manifest.yaml (`outputs.blog.entry`) and is rewritten to `/` in the built
  site. Extra `.md` files next to it become extra pages of the same site.

  What you can reach for, with no imports (components/ is auto-registered):

    <DataValue var="heritability_h2" />         a manifest variable, click for
                                                its provenance graph
    <ManimFigure scene="intro" caption="…" />   a manim scene as an inline
                                                figure, plays when scrolled to
    <FigureImage figure="pipeline" />           an exported Excalidraw diagram

  Math is on, and \cite{} works against refs.bib — see the Math and
  Citations sections below. Code blocks use Shiki.

  Keep a component tag off the START of a line — markdown-it reads a
  line-leading `<Tag` as an HTML block and breaks the paragraph around it.
-->

Start writing.

## Citations

Heritability is routinely misread as a statement about individuals rather than
populations \cite{visscher2008}. The variance-partitioning framing goes back
further \cite{falconer1996,lewontin1974}, and the missing-heritability problem
sharpened it \cite{yang2010}.

Textual form: \citet{lewontin1974} argued the analysis of variance cannot
recover the analysis of causes. With a locator: \cite[pp. 401--403]{lewontin1974}.

\bibliography

## Math

LaTeX is rendered to static SVG at build time, so it needs no client-side
JavaScript and prints correctly. Inline math like $h^2 = \sigma^2_A / \sigma^2_P$
sits in running text; display math gets its own block.

Write display environments the way you would in a `.tex` file — no `$$` fence
required:

\begin{align}
h^2 &= \frac{\sigma^2_A}{\sigma^2_P} \\
    &= \frac{\sigma^2_A}{\sigma^2_A + \sigma^2_E}
\end{align}

`align`, `equation`, `gather`, `multline`, `alignat`, `flalign`, `split`,
`aligned`, `eqnarray` and `CD` all work at block level, starred variants
included. `$$ … $$` still works and is required for anything nested, like
`cases` or a matrix:

$$
\phi(g) =
\begin{cases}
1 & \text{if } g \in \mathcal{G} \\
0 & \text{otherwise}
\end{cases}
\qquad
\underbrace{\begin{pmatrix} a & b \\ c & d \end{pmatrix}}_{\text{genotype}}
$$

Macros come from `math.macros` in `manifest.yaml`, so they are defined once and
mean the same thing everywhere: $\Var(X)$, $\Cov(X,Y)$, $\E[Y \given G]$,
$\RR^n$, $\norm{v}$. Define them there rather than with an in-document
`\newcommand`, which leaks into every later block and depends on source order.

The full MathJax package set is available — `\mathbb`, `\mathcal`,
`\operatorname`, `\text`, `physics`, `mathtools`, and so on. Dollar signs in
prose are safe: costs $5 and $10 stay literal, as does an escaped \$100.

## Building

```bash
uv sync                                    # installs the local presentation-sanity
npm install                                # VitePress side
uv run presentation-sanity dev blog        # hot reload
uv run presentation-sanity build           # → site/blog/
uv run presentation-sanity preview blog    # serve it at localhost:8000
```
