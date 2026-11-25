# Trait Phenotype Algebra — recovered exchanges

Source: https://chatgpt.com/c/6a987c0c-fd84-83ea-ba58-280a9d115472

Recovered 2026-11-25 using the chat-history connector. The connector returned five exchanges (September 2–5, 2026); an explicit request before the earliest returned turn yielded no messages. This is NOT a complete export. Citation markers in the assistant text are original unresolved chat references, not verified bibliography entries. Historical assistant claims remain unreviewed here.

## 2026-09-02T22:25:50.855Z — 4304bdbd-10dc-4a47-9ff1-28092cfb460c

### User

I like this direction, it also combines causal ideas together too like transportability and also confounding and selection bias and gives a language around that

### Assistant

Yes—**that is the deeper paper**.

The trait algebra gives you a semantic layer beneath causal inference:

> A causal graph tells us how variables are related. The trait algebra tells us what those variables actually are, how they were constructed, under what observational conditions, and why they were observed.

Most causal analyses begin with nodes such as \(X\), \(Y\), and \(Z\) already defined. But in genetics, the phenotype node \(Y\) is often not primitive. It may be the output of a measurement instrument, questionnaire, imaging pipeline, diagnostic rule, imputation procedure, or machine-learning model. Treating that entire construction as an atomic column labeled “phenotype” hides causally important structure.

## A causal construction of a trait

You could separate four layers:

\[
\text{biological state}
\longrightarrow
\text{observation}
\longrightarrow
\text{derived trait}
\longrightarrow
\text{observed dataset}.
\]

For an individual \(x\), let \(B_x\) denote some biological state. An observational procedure in context \(c\) produces a record:

\[
O_{x,c}
=
M_c(B_x,\varepsilon_M),
\]

where \(M_c\) is the measurement operation and \(\varepsilon_M\) represents measurement variation.

A reported trait may then be derived from one or more observations:

\[
T_{x,c}
=
d_c(O_{1,x,c},\ldots,O_{k,x,c}).
\]

Finally, let

\[
R_T(x,c)\in\{0,1\}
\]

indicate whether trait \(T\) was observed or recorded for that individual.

Then the set of observed traits is not necessarily one fixed set \(F\). It can be an individual-specific, causally generated set:

\[
F_{x,c}
=
\left\{
T\in\mathcal T_c:R_T(x,c)=1
\right\}.
\]

The observed phenotype profile is therefore

\[
p^{\mathrm{obs}}_{x,c}
=
p^c_x|_{F_{x,c}}.
\]

Equivalently, it is a partial function:

\[
p^{\mathrm{obs}}_{x,c}:
\mathcal T_c
\rightharpoonup
\bigsqcup_{T\in\mathcal T_c}V_T,
\]

whose domain is \(F_{x,c}\).

That is important because **the domain of the phenotype profile can itself be caused by biological and social variables**. Who gets imaged, who completes a questionnaire, who receives a diagnosis, and who enters a biobank are not random facts.

## The framework should distinguish different kinds of arrows

One of the strongest contributions may be that you should not use the same arrow for every relationship.

### Biological causation

\[
A\longrightarrow B
\]

means changing \(A\), under an appropriate intervention, may change \(B\).

### Measurement

\[
B\xrightarrow{M_c}O
\]

means observation \(O\) is produced by measuring biological state \(B\) under context \(c\).

### Definitional or computational derivation

\[
(O_1,\ldots,O_k)
\xRightarrow{d}
T
\]

means \(T\) is mathematically constructed from those inputs.

For example,

\[
\operatorname{BMI}
\xLeftarrow{\mathrm{definition}}
(\operatorname{weight},\operatorname{height})
\]

is not the same claim as saying that height and weight biologically cause BMI as an independent biological process. BMI is definitionally determined by them.

### Observation or selection

\[
R_T=1
\]

means the trait enters the observed record, while

\[
S=1
\]

might mean that the individual enters the study.

This gives you at least four distinct structures:

\[
\boxed{
\text{causal}
\neq
\text{measurement}
\neq
\text{derivational}
\neq
\text{selection}
}
\]

A major problem with ordinary tabular phenotype representations is that all four are flattened into columns.

## Confounding becomes easier to describe

Consider a diagnosis phenotype \(Y\). It may really be something like

\[
Y
=
d(D,H,Q),
\]

where:

- \(D\) is an underlying disease state;
- \(H\) is healthcare contact or utilization;
- \(Q\) is questionnaire response behavior;
- \(d\) is the diagnostic or phenotyping rule.

A genetic association with \(Y\) can therefore arise through multiple channels:

\[
G\longrightarrow D\longrightarrow Y,
\]

but potentially also

\[
G\longrightarrow H\longrightarrow Y
\]

or

\[
G\longrightarrow Q\longrightarrow Y.
\]

The result is not necessarily an association specifically with disease biology. It is an association with the **constructed trait \(Y\)**.

This is closely adjacent to the January 2026 *Nature Genetics* Perspective “The predicament of heritable confounders,” which argues that diagnoses derived from self-report, electronic health records, and questionnaires can contain heritable sources of bias and produce disease-irrelevant GWAS signals. :chatgpt-content-reference{index="0"}

Your framework could generalize that observation:

> Heritable confounding is one consequence of failing to represent a phenotype as a composed observational function.

Instead of merely saying that a disease phenotype is “noisy,” you can show exactly which inputs and operations contribute to it.

## Selection bias enters through the domain of the phenotype

Suppose a trait is observed only when

\[
R_T=1.
\]

If the probability of \(R_T=1\) depends on causes of both the exposure and outcome, restricting the analysis to people with observed values may introduce selection bias.

In the simplest schematic case:

\[
A\longrightarrow R_T\longleftarrow Y.
\]

Analyzing only individuals for whom \(R_T=1\) conditions on a common effect of \(A\) and \(Y\), potentially inducing an association between them even when the relevant causal association is absent. Conditioning on a common effect is a standard collider mechanism for selection bias. :chatgpt-content-reference{index="1"}

For phenotypes, \(R_T\) might represent:

- completing the mental-health questionnaire;
- receiving a particular laboratory test;
- having a usable MRI;
- returning for follow-up;
- receiving a diagnostic code;
- having sufficient records for a machine-learning phenotype;
- surviving long enough for the trait to be measured.

This makes the earlier partial-profile idea considerably stronger. The set \(F\) is not merely an administrative list of available columns. It can be a **random, endogenous observation domain**:

\[
F_{x,c}
=
F(x,c,G,E,B_x,\ldots).
\]

Thus:

> Missingness is not a trait value, but the process determining whether a trait enters the profile is part of the causal system.

## Transportability actually contains two different questions

Suppose a source study and target study both claim to measure “depression,” but use different phenotype-construction procedures:

\[
T_s=d_s\circ M_s,
\]

\[
T_t=d_t\circ M_t.
\]

The source causal estimand might be

\[
\theta_s(a)
=
\mathbb E_s
\left[
T_s(X)\mid\operatorname{do}(A=a)
\right],
\]

while the target estimand is

\[
\theta_t(a)
=
\mathbb E_t
\left[
T_t(X)\mid\operatorname{do}(A=a)
\right].
\]

Before asking whether the causal result transports, you have to ask whether \(T_s\) and \(T_t\) are even the same outcome.

That creates two layers of transportability.

### Phenotype or measurement transportability

