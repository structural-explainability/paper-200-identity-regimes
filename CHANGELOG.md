# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

---

## [Unreleased]

### Planned

Complete the remaining work:

#### 1. Investigate admissible combination and non-amalgamation.

The carrier-indexed combination proposition establishes that
component equivalence relations can be represented together
without losing their individual restrictions.

Investigate whether such combinations preserve all scientifically
warranted identity judgments, transformation distinctions,
and required referential commitments.

Determine whether any non-amalgamation condition can be
independently justified.

#### 2. Establish scientific adequacy of candidate profiles.

The nine candidate classification profiles are mathematically distinct,
but their scientific adequacy remains unresolved.

Determine which proposed carrier–basis pairs have independently justified
individuation, co-reference, and persistence criteria.

Distinguish differences between classification profiles, differences between
their generated identity relations, and independently warranted identity or
persistence judgments about intended referents.

#### 3. Complete integration with separated theories.

Verify that the paper uses the actual definitions and established results of
Neutral Substrate, Individuation, Co-reference, Persistence, Transformation,
and Transformation-Persistence.

Clarify the formal relationships among these theories and the candidate profiles.

Identify any remaining semantic or evidential obligations without inferring
strict identity from non-breaking transformation classifications.

#### 4. Evaluate concrete examples and counterexamples.

Use examples such as forking, moving an office, and material transformation
as scientific tests of the proposed criteria.

For each case, specify the intended referent,
identity criterion, transformation, and independently justified judgment.

Determine what the formal construction explains and where it remains inadequate.

---

## [0.6.0] - 2026-10-27

### Summary / arXiv Comments field

60 pages; revised manuscript with Lean 4-certified transformation classifications and formal results characterizing equality and separation of invariant-preserving step-generated identity relations. Companion Lean 4 formalization available on GitHub.

### Added

- Added this changelog.

### Updated

- The unsupported nine-regime lower-bound claim has been withdrawn.
- Presented referential regimes as candidate formal characterizations
  of individuation, co-reference, and persistence under transformation.
- Distinguish definitions, conditional results, proposed criteria, and
  unresolved scientific claims.
- Uses the revised Neutral Substrate result as a conditional foundation.
- Does not assume that neutrality by design, or adequate referential fixing,
  has already been established for actual systems.
- Distinguishes three generated relations: the PRS-only family-level relation
  of Persistence, the PRS-or-NEU classification-level relation, and the
  invariant step-generated relation, which now has its own definition.
- States that seven (PRS-only) and eight (PRS-or-NEU) count distinct
  stipulated family sets, not necessary regimes.
- Cites the companion Lean development.
- Reframes the paper around its contributions, consolidates statements of
  limits in the limits section, and removes repeated counts of profiles,
  reference kinds, and transformation families from the prose.
- Updated GH action arxiv-prep.yml

---

## [0.5.0] - 2026-07-10

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.5.0).

---

## [0.4.0] - 2026-07-10

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.4.0).

---

## [0.3.0] - 2026-07-10

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.3.0).

---

## [0.1.0] - 2025-12-27

Released before this changelog existed. See the
[release](https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.1.0).

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** - breaking changes to the meaning, assumptions, or conclusions
    of existing paper items, or removal or renaming of their identifiers
  - **MINOR** - backward-compatible additions
  - **PATCH** - fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Task 1. Update release metadata (manual edits)

1.1. CITATION.cff: update version and date-released
1.2. CHANGELOG.md: add section, move unreleased entries, update links, update release command

### Task 2. Set up and Validate

```shell
# Update GitHub Actions and pin all action references to immutable SHAs.
uvx gha-tools autoupdate --pin=all --write .github/workflows

# Audit the resulting GitHub configuration for security findings.
uvx zizmor@latest .github/
# some suppressed is still okay

# Validate.
uvx cffconvert --validate
uvx se-manifest-schema validate-manifest --strict

# Format Markdown.
npx markdownlint-cli2 --fix

# Build and inspect
latexmk -pdf se200_referential_regimes.tex
.\tools\build\build.ps1

texcount -inc -sum -total se200_referential_regimes.tex
.\basis.ps1
```

Review all generated and modified files before committing.

### Task 3. Commit and Push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify that all required GitHub Actions complete successfully.

### Task 4. Prepare and submit to arXiv

1. As Needed: Run the **Prepare arXiv Source** workflow manually.
2. As Needed: Download `arxiv-source.zip` and the compiled PDF artifact; check the PDF.
3. Submit the revised source as a replacement.
4. Update the arXiv abstract field to match the paper's abstract.
5. Summarize the change in the arXiv Comments field.

Verify the updated arxiv step BEFORE tagging.

### Task 5. Tag and Push the Release

After the required GitHub Actions succeed:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

After it succeeds, for a major revision, create a release:

```shell
gh release create v0.6.0 --verify-tag --title "v0.6.0" --generate-notes
```

## Only As Needed (delete a tag)

```shell
git tag -d vX.Z.Y
git push origin :refs/tags/vX.Z.Y
```

## Links

[Unreleased]: https://github.com/structural-explainability/paper-200-identity-regimes/compare/v0.6.0...HEAD
[0.6.0]: https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.6.0
[0.5.0]: https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.5.0
[0.4.0]: https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.4.0
[0.3.0]: https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.3.0
[0.1.0]: https://github.com/structural-explainability/paper-200-identity-regimes/releases/tag/v0.1.0
