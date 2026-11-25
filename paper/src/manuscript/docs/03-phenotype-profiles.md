# A phenotype is an evaluation

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


# Phenotypic equivalence is relative to a vocabulary

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


# Observed profiles are partial

A study usually observes only $F_{x,c}\subseteq\mathcal T_c$. Its observed profile is the restriction

$$
p^{\mathrm{obs}}_{x,c}=p_x|_{F_{x,c}}.
$$

A trait missing from this domain is not thereby zero, false, or biologically absent. Whether it was unmeasured, unavailable, or inapplicable requires separate recording.

An arbitrary restriction is not automatically a homomorphism on a subalgebra: $F_{x,c}$ may not be closed under composition. The preservation equation applies when the inputs and result are included, or when a derived value is computed explicitly. Computed values should retain their provenance rather than being confused with independent measurements.

## Extending a context

Suppose $\mathcal T_c$ embeds into a richer vocabulary $\mathcal T_d$ while preserving the meaning and evaluation of its existing traits. Then

$$
p_x^d|_{\mathcal T_c}=p_x^c.
$$

This is a compatibility condition, not a consequence of merely sharing labels. A changed instrument or protocol may introduce a different observable rather than an extension that leaves the old one intact.