Are the two trait operators equivalent, or can one be translated into the other?

A strong condition would be

\[
T_s(x)=T_t(x)
\]

for all relevant \(x\).

A weaker condition would be that there exists a calibration or translation function \(h_{s\to t}\) such that

\[
T_t(x)
=
h_{s\to t}\bigl(T_s(x),Z(x)\bigr),
\]

where \(Z\) contains any variables needed for the translation.

Diagrammatically, you want something like a commuting relationship:

\[
\begin{array}{ccc}
\mathcal X & \xrightarrow{T_s} & V_s\\
\Vert & & \downarrow h_{s\to t}\\
\mathcal X & \xrightarrow{T_t} & V_t
\end{array}
\]

so that

\[
T_t
=
h_{s\to t}\circ T_s.
\]

When no such stable relationship exists, the studies may not share an outcome estimand even though they use the same label.

### Causal transportability

Once the outcome has been aligned, can the causal effect estimated in the source population be transported to the target population?

That requires reasoning about which causal mechanisms, covariate distributions, and selection processes differ between source and target. Causal transportability and data-fusion methods formalize this second problem using causal diagrams and assumptions about differences between populations. :chatgpt-content-reference{index="2"}

Your framework therefore inserts a logically prior question:

\[
\boxed{
\text{Can the causal result transport?}
}
\]

must be preceded by

\[
\boxed{
\text{Does the phenotype itself transport?}
}
\]

That is an excellent central insight.

## Different kinds of phenotype equivalence

You could make this precise by defining several levels of equivalence.

Two traits may have **label equivalence**:

\[
\operatorname{name}(T_1)
=
\operatorname{name}(T_2),
\]

while still being different functions.

They may be **observationally equivalent in one population**:

\[
T_1(X)=T_2(X)
\quad\text{almost surely under }P_s,
\]

but not in another population \(P_t\).

They may be related through a calibration map:

\[
T_2=h\circ T_1.
\]

And the strongest relevant notion might be **interventional equivalence**:

\[
P\!\left(T_1\mid\operatorname{do}(A=a)\right)
=
P\!\left(T_2\mid\operatorname{do}(A=a)\right)
\]

for every intervention \(a\) relevant to the scientific question.

Two phenotype definitions can agree perfectly in an observational source dataset yet diverge under an intervention or in a new population. That is exactly where the algebra and causal theory begin to reinforce each other.

## A useful caution

The trait algebra does not itself solve confounding, identify causal effects, or guarantee transportability.

Its role is more foundational:

> It makes explicit what each causal variable denotes and exposes the measurement, derivation, missingness, and selection mechanisms that an identification argument must account for.

I would be careful not to collapse all phenotype problems into “confounding.” The framework lets you distinguish:

\[
\begin{aligned}
\text{confounding}
&= \text{a common-cause problem for a causal query},\\
\text{selection bias}
&= \text{a problem induced by conditioning or sampling},\\
\text{measurement non-equivalence}
&= \text{different observational functions},\\
\text{transportability}
&= \text{differences between source and target systems},\\
\text{derivational dependence}
&= \text{one trait being defined from others}.
\end{aligned}
\]

The unification is not that these are all the same bias. It is that they can all be represented within one language of typed, context-dependent phenotype construction.

## This strengthens the *Nature Genetics* case

The central claim could now be:

> **Every genotype–phenotype association is indexed by a phenotype-construction operator and an observation mechanism.**

Instead of thinking only in terms of

\[
\widehat\beta_{G,Y},
\]

you are really estimating something closer to

\[
\widehat\beta_
{
G,\,
T
}^{\,P,C,D,R,S},
\]

where:

- \(P\) is the population;
- \(C\) is the observational context;
- \(D\) is the derivation procedure;
- \(R\) is the trait-recording mechanism;
- \(S\) is the study-selection mechanism.

On this view, “the heritability of depression” is incomplete shorthand. The mathematical object is the heritability of a particular depression trait operator, in a particular population and observational context:

\[
h^2\!\left(T_{\text{depression}}^{\,P,C,D}\right).
\]

The current *Nature Genetics* interest in heritable confounding is both validation and a positioning constraint: your paper should not merely restate that EHR and self-report phenotypes can be biased. It should show that this is one instance of a more general failure to distinguish biological causation, measurement, derivation, and selection. :chatgpt-content-reference{index="3"}

## The paper’s strongest formulation

I would now describe the project as:

> **A compositional and causal semantics of traits and phenotypes.**

And the one-paragraph thesis could be:

> Causal genetics treats phenotypes as variables, but rarely specifies the observational and computational operations that make those variables. Modern phenotypes are generated through instruments, questionnaires, clinical encounters, imaging pipelines, temporal aggregation, imputation and machine-learning models, while their availability depends on non-random processes of participation and measurement. We propose that traits be represented as typed, context-dependent observable functions, that derived traits preserve their compositional structure, and that observed phenotype profiles be represented as partial evaluations whose domains are themselves causally generated. This separates biological causation from measurement, derivation and selection; distinguishes phenotype transportability from causal transportability; and provides a common language for identifying confounding, selection bias and failures of cross-study phenotype alignment.

A strong title is:

# **The causal semantics of phenotype**

with a more explanatory subtitle:

## **Traits as composable observables for transportable genetic inference**

That feels substantially more novel and more consequential than “an algebra of phenotype” alone.

---

## 2026-09-02T23:19:32.407Z — a5167da4-b325-4949-8a68-1e08c34f4e9b

### User

I think I would want to separate these out into two papers. One more genetics focused introducing the algebra, building and diagnosising the general problem, showing the problem exists generally and showing how the algebra helps to resolve it in a perspective. And then like an AI ML paper in the causality venue showing transportability in this context, where we can get more into the theory

### Assistant

Yes—**that is the cleaner and more powerful two-paper program**.

The papers should be divided by the scientific question they answer:

\[
\boxed{
\begin{aligned}
\text{Paper 1:}&&\text{What is a phenotype?}\\
\text{Paper 2:}&&\text{When does a causal result about one phenotype construction}\\
&&\text{remain valid for another phenotype construction?}
\end{aligned}
}
\]

That is a real conceptual progression rather than slicing one manuscript into two pieces.

| | Genetics Perspective | Causal ML paper |
|---|---|---|
| Central object | Traits and phenotype profiles | Causal estimands over phenotype constructions |
| Main problem | Biology treats heterogeneous objects as interchangeable “phenotypes” | Transportability usually begins after variables have already been aligned |
| Main contribution | Typed, compositional trait algebra | Identification and estimation across different trait operators |
| Evidence | Examples and structured diagnosis across genetics | Theorems, counterexamples, simulations, empirical benchmark |
| Primary audience | Geneticists, phenomics, biobanks, ontology developers | Causal inference and machine-learning researchers |
| Natural target | *Nature Genetics* Perspective | CLeaR, UAI, then perhaps JMLR |

## Paper 1: the genetics Perspective

### Recommended framing

I would call it something like:

# **The phenotype side of the genotype–phenotype map**

The central claim would be:

> Genetics has developed increasingly precise representations of genotype while continuing to treat phenotype as an informally defined column, label or feature vector. This abstraction breaks down when phenotypes include raw observations, computationally derived measurements, diagnoses, multimodal representations and indefinitely extensible combinations of traits.

The algebra is then the proposed resolution:

\[
T:\mathcal X\rightarrow V_T
\]

for a typed trait,

