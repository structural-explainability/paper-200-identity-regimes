# Structural Explainability: Identity Regimes

<!-- CUSTOM: arXiv badge is static by design to avoid Shields/arXiv API lag and cache failures -->

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![arXiv](https://img.shields.io/badge/arXiv-2601.16152-b31b1b.svg)](https://arxiv.org/abs/2601.16152)
[![Build PDF](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml)
[![ArXiv Prep](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2601.16152-blue)](https://doi.org/10.48550/arXiv.2601.16152)

> Derives identity regimes that preserve stable reference
> when neutral substrates are transformed under persistent disagreement.

## Main Contribution

This project derives a lower-bound identity constraint for neutral accountability records.
When stable reference must be preserved across admissible frameworks,
and causal or normative interpretation remains outside the substrate layer,
reference kinds alone are insufficient.
The substrate must also preserve the identity basis
under which each referent remains the same through ordinary transformations.

The paper shows that six required reference kinds supply the carriers:
obligation-bearers, rules, occurrences, scopes, records, and plain referents.
Three of those kinds underdetermine identity.
Plain referents may be locus-fixed or object-fixed.
Scopes may be extension-fixed or structure-fixed.
Rules may be content-fixed or structure-fixed.
This transformation analysis forces at least nine identity regimes.

## Nine-Regime Lower-Bound Core

| Regime    | Carrier           | Identity basis                      | Forced by                                                   |
| --------- | ----------------- | ----------------------------------- | ----------------------------------------------------------- |
| `OBL`     | Obligation-bearer | Responsibility-bearing identity     | Required carrier in the accountability inventory            |
| `OCC`     | Occurrence        | Realization-and-provenance identity | Required carrier in the accountability inventory            |
| `REC`     | Record            | Descriptive-record identity         | Required carrier in the accountability inventory            |
| `LOC`     | Plain referent    | Locus-fixed identity                | Branch/fork separates locus identity from object identity   |
| `OBJ`     | Plain referent    | Object-fixed identity               | Branch/fork separates object identity from locus identity   |
| `SCOPE-E` | Scope             | Extension-fixed identity            | Aggregation/decomposition separates coverage from structure |
| `SCOPE-S` | Scope             | Structure-fixed identity            | Aggregation/decomposition separates structure from coverage |
| `RULE-C`  | Rule              | Content-fixed identity              | Refinement separates rule content from rule structure       |
| `RULE-S`  | Rule              | Structure-fixed identity            | Refinement separates rule structure from rule content       |

## Structural Explainability: Accountable Records Paper Series

| Paper                   | Description                                                                                                                                                                                                 |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Neutral Substrates**  | Defines the neutrality constraint. A neutral substrate preserves shared reference and attribution without adopting contested causal or normative interpretations as substrate-level commitments.            |
| **Referential Regimes** | Derives the identity cost of the neutrality constraint. Shows stable reference under persistent disagreement requires transformation-invariant identity regimes and derives a nine-regime lower-bound core. |
| **Accountable Records** | Develops the conformance layer for deployed record systems. Studies how basis declarations, transformation logs, and schema checks can make neutral-substrate identity commitments inspectable in practice. |

## Links

- [Paper 1 SE 100: Neutral Substrates](https://arxiv.org/abs/2601.14271)
- [Paper 2 SE 200: Referential Regimes (9) PDF](./se200_referential_regimes.pdf)

## Building Locally

<!--
On Windows (MiKTeX):

- Download from <https://miktex.org/download>.
- Suggested options during installation:
  - Install for current user only
  - Leave paper size at A4 (default is fine)
  - Install missing packages on the fly = Yes
  - Add MiKTeX to PATH = Yes
-->

Requires a LaTeX distribution with `latexmk` (MiKTeX, TeX Live, or MacTeX):

```bash
latexmk -pdf se200_referential_regimes.tex -f

texcount -inc -sum -total se200_referential_regimes.tex
```

Windows:

```pwsh
.\tools\build\build.ps1
.\size.ps1
texcount -merge -sub=section -inc -sum se200_referential_regimes.tex
```

## Release Commands (Examples)

```shell
# delete tags only as needed
git tag -d v0.3.0
git push origin :refs/tags/v0.3.0

.\tools\build\clean.ps1
.\tools\build\build.ps1

git tag v0.3.0 -m "0.3.0"
git push origin v0.3.0
```

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

See [CITATION.cff](./CITATION.cff).

## License

[CC BY 4.0](./LICENSE)

## SE Manifest

[SE_MANIFEST](./SE_MANIFEST.toml)

Validate with:

```shell
uvx se-manifest-schema validate-manifest --path SE_MANIFEST.toml --strict
```

## References

1. Arp, R., Smith, B., and Spear, A. D. (2015).
   _Building Ontologies with Basic Formal Ontology_.
   MIT Press.

1. Bowker, G. C., and Star, S. L. (1999).
   _Sorting Things Out: Classification and Its Consequences_.
   MIT Press, Cambridge, MA.

1. Case, D. M. (2026).
   _Neutral Substrates: A Design Constraint for Shared Records Under Persistent Interpretive Disagreement_.
   arXiv:2601.14271.
   <https://arxiv.org/abs/2601.14271>

1. Edwards, P. N. (2010).
   _A Vast Machine: Computer Models, Climate Data, and the Politics of Global Warming_.
   MIT Press.

1. Gangemi, A., Guarino, N., Masolo, C., Oltramari, A., and Schneider, L. (2002).
   "Sweetening ontologies with DOLCE."
   In _Knowledge Engineering and Knowledge Management:
   Ontologies and the Semantic Web (EKAW 2002)_,
   volume 2473 of Lecture Notes in Computer Science, pages 166–181.
   Springer.

1. Grieves, M., and Vickers, J. (2017).
   "Digital twin: Mitigating unpredictable, undesirable emergent behavior
   in complex systems."
   In _Transdisciplinary Perspectives on Complex Systems_, pages 85–113.
   Springer.

1. Guarino, N. (1999).
   "The role of identity conditions in ontology design."
   In C. Freksa and D. M. Mark (Eds.),
   _Spatial Information Theory: Cognitive and Computational Foundations
   of Geographic Information Science (COSIT ’99)_,
   volume 1661 of Lecture Notes in Computer Science, pages 221–234.
   Springer.

1. Guarino, N., and Welty, C. A. (2002).
   "Evaluating ontological decisions with OntoClean."
   _Communications of the ACM_, 45(2):61–65.

1. Guizzardi, G. (2005).
   _Ontological Foundations for Structural Conceptual Models_.
   PhD thesis, University of Twente.

1. Haslanger, S. (2012).
   _Resisting Reality: Social Construction and Social Critique_.
   Oxford University Press.

1. Hodges, W. (1997).
   _A Shorter Model Theory_.
   Cambridge University Press.

1. ISO/IEC. (2018).
   _Information Technology — Common Logic (CL):
   A Framework for a Family of Logic-Based Languages_.
   ISO/IEC 24707:2018.

1. Kutz, O., Mossakowski, T., and Lücke, D. (2010).
   "Carnap, Goguen, and the hyperontologies:
   Logical pluralism and heterogeneous structuring in ontology design."
   _Logica Universalis_, 4(2):255–333.

1. Longino, H. E. (1990).
   _Science as Social Knowledge:
   Values and Objectivity in Scientific Inquiry_.
   Princeton University Press.

1. Masolo, C., Borgo, S., Gangemi, A., Guarino, N., and Oltramari, A. (2003).
   _WonderWeb Deliverable D18: Ontology Library_.
   IST Project 2001-33052 WonderWeb.

1. Moreau, L., and Missier, P., editors. (2013).
   _PROV-DM: The PROV Data Model_.
   W3C Recommendation, 30 April 2013.

1. Pearl, J. (2009).
   _Causality: Models, Reasoning, and Inference_.
   Second edition.
   Cambridge University Press.

1. Smith, B., et al. (2015).
   _Basic Formal Ontology 2.0: Specification and User’s Guide_.
   Technical specification, 26 June 2015.

1. Wilkinson, M. D., et al. (2016).
   "The FAIR Guiding Principles for scientific data management
   and stewardship."
   _Scientific Data_, 3:160018.

## Related and Adjacent Work

Selected papers from the
[Harvard's SciX similar-papers search](https://ui.adsabs.harvard.edu/abs/2026arXiv260114271C/similar)
for _Referential Regimes_.

### Structural Explainability Foundation

- [Neutral Substrates: A Design Constraint for Shared Records Under Persistent Interpretive Disagreement](https://ui.adsabs.harvard.edu/abs/2026arXiv260114271C/abstract)

### Identity, Reference, and Equivalence

- [A Category Theory Account of AI Identity](https://ui.adsabs.harvard.edu/abs/2026arXiv260700220F/abstract)
- [What does a system modify when it modifies itself?](https://ui.adsabs.harvard.edu/abs/2026arXiv260327611K/abstract)
- [On the referential capacity of language models: An internalist rejoinder to Mandelkern & Linzen](https://ui.adsabs.harvard.edu/abs/2024arXiv240600159B/abstract)
- [Semantic Non-Fungibility and Violations of the Law of One Price in Prediction Markets](https://ui.adsabs.harvard.edu/abs/2026arXiv260101706G/abstract)

### Multiple Valid Representations

- [Beyond Single Ground Truth: Reference Monism as Epistemic Injustice in ASR Evaluation](https://ui.adsabs.harvard.edu/abs/2026arXiv260507084G/abstract)
- [Explanation Multiplicity in SHAP: Characterization and Assessment](https://ui.adsabs.harvard.edu/abs/2026arXiv260112654H/abstract)

### Explicit Regimes and Rule Interpretation

- [Geometric Attention: A Regime-Explicit Operator Semantics for Transformer Attention](https://ui.adsabs.harvard.edu/abs/2026arXiv260111618R/abstract)
- [How Should AI Interpret Rules? A Defense of Minimally Defeasible Interpretive Argumentation](https://ui.adsabs.harvard.edu/abs/2021arXiv211013341L/abstract)

### Operational Identity and Record Systems

- [State Twins: An Off-Chain Substrate for Agentic Reasoning over Decentralized Finance Protocols](https://ui.adsabs.harvard.edu/abs/2026arXiv260511522M/abstract)
- [Deterministic Legal Agents: A Canonical Primitive API for Auditable Reasoning over Temporal Knowledge Graphs](https://ui.adsabs.harvard.edu/abs/2025arXiv251006002D/abstract)
