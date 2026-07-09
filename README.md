# Structural Explainability: Identity Regimes

<!-- CUSTOM: arXiv badge is static by design to avoid Shields/arXiv API lag and cache failures -->

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-blue.svg)](https://creativecommons.org/licenses/by/4.0/)
[![arXiv](https://img.shields.io/badge/arXiv-2601.16152-b31b1b.svg)](https://arxiv.org/abs/2601.16152)
[![Build PDF](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/build-latex.yml)
[![Check Links](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/links.yml)
[![ArXiv Prep](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml/badge.svg?branch=main)](https://github.com/structural-explainability/paper-200-identity-regimes/actions/workflows/arxiv-prep.yml)
[![DOI](https://img.shields.io/badge/DOI-10.48550/arXiv.2601.16152-blue)](https://doi.org/10.48550/arXiv.2601.16152)

> IN-PROGRESS. This paper derives the referential-regime structure
> required by neutral substrates operating
> under persistent interpretive disagreement.

## Paper

- [PDF](./se200_referential_regimes.pdf)

## Repository Structure

```text
.github/         # CI workflows
.vscode/         # Editor settings
bibliography/    # BibTeX references
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
latexmk -pdf se200_referential_regimes.tex -f

texcount -inc -sum -total se200_referential_regimes.tex
```

Windows:

```pwsh
.\tools\build\build.ps1
.\size.ps1
texcount -merge -sub=section -inc -sum se200_referential_regimes.tex
```

## Stats

```text
Sum count: 12288
Words in text: 11789
Words in headers: 211
Words outside text (captions, etc.): 48
Number of headers: 81
Number of floats/tables/figures: 1
Number of math inlines: 222
Number of math displayed: 18
Files: 14
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