\[
f[T_1,\ldots,T_n](x)
=
f\bigl(T_1(x),\ldots,T_n(x)\bigr)
\]

for a derived trait, and

\[
p_{x,F}
=
\bigl(T(x)\bigr)_{T\in F}
\]

for an observed, generally partial phenotype profile.

The strongest conceptual line is still:

> **A phenotype does not inhabit a fixed feature space. It is a partial evaluation of an open-ended algebra of observables.**

A *Nature Genetics* Perspective is currently limited to 4,000 words and 50 references and is peer reviewed, so it can contain real scholarly formalism but cannot become a mathematical monograph. :chatgpt-content-reference{index="0"}

### The diagnostic structure

The Perspective should show that “phenotype” is currently used for several mathematically different things:

\[
\begin{aligned}
T
&= \text{a trait or observable},\\
T(x)
&= \text{a trait value},\\
O(x)
&= \text{a measurement artifact},\\
f(O(x))
&= \text{a derived measurement},\\
d(f(O(x)))
&= \text{a classification or diagnosis},\\
p_{x,F}
&= \text{a profile of multiple trait values}.
\end{aligned}
\]

All of these may legitimately participate in phenotypic description, but they are not interchangeable.

The paper could organize the general problem into five failures.

**Type collapse:** a trait, its value, the evidence used to determine it, and a downstream classification are all called “phenotypes.”

**Derivation erasure:** BMI, polygenic scores, imaging-derived measurements and ML classifications are treated as independent coordinates even though they are functions of other observations.

**Semantic aliasing:** two studies use the same phenotype label while applying different operational procedures:

\[
\operatorname{name}(T_1)=\operatorname{name}(T_2)
\quad\not\Rightarrow\quad
T_1=T_2.
\]

**Context erasure:** instrument, protocol, time, environment and preprocessing are removed from the phenotype definition.

**Domain collapse:** unmeasured, unavailable, inapplicable and biologically absent are all encoded as ordinary values or generic missingness.

### How to show that the problem exists generally

I would build an internal audit matrix using examples from several phenotype-producing systems:

- Mendelian phenotype ontologies;
- GWAS and biobank variables;
- EHR-derived disease phenotypes;
- imaging-derived phenotypes;
- single-cell and spatial cell-state classifications;
- questionnaire and self-report traits;
- AI-derived embeddings, clusters and risk scores.

For each example, record:

\[
(\text{bearer},\text{observation},\text{context},\text{value type},
\text{derivation},\text{availability mechanism}).
\]

You do not necessarily need to present this as a large original empirical study. For a Perspective, it can be an evidence map from which you select a small number of decisive examples. The point is to show that the problem recurs across domains, not merely that one ontology uses confusing terminology.

### What the Perspective should propose

The practical recommendation could be that a trait specification minimally includes:

\[
T=
(B_T,M_T,C_T,V_T,D_T),
\]

where:

\[
\begin{aligned}
B_T &= \text{type of biological bearer},\\
M_T &= \text{observation or measurement operation},\\
C_T &= \text{observational context},\\
V_T &= \text{typed value space},\\
D_T &= \text{derivation and provenance}.
\end{aligned}
\]

Then the phenotype profile is not a bag of labels but a typed partial evaluation of those trait specifications.

The causal consequences belong in the Perspective, but only as a forward-looking section:

> Failure to preserve phenotype construction can generate apparent non-replication, heritable confounding, selection effects and failed transportability.

You would introduce those consequences but **not derive identification formulas**. That material belongs to Paper 2.

## Paper 2: transportability across phenotype constructions

This paper should not merely be “the causal implications of the algebra.” That would sound like a conceptual sequel.

It should define a new technical problem:

> **How can a causal estimand be identified in a target domain when the source and target do not observe the same phenotype operator?**

### The basic problem

Let \(e\in\{s,t\}\) identify the source and target environments.

Suppose \(B_e^a\) is the biological state that would occur under intervention \(A=a\). The two environments construct outcomes using different traits:

\[
T_s:\mathcal B\rightarrow V_s,
\qquad
T_t:\mathcal B\rightarrow V_t.
\]

The observed outcomes are:

\[
Y_s=T_s(B_s),
\qquad
Y_t=T_t(B_t).
\]

The target causal estimand might be

\[
\psi_t(a)
=
\mathbb E_t\left[
\ell_t\bigl(T_t(B_t^a)\bigr)
\right].
\]

But the experimental or high-quality causal data may contain only

\[
T_s(B_s^a).
\]

This exposes two distinct transport problems.

First, does the biological response transport?

\[
P_s(B^a\mid Z)
\overset{?}{=}
P_t(B^a\mid Z).
\]

Second, does the phenotype construction transport?

\[
T_s
\overset{?}{\longrightarrow}
T_t.
\]

Ordinary causal transportability is insufficient unless the second question has already been resolved.

### Phenotype bridges

Suppose there is a phenotype translation function

\[
h_{s\rightarrow t}:V_s\times\mathcal Z\rightarrow V_t
\]

such that

\[
T_t(B^a)
=
h_{s\rightarrow t}\bigl(T_s(B^a),Z\bigr).
\]

Then, under suitable conditional transportability and positivity conditions, a target mean could have a form such as

\[
\psi_t(a)
=
\mathbb E_{Z\sim P_t}
\left[
\mathbb E_s
\left[
\ell_t\left(
h_{s\rightarrow t}(Y_s,Z)
\right)
\mid A=a,Z
\right]
\right].
\]

That formula makes the conceptual decomposition explicit:

1. estimate the intervention response in the source;
2. translate the source phenotype construction into the target construction;
3. average over the target population.

The full paper would need to state the assumptions precisely, account for source confounding when treatment is not randomized, and include study and observation selection variables.

### Where the trait algebra becomes theoretically useful

The really distinctive result could come from using **maps between trait algebras**, rather than arbitrary maps between individual outcome variables.

Let

\[
\mathcal A_s
=
\operatorname{Alg}_{\Sigma_s}(G_s)
\]

and

\[
\mathcal A_t
=
\operatorname{Alg}_{\Sigma_t}(G_t)
\]

be source and target trait algebras generated from their primitive observations.

A phenotype translation would be a typed map

\[
H:\mathcal A_s\rightarrow\mathcal A_t
\]

that preserves admissible composition. Informally,

\[
H\left(f[T_1,\ldots,T_n]\right)
=
f'\left[H(T_1),\ldots,H(T_n)\right].
\]

At the value level, this requires a commuting relationship such as

\[
h_{f[T_1,\ldots,T_n]}
\left(
f_s(v_1,\ldots,v_n)
\right)
=
f_t
\left(
h_{T_1}(v_1),\ldots,h_{T_n}(v_n)
\right).
\]

That gives you a potentially important theorem:

> If a structure-preserving translation is valid for a set of generating traits, then it extends to every finitely composed trait generated from them.

That is much more interesting than learning a separate calibration model for every derived phenotype.

For example, suppose two studies use different units or instruments for height and weight. If the primitive translations are valid and preserve the BMI operation, then the translation of BMI is induced automatically:

\[
H(\operatorname{BMI})
=
H\left(\frac{W}{H^2}\right)
=
\frac{H(W)}{H(H)^2}.
\]

The paper can investigate when this compositional extension is observationally valid, interventionally valid, or only approximately valid.

## A plausible theorem package

The technical paper could be structured around four main results.

