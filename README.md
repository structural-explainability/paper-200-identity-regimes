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
