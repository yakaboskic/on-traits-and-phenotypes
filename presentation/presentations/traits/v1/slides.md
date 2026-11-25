---
theme: seriph
routerMode: hash
title: On Traits and Phenotypes
info: A working presentation of the compositional trait framework
class: text-center
transition: slide-left
mdc: true
---

# On Traits and Phenotypes

The phenotype side of the genotype–phenotype map

Chase Yakaboski

Working perspective · algebra and research agenda

---

# A trait, its value, and a phenotype

A trait is a typed observable:

$$T:\mathcal X_c\rightarrow V_T$$

Its evaluation is a value: $T(x)\in V_T$.

A phenotype profile assigns values across a chosen vocabulary:

$$p_x=(T(x))_{T\in\mathcal T_c}$$

Time, protocol, instrument, and preprocessing belong in the specification.

---

# Composition adds constraints

Height $H$, weight $W$, and BMI $B$ are traits.

$$B=f[W,H],\qquad f(w,h)=\frac{w}{h^2},\quad h>0$$

A BMI coordinate is constrained by its inputs.

The operation has types, units, and domain restrictions.

Both inputs matter; they play different mathematical roles.

---

# An algebra of observable functions

For an admissible typed operation $f$:

$$f[T_1,\ldots,T_n](x)=f(T_1(x),\ldots,T_n(x))$$

Start from a chosen collection of observations and close under composition.

Generators are relative to a task, not a universal list of primitive traits.

Keep the expression graph alongside the function to retain provenance.

---

# Phenotypes preserve composition

Evaluation is a homomorphism:

$$p_x(f[T_1,\ldots,T_n])=f(p_x(T_1),\ldots,p_x(T_n))$$

So every valid BMI evaluation satisfies

$$p_x(B)=\frac{p_x(W)}{p_x(H)^2}.$$

Not every tuple of values is a realizable phenotype.

---

# Equivalence depends on the vocabulary

$$x\sim_F y\iff T(x)=T(y)\text{ for every }T\in F$$

States are equivalent when the selected traits cannot distinguish them.

Agreement on height and weight implies agreement on BMI.

Agreement on BMI alone does not identify either input.

---

# Real observations are partial

$$p^{\mathrm{obs}}_{x,c}=p_x|_{F_{x,c}}$$

Unrecorded is not the same as zero, false, or biologically absent.

An arbitrary observed subset need not be closed under composition.

Computed values should retain their derivation and provenance.

---

# Shared labels do not establish equal observables

$$\operatorname{label}(T_1)=\operatorname{label}(T_2)
\quad\not\Rightarrow\quad T_1=T_2$$

Ontology alignment and functional equivalence answer different questions.

A taxonomy can organize BMI, height, and weight without supplying the numerical operation.

Distance equality would not recover that operation either.

---

# Separate the mechanisms

Biological state → measurement → derived trait → recorded profile

- Biological causation
- Measurement procedure
- Computational derivation
- Recording and study selection

A computation graph is not, by itself, an identification argument.

---

# Comparing phenotype constructions

A candidate source-to-target bridge:

$$T_t(x)=h(T_s(x),Z(x))$$

Compositional bridges should preserve admissible operations.

Observational agreement does not automatically extend to interventions.

Causal identification and estimation remain a separate research task.

---

# Research agenda

Audit explicit, recovered, and unknown derivations.

For a declared dependency graph, measure:

- Immediate dependency count
- Number of distinct ancestors
- Maximum derivation depth

These are proposed analyses, not completed resource-wide findings.

---
layout: end
---

# Make phenotype construction explicit

Typed observables · composition · evaluation · context · provenance