### 1. A non-identification result

Show that even perfect observational agreement between two phenotype constructions does not guarantee agreement under intervention:

\[
T_s(B)=T_t(B)
\quad\text{almost surely observationally}
\]

does not imply

\[
T_s(B^a)=T_t(B^a).
\]

A counterexample would immediately establish why ordinary phenotype harmonization is not enough for causal transport.

### 2. An identification theorem

Provide sufficient conditions under which

\[
\mathbb E_t[T_t(B^a)]
\]

is identifiable from source experimental data, target observational covariates and bridge data connecting \(T_s\) with \(T_t\).

### 3. A compositional transport theorem

Show that interventionally valid translation on a generating set extends to derived traits when the translation preserves the relevant operations.

This is where the algebra earns its place in the technical paper rather than serving as decorative notation.

### 4. Approximate transportability bounds

In realistic settings,

\[
T_t
\neq
h\circ T_s
\]

exactly. You could derive a bound decomposing transported-effect error into:

\[
\text{total error}
\leq
\text{biological transport error}
+
\text{phenotype translation error}
+
\text{selection/observation error}
+
\text{estimation error}.
\]

That decomposition would be useful both theoretically and practically.

## Confounding and selection fit naturally, but should not consume the paper

The full observational system could include:

\[
A\leftarrow Z\rightarrow B
\]

for treatment–outcome confounding,

\[
B\xrightarrow{T_e}Y_e
\]

for phenotype construction,

\[
R_e
\]

for whether the phenotype is recorded, and

\[
S_e
\]

for whether the individual enters the study.

The observed phenotype domain becomes

\[
F_{x,e}
=
\{T\in\mathcal T_e:R_T(x,e)=1\}.
\]

This gives you a language for saying that the set of observed phenotype coordinates is itself causally generated.

But I would keep the hierarchy clear:

> The trait algebra does not itself remove confounding or selection bias. It exposes the variables, operations and observation mechanisms that the causal model must represent.

The first technical paper should probably make phenotype-construction transportability the principal contribution. Confounding is handled through ordinary identification assumptions, and selection is either one main extension or a substantial appendix. Trying to solve all forms of confounding, measurement error, missingness, selection and transportability at once would make the contribution harder to recognize.

## The novelty boundary is important

You will need to position Paper 2 carefully against three existing areas.

### Causal abstraction

Causal abstraction already studies transformations between causal models, including mappings from low-level measurements to higher-level variables, maps between interventions, soft interventions and compositional model transformations. :chatgpt-content-reference{index="1"}

So the claim cannot simply be:

> “We introduce maps between differently defined causal variables.”

That territory already exists.

Your more defensible contribution is:

> We introduce biologically grounded, typed algebras of observables and study causal transport when source and target phenotype variables arise from different measurement and derivation systems. The algebra restricts admissible translations, preserves provenance and composition, and allows transport conditions to be checked or extended from primitive to derived traits.

There is also a very recent August 2026 preprint, *Generalised Transportability via Causal Abstractions*, that aligns source and target models across interventional behavior. Its stated setup assumes that source and target share variables, graph and interventions and differ at known mechanisms. :chatgpt-content-reference{index="2"}

That gives you a particularly clean distinction:

\[
\begin{aligned}
\text{their problem:}&\quad
\text{transport across changing mechanisms with aligned variables},\\
\text{your problem:}&\quad
\text{transport when the phenotype variables themselves are differently constructed}.
\end{aligned}
\]

Earlier causal abstraction work means you should not overstate that distinction as universally absent, but the trait-algebra and phenotype-construction formulation is still meaningfully different.

### Measurement-error transportability

There is already work on transporting outcome measurement-error corrections from validation studies into intervention trials. :chatgpt-content-reference{index="3"}

Your scope is broader than classical measurement error because:

- source and target outcomes may have different value spaces;
- neither phenotype need be designated the single “true” outcome;
- traits may be deterministic or stochastic composites of many observations;
- the mapping may need to preserve interventions and trait composition;
- the phenotype profile may be partial and dynamically extended.

### Existing uses of “phenotype transportability”

The phrase is not entirely unused. Recent work, for example, evaluates whether perturbation effects on in-vitro cellular phenotypes transport to in-vivo human phenotypes. :chatgpt-content-reference{index="4"}

I would therefore use the more precise working phrase:

# **Transportability across phenotype constructions**

That tells readers exactly what is new.

## Making Paper 2 genuinely ML-facing

A pure identification paper would fit causal inference, but not necessarily broader machine learning. The ML component should be the problem of learning the phenotype bridge:

\[
h_\theta:V_s\times Z\rightarrow V_t
\]

from limited bridge data.

A strong system might:

- learn \(h_\theta\) from individuals or specimens measured under both systems;
- constrain \(h_\theta\) to preserve known trait operations;
- use high-dimensional observations such as images, signals or embeddings;
- propagate uncertainty in \(h_\theta\) into the transported causal estimate;
- use cross-fitting or sample splitting so flexible ML nuisance estimators do not invalidate inference.

Then the paper is not merely “causal inference applied to phenotype semantics.” It becomes a new causal learning task:

> Learn a structure-preserving map between observational systems sufficient to transport a target causal estimand.

## Venue strategy for Paper 2

**CLeaR** is the most natural first conference target. Its remit explicitly joins theory, methods and applications at the intersection of causal discovery, causal inference and modern machine learning. :chatgpt-content-reference{index="5"}

**UAI** becomes especially attractive if the paper emphasizes graphical identification, uncertain phenotype mappings, partial observations and probabilistic reasoning. UAI describes its core as knowledge representation, learning and reasoning under uncertainty. :chatgpt-content-reference{index="6"}

A mature journal version could fit **JMLR** if it includes a new analytical framework, a formal learning problem, algorithms and sound empirical validation; those are all explicitly within JMLR’s stated scope. :chatgpt-content-reference{index="7"}

My hierarchy would be:

\[
\text{CLeaR}
\rightarrow
\text{expanded JMLR version}
\]

or

\[
\text{UAI}
\rightarrow
\text{expanded JMLR version}.
\]

## The firewall between the papers

The genetics Perspective should contain:

\[
\text{problem diagnosis}
+
\text{biological semantics}
+
\text{minimal algebra}
+
\text{research agenda}.
\]

The causal paper should contain:

\[
\text{formal source–target problem}
+
\text{identification theory}
+
\text{estimators}
+
\text{experiments}.
\]

Paper 1 can say:

> Different phenotype constructions may not support transport of the same causal claim.

But it should stop there.

Paper 2 can begin:

> Building on the typed trait formalism, we study the conditions under which causal estimands can be transported across phenotype constructions.

That makes Paper 2 dependent on the idea, but not dependent on Paper 1 having already been published. It must restate all necessary definitions compactly and remain mathematically standalone.

## Recommended titles

For the genetics Perspective:

# **The phenotype side of the genotype–phenotype map**

Alternative:

# **Phenotypes do not inhabit a fixed feature space**

For the causal paper:

# **Transporting causal effects across phenotype constructions**

More technical alternative:

# **Causal transport through compositional trait algebras**

Together, they form a coherent research program:

\[
\boxed{
\text{First define the phenotype side of the map; then determine when causal claims over that map transport.}
}
\]

