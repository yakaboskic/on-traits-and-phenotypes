# Traits as typed observables

Fix an observational context $c$ and a domain $\mathcal X_c$ of biological bearers or states. A trait is a function

$$
T:\mathcal X_c\longrightarrow V_T,
$$

where $V_T$ specifies the kind of value it returns. The function $T$ and the value $T(x)$ are different objects. A height trait might return a length, an eye-color trait a category, and a classification trait a Boolean value.

Time, instrument, protocol, and preprocessing must be accounted for when defining the observation. We can put time into the state $x$ and index the measurement procedure by $c$. Repeated noisy measurements require an observation event or noise realization in the domain, or a probabilistic measurement model; they are not silently deterministic functions of a person alone.

For the deterministic core below, assume all functions are defined on a common domain. Where an operation has a precondition, restrict the domain accordingly. Distinguish a biologically undefined quantity from an applicable quantity that was not recorded.


# Constructing a compositional trait space

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

## Height, weight, and BMI

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

## Preserve expressions as well as values

There are two useful levels of representation. A typed expression records a construction, such as $f[W,H]$. Interpreting the expression gives a function on $\mathcal X_c$. Different expressions can define the same function while retaining different provenance.

Thus a system that needs derivational provenance should retain the expression or dependency graph alongside the interpreted function. Identifying traits solely by extensional equality would discard precisely that provenance. Dependency counts and depth describe a chosen expression graph, not an invariant of every possible expression for the same function.
