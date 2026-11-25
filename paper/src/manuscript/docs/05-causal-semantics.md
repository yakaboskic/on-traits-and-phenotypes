# Measurement, derivation, and observation

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


# A bridge between phenotype constructions

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