I would develop the two prospectuses in parallel. The causal theory will reveal where the algebra needs to be more precise, while the genetics Perspective will keep the formal work tied to a biological problem rather than drifting into abstract model transformations. Nature Genetics explicitly allows preprints without treating them as prior publication, so the two manuscripts can ultimately be released as distinct companion preprints as long as their contributions and text remain clearly separate. :chatgpt-content-reference{index="8"}

---

## 2026-09-04T23:12:46.471Z — 12d331f2-e822-4476-adb6-ad0c67b55551

### User

This is all great, I am working on a section in the paper introduction, about why ontologies can't solve the problems that our algebra can. and I want to brainstorm.

### Assistant

Yes. The key is to avoid saying “ontologies are bad” or “ontologies cannot represent composition.” That would be too easy to attack. The stronger argument is:

> **Ontologies solve a different problem. They organize and relate concepts; the algebra specifies how observables are constructed, evaluated, composed, and restricted on individual biological states.**

That distinction is much harder to dismiss.

A useful way to think about it is that an ontology is primarily **intensional**: it says what kinds of things exist in the vocabulary and how those kinds relate. Your algebra is primarily **operational/extensional**: it says how a trait acts on a bearer and produces a value.

For example, an ontology can represent that BMI is a kind of anthropometric measurement and is related to height and weight. But your algebra can state the stronger relation

\[
\operatorname{BMI}
=
f[\operatorname{Weight},\operatorname{Height}]
\]

where

\[
f(w,h)=\frac{w}{h^2},
\]

and therefore require, for every individual \(x\),

\[
p_x(\operatorname{BMI})
=
\frac{
p_x(\operatorname{Weight})
}{
p_x(\operatorname{Height})^2
}.
\]

That is not just a semantic relation between three concepts. It is a constraint on every valid phenotype evaluation.

I think there are several distinct gaps you can develop.

### Ontologies describe relationships; the algebra gives executable semantics

An ontology might assert:

\[
\text{BMI}\;\texttt{depends\_on}\;\text{height}
\]

or represent BMI through a network of entities, qualities, and relations.

But “depends on” does not tell you the transformation.

Your algebra says:

\[
T_3=f[T_1,T_2].
\]

That immediately determines the value of \(T_3\) whenever \(T_1\) and \(T_2\) are known.

So one line for the paper might be:

> Ontological relations are generally declarative; trait composition requires operational semantics.

Or more sharply:

> Knowing that two traits are semantically related does not specify the function by which one trait is constructed from the others.

### Ontologies tend to reify derived traits as additional concepts

This one is important.

Once someone decides BMI, waist-to-hip ratio, tumor burden, frailty score, or an imaging-derived feature matters, an ontology can add another node for it.

You get something like:

\[
\text{Height}
\qquad
\text{Weight}
\qquad
\text{BMI}.
\]

But structurally BMI now looks like just another trait alongside height and weight.

Your algebra preserves the fact that it is **not an independent coordinate**:

\[
B=f[W,H].
\]

So phenotype space is constrained:

\[
p_x(B)=f(p_x(W),p_x(H)).
\]

That matters statistically and causally. Treating all three as independent phenotype dimensions hides deterministic dependence.

This could become a strong argument:

> Ontologies can name derived phenotypes, but naming a derived phenotype tends to flatten its generative structure. An algebra retains the derivation as part of the identity of the trait.

### The algebra lets you generate new traits without extending a central vocabulary

This gets directly at your “no canonical trait set” intuition.

With an ontology, historically the workflow is often:

1. someone identifies a concept;
2. the concept gets defined;
3. it is assigned an identifier;
4. relationships are curated;
5. the ontology expands.

That is appropriate for stable shared vocabulary.

But your algebra says:

\[
T_1,T_2\in\mathcal T,
\quad
f\in\Sigma
\quad\Rightarrow\quad
f[T_1,T_2]\in\mathcal T.
\]

You don't need a committee to assign a canonical identifier to every possible composition beforehand.

An analysis can construct

\[
T^\star=f[g[T_1,T_2],T_7,T_{11}]
\]

at runtime.

That is particularly important in computational biology and AI because the number of possible derived observables is effectively unbounded.

This might be the core “why now” argument:

> Ontologies scale by extending the vocabulary; an algebra scales by extending the grammar.

That sentence is potentially very good.

Because a vocabulary tries to enumerate useful things:

\[
\{T_1,T_2,T_3,\ldots\},
\]

whereas a grammar defines rules for constructing things:

\[
T ::= T_i \mid f(T_1,\ldots,T_n).
\]

That is a very clean conceptual distinction.

### Ontologies usually encode types better than values

An ontology might represent:

> “height” is a quantitative trait.

But your phenotype requires an evaluation:

\[
\operatorname{Height}(x)=1.82\text{ m}.
\]

Those are different levels.

You have:

\[
T:\mathcal X\rightarrow V_T
\]

and

\[
T(x)\in V_T.
\]

An ontology can absolutely represent individuals and data values, especially with OWL assertions or RDF data properties, but that is not normally the organizing abstraction of phenotype ontologies. They principally give semantic identities and relationships to concepts.

Your algebra starts from the evaluation relation itself.

So:

> An ontology primarily specifies what a trait means; the algebra specifies what it means to instantiate that trait in a particular bearer.

### Partial phenotype profiles are natural in the algebra

You have this:

\[
p_{x,F}
=
p_x|_F,
\qquad
F\subseteq\mathcal T.
\]

The phenotype record has a domain.

That cleanly says:

> These are the traits we actually evaluated.

An ontology can certainly represent missingness, availability, or observation events, but you typically have to introduce explicit concepts for them.

The algebra makes partiality intrinsic:

\[
p_x:F\rightharpoonup V.
\]

This may sound technical, but it has a major conceptual consequence:

> The absence of a trait from an observed profile is not itself a trait value.

That distinction is fundamental for biobanks and clinical data.

### Context extension is structural rather than versioning

Suppose:

\[
\mathcal T_C\hookrightarrow\mathcal T_D.
\]

The richer context \(D\) introduces additional traits. Then phenotype profiles satisfy:

\[
p_x^D|_{\mathcal T_C}=p_x^C.
\]

This gives you an explicit mathematical notion of what it means for one phenotype description to refine another.

Ontologies have mechanisms such as imports, mappings, versioning, subclass relations, and equivalence relations. But those do not automatically impose this evaluation-level compatibility.

You can therefore say:

> Ontologies provide mappings between vocabularies; the algebra provides restriction maps between phenotype descriptions.

That distinction could become very useful later for transportability too.

### Ontologies do not by themselves distinguish semantic equivalence from operational equivalence

This may be one of your strongest genetics points.

Two resources can map their variables to the same ontology concept:

\[
T_A
\longrightarrow
\texttt{MajorDepressiveDisorder}
\]

and

\[
T_B
\longrightarrow
\texttt{MajorDepressiveDisorder}.
\]

But perhaps

\[
T_A(x)
=
f(\text{clinical interview}),
\]

while

\[
T_B(x)
=
g(\text{EHR codes},\text{medications}).
\]

The ontology mapping says these variables concern the same conceptual phenotype.

It does **not** imply:

\[
T_A=T_B.
\]

And definitely not:

\[
T_A(x)=T_B(x)
\]

for all \(x\).

This is enormous for cross-study genetics.

You could phrase it:

> Ontological alignment establishes conceptual comparability, not observational equivalence.

Or:

> Two phenotype variables may share an ontology identifier while denoting different observable functions.

