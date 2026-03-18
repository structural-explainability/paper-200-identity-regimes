# Structural Explainability: Identity Regimes

<!-- CUSTOM: arXiv badge is static by design to avoid Shields/arXiv API lag and cache failures -->

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![arXiv](https://img.shields.io/badge/arXiv-2601.16152-b31b1b.svg)](https://arxiv.org/abs/2601.16152)
[![Build PDF](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml)
[![ArXiv Prep](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2601.16152-blue)](https://doi.org/10.48550/arXiv.2601.16152)

> This paper derives structural consequences of ontological neutrality for substrates operating under persistent interpretive disagreement.

## Paper

- [PDF](./se200_identity_regimes.pdf)
- Status: Submitted to journal; under review.

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

texcount -inc -sum -total se200_identity_regimes.tex
```

Windows:

```pwsh
.\tools\build\build.ps1
```

## Stats

```text
Sum count: 10751
Words in text: 10402
Words in headers: 302
Words outside text (captions, etc.): 41
Number of headers: 75
Number of floats/tables/figures: 3
Number of math inlines: 1
Number of math displayed: 5
Files: 12
```

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

See [CITATION.cff](./CITATION.cff).

## License

[CC BY 4.0](./LICENSE)

## SE Manifest

[SE_MANIFEST](./SE_MANIFEST.toml)
