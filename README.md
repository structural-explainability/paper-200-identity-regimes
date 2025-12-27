# Structural Explainability: Identity Regimes

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Build PDF](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/build-latex.yml/badge.svg)](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/links.yml/badge.svg)](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/links.yml)
[![ArXiv Prep](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/arxiv-prep.yml/badge.svg)](https://github.com/civic-interconnect/structural-explainability-paper-200-identity-regimes/actions/workflows/arxiv-prep.yml)

> This paper derives necessary and sufficient structural constraints on neutral ontological substrates 
> required to support stable reference and accountability under persistent disagreement.

## Paper

- [PDF](./se200_identity_regimes.pdf)

## Repository Structure

```
.github/         # CI workflows
.vscode/         # Editor settings
bibliography/    # BibTeX references
glossary/        # Term definitions
tools/           # Scripts
```

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
latexmk -pdf se200_identity_regimes.tex
```

Windows:

```pwsh
.\tools\build\build.ps1
```

## Related

- [Civic Interconnect](https://github.com/civic-interconnect/civic-interconnect)

## Annotations

This repository uses the [Structural Explainability Annotation Standard](./ANNOTATIONS.md) for self-documenting configuration.

## Citation

See [CITATION.cff](./CITATION.cff).

## License

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