That is precisely the gap your later transportability paper can exploit.

### Ontologies do not automatically preserve provenance of phenotype construction

Suppose:

\[
I
\xrightarrow{S}
M
\xrightarrow{V}
T.
\]

MRI image \(\rightarrow\) segmentation \(\rightarrow\) region measurement \(\rightarrow\) phenotype.

An ontology can represent all of those entities and relationships. PROV-O or workflow ontologies can represent provenance.

But now you need several representational systems cooperating:

\[
\text{phenotype ontology}
+
\text{workflow ontology}
+
\text{provenance model}
+
\text{data schema}.
\]

Your algebra says that construction itself is part of the trait:

\[
T=V\circ S\circ I.
\]

That is a subtle but powerful difference.

The claim shouldn't be that ontologies cannot encode provenance. They can.

The claim is:

> In the algebra, derivational provenance is constitutive of the observable rather than auxiliary metadata attached to a phenotype concept.

That's stronger and much more defensible.

### Ontologies are open-world; your algebra imposes constraints

This might also be useful, especially if you discuss OWL.

OWL uses open-world semantics: absence of an assertion does not imply falsity. It is very good for knowledge integration.

But your algebra wants equations:

\[
B=f[W,H].
\]

Once \(W(x)\) and \(H(x)\) are fixed, \(B(x)\) is constrained.

Similarly:

\[
T_3=g[T_1,T_2]
\]

means certain phenotype assignments are invalid.

The Cartesian product

\[
V_1\times V_2\times V_3
\]

contains all formal triples, but the realizable phenotype space lies on the constraint surface

\[
V_3=g(V_1,V_2).
\]

That is an algebraic property.

Ontologies can encode some logical restrictions and cardinality constraints, and rule systems can add further inferential power, so again don't say “OWL cannot constrain things.”

Say instead:

> Logical consistency among concepts is different from algebraic consistency among evaluated trait values.

I really like that distinction.

---

I think the overarching paragraph could eventually become something like:

> Existing phenotype ontologies are indispensable for identifying, classifying and relating biological concepts, but they do not by themselves provide a calculus of phenotype construction. An ontology can establish that two measurements concern the same biological attribute, or that one phenotype concept is related to another, while leaving unspecified the observable functions by which values are produced and derived. This distinction becomes consequential when traits are computationally composed. BMI, for example, may be represented as a phenotype concept alongside height and weight, but its value is constrained by the algebraic relation \(B(x)=W(x)/H(x)^2\). Treating all three simply as ontology terms obscures this dependence. More generally, ontologies scale by extending a vocabulary of named concepts; an algebra scales by defining a grammar through which new observables can be constructed. This permits phenotype spaces to remain indefinitely extensible without requiring every possible derived trait to be enumerated in advance.

I would then follow it with the genetics-specific punch:

> Nor does shared ontology annotation establish phenotype equivalence. Two variables can map to the same disease or trait concept while being produced by different questionnaires, clinical criteria, instruments or computational pipelines. They are semantically aligned but represent different functions \(T_1,T_2:\mathcal X\rightarrow V\). The distinction is invisible when phenotype harmonization stops at ontology mapping, but it is essential for determining whether genetic associations estimated with \(T_1\) can be interpreted, replicated or transported with respect to \(T_2\).

That second paragraph is probably where the paper starts feeling less like “another semantic-web framework” and more like a **genetics argument**.

The single sentence I would build the section around is:

> **Ontologies tell us how phenotype concepts are related; an algebra tells us how phenotypes are constructed.**

And perhaps the more provocative version:

> **A vocabulary can name an indefinitely large collection of traits; only a grammar can explain how that collection is indefinitely extensible.**

That, to me, is the central distinction worth pushing.

---

## 2026-09-05T01:15:57.929Z — 72c6bc7c-6812-4685-85fe-bc582aa9fc7d

### User

So in a nature genetics perspective piece, I see there is often like a Box 1 and a Box 2, and I am wondering if we can brainstorm what should go in those boxes, seems like central definitions, etc. Doesn't have to be related to the ontology brainstorm we just did

### Assistant

Yes. For this paper, I would use the boxes to do two jobs that the main text should not have to keep stopping to explain.

Nature Genetics uses boxes pretty flexibly: some are glossaries, some define a conceptual framework, and others isolate an example, methodology, or set of recommendations. They work best when they are **self-contained reference objects** rather than mini-sections of the narrative. :chatgpt-content-reference{index="0"}

For your Perspective, my favorite structure would be:

## Box 1 — A formal vocabulary for traits and phenotypes

This should be the compact “reader can keep coming back to this” box.

I would put the core definitions here:

\[
\mathcal X
=
\text{space of biological individuals or states}
\]

\[
T:\mathcal X\rightarrow V_T
\]

**Trait:** a typed observable function mapping a biological bearer or state to a value in a trait-specific value space.

\[
T(x)\in V_T
\]

**Trait value:** the value obtained by evaluating trait \(T\) on \(x\).

Then:

\[
p_x^{\mathcal T}
=
\bigl(T(x)\bigr)_{T\in\mathcal T}
\]

**Phenotype profile:** the assignment of trait values to an individual relative to a specified trait vocabulary \(\mathcal T\).

And for actual observations:

\[
p_{x,F}
=
\bigl(T(x)\bigr)_{T\in F},
\qquad
F\subseteq\mathcal T
\]

**Observed phenotype profile:** a partial phenotype profile containing only those traits actually evaluated.

Then composition:

\[
T^\star
=
f[T_1,\ldots,T_n]
\]

with

\[
T^\star(x)
=
f\left(T_1(x),\ldots,T_n(x)\right).
\]

**Derived trait:** a trait constructed through an admissible operation on existing traits.

Then extensibility:

\[
\mathcal T_C\hookrightarrow\mathcal T_D
\]

**Trait context:** a context-relative vocabulary of observables that may be extended without assuming a final universal set of traits.

You could end Box 1 with one tiny worked example:

\[
H(x)=1.8\text{ m},
\qquad
W(x)=90\text{ kg}
\]

and

\[
B=\frac{W}{H^2},
\]

so

\[
B(x)=27.8\,\mathrm{kg/m^2}.
\]

The important point would be:

> \(H\), \(W\), and \(B\) are all traits, but \(B\) is not an independent phenotypic coordinate: its value is constrained by the derivation \(B=W/H^2\).

That example makes the whole algebra click.

I might title this box:

### **Box 1 | A compositional vocabulary of phenotype**

rather than “Definitions,” because it sounds less textbook-like.

---

## Box 2 — What changes when phenotype is treated as an algebra?

I would **not** make Box 2 another definitions box. This is where you show why anyone in genetics should care.

I think it could be organized as a comparison between the conventional feature-table view and your algebraic view.

Something like:

| Conventional representation | Trait-algebra representation |
|---|---|
| Phenotype = column or label | Phenotype = evaluation of an observable |
| Trait identity defined by name/ontology term | Trait identity includes value type and construction |
| Derived traits become additional columns | Derived traits retain their functional dependence |
| All phenotype variables appear independent structurally | Algebra records deterministic/computational dependencies |
| Missing values occupy cells | Unobserved traits are absent from the profile domain |
| Same label suggests same phenotype | Same label may refer to different observable functions |
| Phenotype vocabulary treated as predefined | Trait space can be extended compositionally |
| Harmonization maps labels | Harmonization can compare construction/evaluation operators |

