---
title: "On Traits and Phenotypes: The phenotype side of the genotype–phenotype map"
outline: [2, 3]
---

# On Traits and Phenotypes

## The phenotype side of the genotype–phenotype map

::: info Working draft recovered from our discussion
This draft assembles the framework discussed in [Trait Phenotype Algebra](https://chatgpt.com/c/6a987c0c-fd84-83ea-ba58-280a9d115472). The available exchanges and the earlier manuscript are preserved verbatim in the repository's `paper/recovery/` folder. The formal details below include explicitly stated assumptions added during reconstruction; this is not a verbatim recovery of a finished paper.
:::

A trait can denote height, a diagnostic classification, or a quantity computed from other measurements. A phenotype can mean the value of one such trait or an individual's profile across many traits. The NHGRI glossary describes phenotype through an individual's observable traits. \cite{nhgri_glossary} Our proposal is to make the distinction between a trait, its evaluation, and a profile explicit.

Height and weight provide a useful example. Both are traits, and so is body mass index (BMI). But BMI is constructed from the other two. Adding it to a phenotype table does not add an unconstrained coordinate. Its value must agree with its inputs and the rule used to combine them.

The central idea is that **traits are typed observable functions, and phenotype profiles are evaluations of those functions**. A trait vocabulary can grow through composition without requiring a final, universal list of phenotypes.

## Traits as typed observables

Fix an observational context $c$ and a domain $\mathcal X_c$ of biological bearers or states. A trait is a function

$$
T:\mathcal X_c\longrightarrow V_T,
$$

where $V_T$ specifies the kind of value it returns. The function $T$ and the value $T(x)$ are different objects. A height trait might return a length, an eye-color trait a category, and a classification trait a Boolean value.

Time, instrument, protocol, and preprocessing must be accounted for when defining the observation. We can put time into the state $x$ and index the measurement procedure by $c$. Repeated noisy measurements require an observation event or noise realization in the domain, or a probabilistic measurement model; they are not silently deterministic functions of a person alone.

For the deterministic core below, assume all functions are defined on a common domain. Where an operation has a precondition, restrict the domain accordingly. Distinguish a biologically undefined quantity from an applicable quantity that was not recorded.

## Constructing a compositional trait space

Let $\Sigma$ specify admissible typed operations. Given traits $T_i:\mathcal X_c\to V_i$ and an operation

$$
f:V_1\times\cdots\times V_n\longrightarrow V,
$$

construct a new trait by pointwise composition:

$$
f[T_1,\ldots,T_n](x)
= f\bigl(T_1(x),\ldots,T_n(x)\bigr).
$$

Starting with a chosen collection $G_c$ of observations, close under the operations in $\Sigma$ to obtain $\mathcal T_c$. This is a **many-sorted algebra**: categories, lengths, masses, images, and Boolean values need not share a single value type. The admissible operations determine which compositions make sense.

The choice of generators is relative to the task. Height may be a starting observation in one analysis and the output of an imaging pipeline in another. There need not be a privileged base set for every study.

### Height, weight, and BMI

Let $H$ return positive lengths in metres and $W$ return masses in kilograms. Define

$$
B=f[W,H],\qquad f(w,h)=\frac{w}{h^2},\qquad h>0.
$$

For an individual state $x$,

$$
H(x)=1.8\,\mathrm m,\qquad W(x)=90\,\mathrm{kg},
\qquad B(x)=\frac{90}{1.8^2}\approx27.78\,\mathrm{kg/m^2}.
$$

BMI depends on both inputs, with different mathematical roles. The formula is not symmetric under exchanging height and weight. Units are part of the specification: changing units requires the corresponding conversion before applying the numerical formula.

A further trait could be an explicitly chosen threshold rule,

$$
Q_\tau=\mathbf 1[B\geq\tau].
$$

This is a Boolean classification constructed from BMI. Its threshold and units belong to its definition; it should not be equated automatically with a separately measured biological state.

### Preserve expressions as well as values

There are two useful levels of representation. A typed expression records a construction, such as $f[W,H]$. Interpreting the expression gives a function on $\mathcal X_c$. Different expressions can define the same function while retaining different provenance.

Thus a system that needs derivational provenance should retain the expression or dependency graph alongside the interpreted function. Identifying traits solely by extensional equality would discard precisely that provenance. Dependency counts and depth describe a chosen expression graph, not an invariant of every possible expression for the same function.

## A phenotype is an evaluation

For a fixed $x$, evaluation assigns a value to every trait in the vocabulary:

$$
p_x(T)=T(x),\qquad
p_x=\bigl(T(x)\bigr)_{T\in\mathcal T_c}.
$$

Evaluation preserves every admissible operation:

$$
p_x\bigl(f[T_1,\ldots,T_n]\bigr)
=f\bigl(p_x(T_1),\ldots,p_x(T_n)\bigr).
$$

This is the precise sense in which a phenotype is an **evaluation homomorphism**. More formally, each value sort $V$ has its own evaluation map from the $V$-valued traits to $V$; together those maps preserve the typed operations.

The BMI identity therefore holds for every valid evaluation:

$$
p_x(B)=\frac{p_x(W)}{p_x(H)^2}.
$$

The space of realized profiles is

$$
\mathcal P_c
=\{p_x:x\in\mathcal X_c\}
\subseteq\prod_{T\in\mathcal T_c}V_T.
$$

Not every assignment in the Cartesian product is a possible phenotype. It must satisfy the compositional identities, and even satisfying those identities need not guarantee that an assignment is biologically realized.

## Phenotypic equivalence is relative to a vocabulary

Two states are indistinguishable by a vocabulary $F$ when all its traits agree:

$$
x\sim_F y
\quad\Longleftrightarrow\quad
T(x)=T(y)\quad\text{for every }T\in F.
$$

This defines an equivalence relation. The profile map identifies its classes with the realized profiles:

$$
\mathcal X_c/{\sim_F}\;\cong\;\{(T(x))_{T\in F}:x\in\mathcal X_c\},
$$

where the correspondence is a bijection of sets. Calling a phenotype an equivalence class is therefore compatible with calling it an evaluation, provided the vocabulary and context are fixed.

Agreement on height and weight implies agreement on BMI. Agreement on BMI alone does not imply agreement on either input. Extending a vocabulary can distinguish states previously grouped together; adding only deterministic functions of existing traits cannot further separate states that already agree on all those inputs.

## Observed profiles are partial

A study usually observes only $F_{x,c}\subseteq\mathcal T_c$. Its observed profile is the restriction

$$
p^{\mathrm{obs}}_{x,c}=p_x|_{F_{x,c}}.
$$

A trait missing from this domain is not thereby zero, false, or biologically absent. Whether it was unmeasured, unavailable, or inapplicable requires separate recording.

An arbitrary restriction is not automatically a homomorphism on a subalgebra: $F_{x,c}$ may not be closed under composition. The preservation equation applies when the inputs and result are included, or when a derived value is computed explicitly. Computed values should retain their provenance rather than being confused with independent measurements.

### Extending a context

Suppose $\mathcal T_c$ embeds into a richer vocabulary $\mathcal T_d$ while preserving the meaning and evaluation of its existing traits. Then

$$
p_x^d|_{\mathcal T_c}=p_x^c.
$$

This is a compatibility condition, not a consequence of merely sharing labels. A changed instrument or protocol may introduce a different observable rather than an extension that leaves the old one intact.

## What an ontology relation leaves to specify

Ontologies supply shared concepts and relationships that support data integration. \cite{efo_malone2010,obofoundry2007} A shared annotation does not by itself specify a measurement procedure or a numerical operation. In particular, a relationship between BMI, height, and weight does not alone supply the equation $B=W/H^2$.

The compositional representation adds a constraint on evaluated values. This complements ontology annotation; it does not imply that ontology languages or related provenance systems are incapable of representing construction.

Likewise, mapping two study variables to the same concept does not establish that their observable functions agree:

$$
\operatorname{label}(T_1)=\operatorname{label}(T_2)
\quad\not\Rightarrow\quad T_1=T_2.
$$

Two procedures can agree in a particular cohort without agreeing throughout the relevant domain. Correlation, shared value types, shared labels, and equality as functions are distinct relationships.

The [supplement](./supplementary.md) revisits the earlier ontology-distance argument and records its limits.

## Measurement, derivation, and observation

The discussion also separated several stages of phenotype construction. A schematic model is

$$
O_{x,c}=M_c(B_x,\varepsilon_M),\qquad
T_{x,c}=d_c(O_{1,x,c},\ldots,O_{k,x,c}),
$$

where $B_x$ denotes a biological state, $M_c$ a measurement procedure, and $d_c$ a derivation. A recording indicator determines availability:

$$
F_{x,c}=\{T\in\mathcal T_c:R_T(x,c)=1\}.
$$

Biological causation, measurement, deterministic derivation, and selection should remain distinguishable. A dependency graph of computations does not alone identify the effect of a biological intervention. Nor does the algebra itself remove confounding or selection bias. It describes the variables and observation mechanisms that a causal analysis must specify.

## A bridge between phenotype constructions

The proposed follow-up asks when results can move between studies using different trait operators. A candidate bridge is

$$
T_t(x)=h\bigl(T_s(x),Z(x)\bigr),
$$

where $Z$ contains any additional information required for translation. Such a bridge is an assumption to establish over a stated domain. Agreement in observational data does not automatically establish agreement under intervention or in another population.

For a compositional bridge, the value translations should commute with operations:

$$
h_V\bigl(f_s(v_1,\ldots,v_n)\bigr)
=f_t\bigl(h_{V_1}(v_1),\ldots,h_{V_n}(v_n)\bigr).
$$

When this holds for each operation and the translations agree on generators, agreement extends by induction to finite expressions. If expressions are identified using additional equations, the translation must also respect those equations. This algebraic property alone is not a causal transportability theorem.

The recovered research plan separates a genetics perspective introducing the framework from a later paper establishing identification assumptions, estimators, and transportability results. Those results remain proposed work.

## Measuring compositional structure

The figure plan in the chat proposed auditing trait constructions across resources and modalities. For each chosen derivation graph, record immediate dependency count $k(T)$, the number of distinct ancestral traits $A(T)$, and maximum derivation depth $D(T)$.

If height and weight are roots, BMI has $k(B)=2$, $A(B)=2$, and $D(B)=1$. A threshold classification built from BMI has one immediate dependency and depth two. These counts depend on the declared roots and the granularity of operations.

An audit should distinguish explicitly represented derivations, derivations recovered from documentation, and unknown constructions. Unknown derivation must not be counted as evidence that a trait is primitive. The proposed comparison is a research plan; no resource-wide counts or distributions have yet been established here.

\bibliography
