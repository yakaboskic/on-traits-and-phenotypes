# Introduction

<!-- \label{sec:introduction} -->

<!-- Provide the current definition of a phenotype -->
The National Human Genome Research Institute (NHGRI) defines as phenotype as "an individual’s observable traits, such as height, eye color and blood type" and a trait as "a specific characteristic of an individual." \cite{nhgri_glossary} Traits can be determined by genes, environmental factors or by a combination of both and can be qualitative (such as eye color) or quantitative (such as height or blood pressure). Most genetics and genomics research inevitably attempt to assign genetic associations to observed phenotypes in the population, whether they be complex polygenic traits such as height, or monogenic diseases such as Cystic Fibrosis \cite{riordan1989} or Huntington's Disease \cite{hdcrg1993}. While this has been greatly successful in uncovering numerous genotype to phenptype relationships and yeilding promising theraputics \cite{minikel2024}, we argue the phenotype side of this equation has not be adequately characterized.


<!-- Explain/Illustrate why that definition is a problem -->
Consider height and weight as two traits of individual, and now consider the concept of Body Mass Index (BMI). The question naturally arises, is BMI a trait? It certianly seems so, as it is a observable characteristic of an individual, but it would seem that the compositionality of the trait should matter, as its result is deterministically derived by height and weight. So can a trait be defined by other traits? In a genome wide association study (GWAS), BMI is certianly treated as a trait \cite{yengo2018}. Further, there is a temporality dimension to traits as an individuals height and weight and therefore BMI will be determined at the precise point of which it is measured. Further, who a trait is measured must also factor in, as a clinical diagnosis and a biobank self-report should probably not be treated as the same trait, although it often is \cite{schoeler2025,hu2025} Therefore, an analysis proposing a link between genotype and phenotype must specify the time and manner of observation and the dependency relationships between traits. These considerations do not all constitute confounding in the causal sense.


<!-- Recovered ontology paragraph revised: the original impossibility claim was invalid. -->
Disease and experimental ontologies and controlled vocabularies organize the phenome and support harmonization across biological datasets. \cite{efo_malone2010,mondo2026,hpo2024,ordo2014,gwascatalog2023,obofoundry2007} However, a shared label or taxonomic relationship does not by itself specify how a trait is computed. BMI requires a particular operation on height and weight, with declared units and a common observational context. Taxonomic distances need not reproduce this dependence, and equal distances would not supply the missing equation. The recovered EFO example and the limits of the earlier information-content argument are discussed in the supplementary material.

<!-- Brief overview of solution -->
In the biomedical ontology field and inferred from the the NHGRI definitions of traits and phenotypes, as a field we have defined phenotypes and traits as labels be that EFO and MONDO IDs or free text (eye color = brown). We assert that traits instead should be represented as functions over observables (individuals). In making this conceptual shift, we are then able to form clear compositions of traits and form an algebra to more precisely define phenotypes.


<!-- Contribution and impact of this perspective -->
This perspective develops that proposal as a typed, compositional algebra. We distinguish a trait from its value, identify a phenotype profile with an evaluation, and characterize equivalence relative to a selected trait vocabulary. We then describe partial observation, context extension, and a research agenda for phenotype construction and transportability.