And then perhaps four short consequences.

### 1. Derived traits are not independent dimensions

\[
B=f[W,H]
\]

implies

\[
p_x(B)=f(p_x(W),p_x(H)).
\]

So phenotype space is constrained.

### 2. Equal labels do not imply equal traits

Two studies may both record “depression”:

\[
T_A:\mathcal X\rightarrow\{0,1\}
\]

from a structured clinical interview, while

\[
T_B:\mathcal X\rightarrow\{0,1\}
\]

is computed from EHR codes.

Even though

\[
\operatorname{name}(T_A)=\operatorname{name}(T_B),
\]

it need not follow that

\[
T_A=T_B.
\]

This is a very genetics-relevant example.

### 3. Phenotype observation is generally partial

\[
\operatorname{dom}(p_x^{\mathrm{obs}})=F_x.
\]

“Not measured” is therefore different from a biological value such as “absent.”

### 4. Trait vocabularies need not be closed

New measurements or computations can introduce

\[
T_{new}=f[T_1,\ldots,T_n]
\]

without requiring a pre-enumerated universal phenotype vocabulary.

This box is effectively your **argument in miniature**.

A good title might be:

### **Box 2 | From phenotype tables to phenotype algebra**

or

### **Box 2 | What a trait algebra makes explicit**

I prefer the latter because it avoids implying people literally need to abandon tables.

---

There are also two alternative Box 2 ideas that could be even stronger depending on how the manuscript develops.

### Alternative Box 2: “Five phenotype failures in contemporary genetics”

This could be punchier editorially:

**Type collapse**  
Trait, trait value, measurement, derived quantity and diagnosis are all called phenotypes.

**Derivation erasure**  
Computationally constructed phenotypes are represented as independent variables.

**Semantic aliasing**  
Identically named phenotypes correspond to different operational definitions.

**Context erasure**  
Measurement instrument, protocol, time and environment are separated from trait identity.

**Domain collapse**  
Unmeasured, absent, inapplicable and unavailable values are conflated.

Then show underneath each one how the algebra resolves it.

This has a very *Perspective* feel because it diagnoses the field.

### Alternative Box 2: “One phenotype, many constructions”

Take a single clinically relevant phenotype—say depression, obesity, or hypertension—and follow it through multiple definitions.

For obesity, for example:

\[
W:\mathcal X\rightarrow\mathbb R
\]

weight,

\[
H:\mathcal X\rightarrow\mathbb R
\]

height,

\[
B=f[W,H]
\]

BMI,

\[
O=\mathbf 1[B\geq30]
\]

BMI-defined obesity,

versus perhaps

\[
A:\mathcal X\rightarrow\mathbb R
\]

adiposity measured by DEXA,

and

\[
O'=\mathbf 1[A\geq\tau].
\]

Now both \(O\) and \(O'\) may be called “obesity,” but:

\[
O\neq O'.
\]

And different GWAS using them are therefore not literally studying the same trait operator.

That would be **extremely concrete** and might be more memorable than a generic conceptual comparison.

---

If you have only **two boxes**, I think the strongest pairing is:

### **Box 1 | A compositional vocabulary of phenotype**
Definitions + notation + BMI worked example.

### **Box 2 | When are two phenotypes the same?**
This one could address the genetics problem directly:

- same name;
- same ontology term;
- same value space;
- correlated values;
- observational equivalence;
- algebraic/derivational equivalence;
- perhaps eventually interventional equivalence.

For example:

\[
\operatorname{name}(T_1)=\operatorname{name}(T_2)
\]

is the weakest relationship.

Then perhaps

\[
V_{T_1}=V_{T_2}
\]

still does not establish equality.

Even

\[
T_1(X)\approx T_2(X)
\]

in one cohort does not imply

\[
T_1=T_2.
\]

The strongest condition is something like

\[
T_1(x)=T_2(x)
\qquad
\forall x
\]

over the relevant biological domain and context.

This box would naturally set up the replication/harmonization/transportability implications without stealing the second causal paper.

I actually think **“When are two phenotypes the same?” is probably the best Box 2**. It is a question almost every geneticist immediately understands, and the algebra lets you reveal that there are multiple notions of sameness that ordinary phenotype labels obscure.

So structurally I’d aim for:

\[
\boxed{
\begin{aligned}
\text{Box 1:}&\quad \text{What are traits and phenotypes?}\\
\text{Box 2:}&\quad \text{When are two phenotypes the same?}
\end{aligned}
}
\]

Those are almost the two foundational questions the entire Perspective is answering.

---

## 2026-09-05T03:08:05.123Z — ea9b0e38-a9ac-4889-aa0e-055e3c7e56e3

### User

That’s great, so now I’m thinking about my first figure with maybe three panels. The first panel will be a visual explanation of traits and phenotypes and composed traits (don’t need help with that yet), the second panel I think will be going through ontologies like EFO and various branches like OBA and figuring out how many “canonical” and derived traits there are in each ontology as well as in different modalities like the gwas catalog, open targets, etc. and then like a distribution for each derived trait, like how many dependencies it has and also what is the max depth of this dependencies

### Assistant

Yes — and I think **Panel 2 could become the empirical backbone of the entire Perspective** if you design it carefully.

The important thing is to avoid defining “canonical” versus “derived” in a way the ontologies themselves do not encode. Most of these resources are built to classify and harmonize concepts, not to explicitly tell you whether a trait is primitive versus constructed. EFO, for example, is a broad ontology of experimental variables and the GWAS Catalog maps reported traits into EFO while preserving more detailed reported-trait descriptions; OBA is specifically intended as a species-independent ontology of biological attributes. :chatgpt-content-reference{index="0"}

So I would make Panel 2 an **audit of phenotype vocabularies and phenotype construction**, with “derived” defined by *your operational criteria*, not by ontology membership.

A strong three-part internal structure would be:

### Panel 2A — How large are our phenotype vocabularies?

For each source:

\[
\text{EFO},\;
\text{OBA},\;
\text{GWAS Catalog},\;
\text{Open Targets},
\]

and perhaps HPO, UK Biobank fields, PGS Catalog, imaging-derived phenotype sets, etc., show:

- number of distinct phenotype/trait concepts;
- number directly instantiated in studies/data;
- number that can be identified as **constructed or derived**;
- number whose derivation is explicitly represented versus only evident from the label/definition/publication.

A stacked bar would work well:

\[
\boxed{
\text{direct/raw}
\;|\;
\text{derived, explicit}
\;|\;
\text{derived, implicit/unknown}
}
\]

That last category may actually be the most interesting.

For example, GWAS Catalog deliberately retains both normalized EFO traits and more detailed “reported traits,” including experimental design and background-trait information. That is already evidence that a single canonical ontology term often cannot capture the full operational phenotype definition. :chatgpt-content-reference{index="1"}

Open Targets is also conceptually interesting because it has historically chosen to put diseases, phenotypes, and measurements into a unified evidence model rather than enforcing a strict distinction among them. :chatgpt-content-reference{index="2"}

That is almost tailor-made for your argument.

---

### Panel 2B — How compositional are derived traits?

For every trait you classify as derived, construct a dependency graph:

\[
T
=
f[T_1,\ldots,T_k].
\]

Then calculate at least these quantities:

\[
d_{\text{in}}(T)
=
\text{number of immediate dependencies}
\]

and

\[
D(T)
=
\text{maximum derivation depth}.
\]

For example:

\[
\operatorname{BMI}
=
f(W,H)
\]

has immediate dependency count

\[
d_{\text{in}}(\operatorname{BMI})=2
\]

and perhaps depth

\[
D(\operatorname{BMI})=1
\]

if height and weight are treated as roots.

But something like

\[
T
=
g\left(
\operatorname{BMI},
\operatorname{age},
\operatorname{sex},
\operatorname{lab score}
\right)
\]

where

\[
\operatorname{BMI}=f(W,H)
\]

would have a greater depth:

\[
D(T)=2.
\]

A more realistic computational phenotype might look like:

\[
\text{MRI}
\rightarrow
\text{segmentation}
\rightarrow
\text{regional volume}
\rightarrow
\text{normalized volume}
\rightarrow
\text{risk score}
\rightarrow
\text{case classification},
\]

giving a derivation depth of perhaps 5.

Then you could show, by modality, distributions of:

- immediate dependency count;
- total number of ancestral dependencies;
- maximum derivation depth.

I would use something like **violin/ridgeline distributions** rather than a histogram per resource, because the visual question is comparative:

> Which phenotype systems are mostly shallow, and where do deeply constructed traits appear?

---

### Panel 2C — How much of that structure survives in the representation?

This is the part I think could make the figure really powerful.

For each derived trait \(T\), ask whether the resource preserves:

1. **the fact that it is derived**;
2. **its immediate inputs**;
3. **the operation \(f\)**;
4. **its complete derivation graph**.

Then calculate something like a **derivation completeness score**:

\[
C(T)
=
\frac{
\text{represented derivational relations}
}{
\text{known derivational relations}
}.
\]

Or simpler categorical levels:

\[
\begin{aligned}
0 &: \text{trait only},\\
1 &: \text{dependency relationship represented},\\
2 &: \text{inputs represented},\\
3 &: \text{operation represented},\\
4 &: \text{full executable derivation/provenance represented}.
\end{aligned}
\]

Then you might get a striking pattern:

> The more computationally complex the phenotype becomes, the less of its construction survives in the canonical phenotype representation.

That would directly motivate your algebra.

---

## I would be careful with the word “canonical”

I think what you are really contrasting is:

### Atomic representation

A resource treats

\[
T
\]

as a named concept or variable.

versus

### Compositional representation

A resource preserves

\[
T=f[T_1,\ldots,T_n].
\]

So rather than labeling traits “canonical” and “derived,” I'd probably use:

- **non-derived / directly observed**
- **derived**
- **derivation unknown**

because “canonical trait” risks implying a metaphysical primitive that your whole framework is trying not to assume.

A trait such as height is itself not absolutely primitive. It depends on an instrument, protocol, posture, time, perhaps preprocessing:

\[
H
=
h(\text{body},\text{instrument},\text{protocol},\text{context}).
\]

So the distinction is relative to the representation.

You might formally define:

\[
T\text{ is derived relative to }\mathcal G
\]

if there exists some nontrivial composition

\[
T=f[T_1,\ldots,T_n],
\qquad
T_i\in\mathcal G.
\]

That keeps you consistent with the “no canonical base set” idea.

---

## The deepest metric may not be max depth

I like max depth, but I would add **ancestral complexity**.

Define the ancestry of \(T\):

\[
\operatorname{Anc}(T)
=
\{S:S\text{ appears anywhere in the derivation of }T\}.
\]

Then

\[
A(T)
=
|\operatorname{Anc}(T)|.
\]

Now you have three complementary complexity measures:

\[
\boxed{
\begin{aligned}
k(T) &= \text{immediate arity},\\
A(T) &= \text{total ancestral traits},\\
D(T) &= \text{maximum derivation depth}.
\end{aligned}
}
\]

Those capture very different structures.

A trait could have:

- \(k=20\), \(D=1\): a flat 20-variable score;
- \(k=2\), \(D=8\): a deep computational pipeline;
- \(k=5\), \(A=100\), \(D=6\): a highly compositional phenotype.

That is much more informative than a single “derived/not derived” flag.

---

## You could add a “compression ratio”

This might be extremely effective.

Suppose a phenotype is represented in an ontology as one node:

\[
T.
\]

But reconstructing it requires \(A(T)\) upstream traits/operations.

Define:

\[
R(T)
=
\frac{
1
}{
1+A(T)
}
\]

or more intuitively just report:

\[
\text{hidden derivational complexity}
=
A(T)+N_f(T),
\]

where \(N_f(T)\) is the number of operations.

The visual message becomes:

> One ontology node can collapse a surprisingly large computational structure.

You could literally draw:

\[
\boxed{\text{“frailty index”}}
\]

on the left, then explode it on the right into 30 upstream measurements and transformations.

That would visually explain **derivation erasure** in a second.

---

## The modalities matter a lot

I would not just stratify by database. I would stratify by phenotype-generation modality:

\[
\begin{aligned}
&\text{clinical diagnosis},\\
&\text{questionnaire/self-report},\\
&\text{anthropometric},\\
&\text{laboratory measurement},\\
&\text{imaging-derived},\\
&\text{molecular},\\
&\text{composite score/index},\\
&\text{ML-derived}.
\end{aligned}
\]

My hypothesis would be that the distributions get progressively more compositional:

\[
\text{direct measurement}
\rightarrow
\text{composite score}
\rightarrow
\text{imaging}
\rightarrow
\text{ML phenotype}.
\]

And yet most downstream databases flatten them to exactly the same kind of object:

\[
\texttt{trait\_id}.
\]

That is basically the empirical statement your paper is making.

---

## A potential Figure 1 structure

I can now see the whole figure:

### **a | From observation to phenotype**
Your visual explanation of:

\[
T:\mathcal X\rightarrow V_T,
\]

trait values, phenotype profiles, and composition.

### **b | Contemporary phenotype resources flatten an increasingly compositional trait space**
Four or five resources across the top:

**EFO | OBA | GWAS Catalog | Open Targets | Biobank / imaging**

Below each:

- total traits;
- fraction identified as derived;
- distribution of \(k(T)\);
- distribution of \(A(T)\);
- distribution of \(D(T)\).

Maybe a little graph glyph showing typical depth.

### **c | From named traits to explicit construction**
Take 2–3 representative phenotypes:

\[
\text{BMI},
\qquad
\text{disease phenotype},
\qquad
\text{imaging/ML phenotype}.
\]

Show how each appears downstream as:

\[
\boxed{T}
\]

but expands under the algebra into:

\[
T=f[T_1,\ldots,T_n].
\]

Then show what the algebra preserves:

\[
\text{types}
+
\text{dependencies}
+
\text{operations}
+
\text{context}.
\]

That gives Figure 1 a complete story:

\[
\boxed{
\text{define the idea}
\rightarrow
\text{show the empirical problem}
\rightarrow
\text{show what the algebra restores}
}
\]

And I think Panel **b** is potentially publishable evidence in its own right, rather than just decoration.

One other thing I would strongly consider: use the GWAS Catalog's distinction between **reported trait** and **mapped EFO trait** as one of your clearest empirical examples. The Catalog explicitly keeps the detailed reported trait alongside its EFO normalization because the reported trait captures study-specific details, experimental design, and background traits that the normalized ontology term alone does not. :chatgpt-content-reference{index="3"} That gives you a concrete, authoritative example of exactly the information-loss problem you're arguing about.
