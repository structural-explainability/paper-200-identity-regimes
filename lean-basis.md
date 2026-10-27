# Lean Formalization Basis

> Exact labeled mathematical environments extracted from the authoritative LaTeX section files.

- Source directory: `sections`
- Source files: 13
- Extracted: 2026-10-27T10:52:35-05:00
- Labeled items: 32
- Required labels verified: 4
- Additional labels extracted: 28

Each item contains the exact LaTeX environment from its opening `\begin{...}` through its matching `\end{...}`.

Items remain in section-file and source-line order. No mathematical text inside an extracted environment has been rewritten.

## Summary

| Kind | Count |
| --- | ---: |
| definition | 20 |
| theorem | 2 |
| proposition | 7 |
| lemma | 3 |

## Paper-Order Index

| # | Paper ID | Kind | Title | Source | Lines |
| ---: | --- | --- | --- | --- | ---: |
| 1 | `se100.def.Substrate` | definition | Substrate | `02_background.tex` | 28-34 |
| 2 | `se100.def.ReferentialRegime` | definition | Referential Regime | `02_background.tex` | 45-55 |
| 3 | `se100.def.ReferentialCommitments` | definition | Referential Commitments | `02_background.tex` | 67-76 |
| 4 | `se200.def.TransformationInvariantIdentity` | definition | Transformation-Invariant Identity | `02_background.tex` | 126-136 |
| 5 | `se200.def.TransformationBasis` | definition | Transformation basis | `03_formal_setting.tex` | 94-109 |
| 6 | `se200.def.TransformationClassification` | definition | Transformation classification | `03_formal_setting.tex` | 136-149 |
| 7 | `se200.def.NonBreakingTransformation` | definition | Non-breaking transformation | `03_formal_setting.tex` | 177-184 |
| 8 | `se200.def.IdentityRegime` | definition | Identity regime | `03_formal_setting.tex` | 196-206 |
| 9 | `se200.def.InducedIdentityRelation` | definition | Induced relation from non-breaking families | `03_formal_setting.tex` | 208-219 |
| 10 | `se200.def.BasisPlurality` | definition | Basis plurality | `03_formal_setting.tex` | 261-267 |
| 11 | `se200.def.HiddenRegime` | definition | Hidden regime | `03_formal_setting.tex` | 286-292 |
| 12 | `se200.def.ReferenceKind` | definition | Reference kind | `04_reference_inventory.tex` | 33-40 |
| 13 | `se200.def.IdentityCarrier` | definition | Identity carrier | `04_reference_inventory.tex` | 42-49 |
| 14 | `se200.def.IdentityBasis` | definition | Identity basis | `05_algebra.tex` | 32-41 |
| 15 | `se200.def.Collapse` | definition | Collapse | `05_algebra.tex` | 69-81 |
| 16 | `se200.def.UnderdeterminedKind` | definition | Underdetermined kind | `05_algebra.tex` | 113-119 |
| 17 | `se200.lem.SplitPattern` | lemma | Split pattern for classification profiles | `05_algebra.tex` | 180-196 |
| 18 | `se200.prop.ScopeUnderdetermination` | proposition | Scope underdetermination in the selected model | `05_algebra.tex` | 234-240 |
| 19 | `se200.prop.RuleUnderdetermination` | proposition | Rule underdetermination in the selected model | `05_algebra.tex` | 278-284 |
| 20 | `se200.prop.PlainReferentUnderdetermination` | proposition | Plain-referent underdetermination in the selected model | `05_algebra.tex` | 319-325 |
| 21 | `se200.def.SeparationWitness` | definition | Separation witness | `06_regimes.tex` | 101-111 |
| 22 | `se200.prop.DistinctCoreProfiles` | proposition | Distinct core profiles | `06_regimes.tex` | 121-125 |
| 23 | `se200.def.ModelDerivedVerdict` | definition | Model-derived transformation verdict | `06_regimes.tex` | 169-186 |
| 24 | `se200.thm.StepIdentityCollapse` | theorem | Step-generated relation equality | `06_regimes.tex` | 344-353 |
| 25 | `se200.prop.StepSeparation` | proposition | Separating transformation step | `06_regimes.tex` | 372-380 |
| 26 | `se200.prop.CarrierIndexedCombination` | proposition | Carrier-indexed combination | `07_distinctions.tex` | 129-134 |
| 27 | `se200.prop.ClassificationDistinctionPersists` | proposition | Persistence of a classification distinction | `07_distinctions.tex` | 186-191 |
| 28 | `se200.def.CoreCarrierBasisPair` | definition | Core carrier--basis pair | `08_determinancy.tex` | 22-41 |
| 29 | `se200.def.CoreRegimeAssignment` | definition | Core regime assignment | `08_determinancy.tex` | 50-56 |
| 30 | `se200.lem.CoreExistence` | lemma | Assignment existence | `08_determinancy.tex` | 66-69 |
| 31 | `se200.lem.CoreUniqueness` | lemma | Assignment uniqueness | `08_determinancy.tex` | 84-88 |
| 32 | `se200.thm.CoreRegimeAssignment` | theorem | Core regime assignment | `08_determinancy.tex` | 104-108 |

## Required Label Checkpoints

- se200.def.TransformationInvariantIdentity
- se200.def.TransformationBasis
- se200.def.TransformationClassification
- se200.def.NonBreakingTransformation

## Extracted Basis

## 01. `se100.def.Substrate` — Substrate

- Kind: `definition`
- Source: `02_background.tex:28-34`

```latex
\begin{definition}[Substrate]
  \label{se100.def.Substrate}
  A \emph{substrate} $\Substrate$ is a shared representational base providing
  stable reference for entities, occurrences, and institutional artifacts
  across a class of admissible interpretive frameworks $\Frameworks$.
  Stable reference consists of individuation, co-reference, and persistence.
\end{definition}
```

## 02. `se100.def.ReferentialRegime` — Referential Regime

- Kind: `definition`
- Source: `02_background.tex:45-55`

```latex
\begin{definition}[Referential Regime]
  \label{se100.def.ReferentialRegime}
  A \emph{referential regime} is the triple of
  \begin{enumerate}
    \item individuation conditions,
    \item co-reference conditions, and
    \item persistence conditions
  \end{enumerate}
  by which a substrate fixes and tracks entities, occurrences, and institutional
  artifacts.
\end{definition}
```

## 03. `se100.def.ReferentialCommitments` — Referential Commitments

- Kind: `definition`
- Source: `02_background.tex:67-76`

```latex
\begin{definition}[Referential Commitments]
  \label{se100.def.ReferentialCommitments}
  Let $\SubstrateRef$ denote the \emph{referential commitments} of $\Substrate$.
  These are the substrate-layer commitments fixed by its referential regime,
  including identifiers;
  the typing of entities, occurrences, and institutional artifacts;
  timestamps;
  provenance;
  and referential relations among them.
\end{definition}
```

## 04. `se200.def.TransformationInvariantIdentity` — Transformation-Invariant Identity

- Kind: `definition`
- Source: `02_background.tex:126-136`

```latex
\begin{definition}[Transformation-Invariant Identity]
  \label{se200.def.TransformationInvariantIdentity}
  Relative to a specified referent kind, proposed identity basis, and
  admissible transformation instances, a presentation is treated as
  \emph{transformation-invariant} along steps classified as preserving
  the declared basis.
  A transformation classification expresses a
  proposed identity judgment relative to that basis; it does not,
  without independent justification, establish strict identity of
  the represented referent across those steps.
\end{definition}
```

## 05. `se200.def.TransformationBasis` — Transformation basis

- Kind: `definition`
- Source: `03_formal_setting.tex:94-109`

```latex
\begin{definition}[Transformation basis]
  \label{se200.def.TransformationBasis}
  The transformation basis $\Fset$ consists of these operation families:
  \begin{enumerate}[label=(\alph*),nosep]
    \item $\mathrm{RE}$, re-expression: change of representation format while preserving represented content;
    \item $\mathrm{AN}$, annotation: addition of non-identity-bearing information;
    \item $\mathrm{RF}$, refinement: increase in descriptive, structural, or normative detail;
    \item $\mathrm{AD}$, aggregation or decomposition: restructuring into coarser or finer components under a specified whole-preservation condition;
    \item $\mathrm{RC}$, re-contextualization: change in applicability context;
    \item $\mathrm{RA}$, reassignment: change in association, bearer, or assignment relation;
    \item $\mathrm{SU}$, substitution: replacement of the designated carrier;
    \item $\mathrm{BF}$, branch or fork: divergence into multiple continuations;
    \item $\mathrm{PV}$, provenance extension: addition of historical, derivational, or evidentiary metadata;
    \item $\mathrm{SE}$, state evolution: change in state of an enduring referent over time.
  \end{enumerate}
\end{definition}
```

## 06. `se200.def.TransformationClassification` — Transformation classification

- Kind: `definition`
- Source: `03_formal_setting.tex:136-149`

```latex
\begin{definition}[Transformation classification]
  \label{se200.def.TransformationClassification}
  For a profile $\tau$ and transformation family $f\in\Fset$,
  \[
    \Class_\tau(f)\in\{\PRS,\BRK,\NEU,\NA\}.
  \]
  The proposed classifications mean:
  \begin{enumerate}[label=(\alph*),nosep]
    \item $\PRS$: the operation preserves the declared identity basis;
    \item $\BRK$: the operation breaks the declared identity basis;
    \item $\NEU$: the operation is applicable but does not affect that basis;
    \item $\NA$: the operation is inapplicable on the selected domain.
  \end{enumerate}
\end{definition}
```

## 07. `se200.def.NonBreakingTransformation` — Non-breaking transformation

- Kind: `definition`
- Source: `03_formal_setting.tex:177-184`

```latex
\begin{definition}[Non-breaking transformation]
  \label{se200.def.NonBreakingTransformation}
  A family $f$ is \emph{non-breaking} for profile $\tau$ when
  \[
    \Class_\tau(f)\in\{\PRS,\NEU\}.
  \]
  It is \emph{breaking} when $\Class_\tau(f)=\BRK$.
\end{definition}
```

## 08. `se200.def.IdentityRegime` — Identity regime

- Kind: `definition`
- Source: `03_formal_setting.tex:196-206`

```latex
\begin{definition}[Identity regime]
  \label{se200.def.IdentityRegime}
  An \emph{identity regime} $\tau$ consists of a declared identity basis
  and a classification function
  \[
    \Class_\tau:\Fset\to\{\PRS,\BRK,\NEU,\NA\}.
  \]
  The basis proposes conditions of sameness for the intended referent;
  the classification records proposed transformation behavior relative
  to that basis.
\end{definition}
```

## 09. `se200.def.InducedIdentityRelation` — Induced relation from non-breaking families

- Kind: `definition`
- Source: `03_formal_setting.tex:208-219`

```latex
\begin{definition}[Induced relation from non-breaking families]
  \label{se200.def.InducedIdentityRelation}
  Fix a profile $\tau$ and a domain $D_\tau$ of eligible presentations.
  Let $E_\tau\subseteq D_\tau\times D_\tau$ consist of pairs joined
  by specified, admissible steps of transformation families $f$
  satisfying
  \[
    \Class_\tau(f)\in\{\PRS,\NEU\}.
  \]
  Define $\sim_\tau$ as the smallest equivalence relation
  on $D_\tau$ containing $E_\tau$.
\end{definition}
```

## 10. `se200.def.BasisPlurality` — Basis plurality

- Kind: `definition`
- Source: `03_formal_setting.tex:261-267`

```latex
\begin{definition}[Basis plurality]
  \label{se200.def.BasisPlurality}
  A carrier kind exhibits \emph{basis plurality} within a construction
  when at least two distinct identity bases are specified for it.
  Whether both bases are independently justified, required for the
  intended applications, or irreducible is a separate question.
\end{definition}
```

## 11. `se200.def.HiddenRegime` — Hidden regime

- Kind: `definition`
- Source: `03_formal_setting.tex:286-292`

```latex
\begin{definition}[Hidden regime]
  \label{se200.def.HiddenRegime}
  A \emph{hidden regime} is an identity-relevant criterion or distinction
  used to determine sameness in a realization but not adequately
  declared or fixed in the shared referential account, so that its
  application depends on an unstated or contested interpretation.
\end{definition}
```

## 12. `se200.def.ReferenceKind` — Reference kind

- Kind: `definition`
- Source: `04_reference_inventory.tex:33-40`

```latex
\begin{definition}[Reference kind]
  \label{se200.def.ReferenceKind}
  A \emph{reference kind} is a class of intended referents selected to
  organize questions of reference in the accountability settings under
  analysis.
  Membership in a reference kind does not itself determine
  a referent's unity, sameness, or persistence criteria.
\end{definition}
```

## 13. `se200.def.IdentityCarrier` — Identity carrier

- Kind: `definition`
- Source: `04_reference_inventory.tex:42-49`

```latex
\begin{definition}[Identity carrier]
  \label{se200.def.IdentityCarrier}
  An \emph{identity carrier} is an intended referent considered as the
  subject of a proposed sameness, difference, or persistence judgment
  under transformation.
  The designation does not itself warrant that
  judgment or determine the applicable identity basis.
\end{definition}
```

## 14. `se200.def.IdentityBasis` — Identity basis

- Kind: `definition`
- Source: `05_algebra.tex:32-41`

```latex
\begin{definition}[Identity basis]
  \label{se200.def.IdentityBasis}
  An \emph{identity basis} is a stated criterion proposed for deciding when
  eligible presentations concern the same intended referent.
  It specifies
  the conditions whose preservation would warrant sameness under the
  interpretation in question.
  Its declaration alone does not establish
  that the criterion is adequate for the intended referent.
\end{definition}
```

## 15. `se200.def.Collapse` — Collapse

- Kind: `definition`
- Source: `05_algebra.tex:69-81`

```latex
\begin{definition}[Collapse]
  \label{se200.def.Collapse}
  Fix a common comparison domain $D$ of eligible presentations for
  two profiles $\tau$ and $\tau'$.
  The profiles \emph{collapse at the level
    of generated relations on $D$} when the restrictions of their generated
  relations agree:
  \[
    {\sim_\tau}\big|_D = {\sim_{\tau'}}\big|_D.
  \]
  Those generated relations are \emph{distinct on $D$} if one relates
  an eligible pair that the other does not.
\end{definition}
```

## 16. `se200.def.UnderdeterminedKind` — Underdetermined kind

- Kind: `definition`
- Source: `05_algebra.tex:113-119`

```latex
\begin{definition}[Underdetermined kind]
  \label{se200.def.UnderdeterminedKind}
  A reference kind is \emph{underdetermined at a transformation family}
  $f$ within the selected construction when two proposed bases for that
  kind assign, on a shared eligible comparison domain, a non-breaking
  classification and a breaking classification, respectively, to $f$.
\end{definition}
```

## 17. `se200.lem.SplitPattern` — Split pattern for classification profiles

- Kind: `lemma`
- Source: `05_algebra.tex:180-196`

```latex
\begin{lemma}[Split pattern for classification profiles]
  \label{se200.lem.SplitPattern}
  Let $K$ be a reference kind and let $\tau_1,\tau_2$ be two candidate
  profiles for $K$ over the same transformation basis and a shared
  eligible comparison domain.
  If some $f\in\Fset$ satisfies
  \[
    \Class_{\tau_1}(f)\in\{\PRS,\NEU\}
    \quad\text{and}\quad
    \Class_{\tau_2}(f)=\BRK,
  \]
  then the classification functions of $\tau_1$ and $\tau_2$
  are distinct.
  This conclusion alone does not establish distinct generated
  equivalence relations, scientifically warranted strict-identity
  relations, or a minimum number of irreducible regimes.
\end{lemma}
```

## 18. `se200.prop.ScopeUnderdetermination` — Scope underdetermination in the selected model

- Kind: `proposition`
- Source: `05_algebra.tex:234-240`

```latex
\begin{proposition}[Scope underdetermination in the selected model]
  \label{se200.prop.ScopeUnderdetermination}
  If an eligible $\mathrm{AD}$ operation preserves the coverage $C$
  while changing the identity-relevant partition $P$, then the
  extension-fixed and structure-fixed candidate profiles can assign
  different classifications to that operation.
\end{proposition}
```

## 19. `se200.prop.RuleUnderdetermination` — Rule underdetermination in the selected model

- Kind: `proposition`
- Source: `05_algebra.tex:278-284`

```latex
\begin{proposition}[Rule underdetermination in the selected model]
  \label{se200.prop.RuleUnderdetermination}
  If an eligible $\mathrm{RF}$ operation preserves the specified
  content $N$ while changing the identity-relevant structure $S$,
  then the content-fixed and structure-fixed candidate profiles can
  assign different classifications to that operation.
\end{proposition}
```

## 20. `se200.prop.PlainReferentUnderdetermination` — Plain-referent underdetermination in the selected model

- Kind: `proposition`
- Source: `05_algebra.tex:319-325`

```latex
\begin{proposition}[Plain-referent underdetermination in the selected model]
  \label{se200.prop.PlainReferentUnderdetermination}
  If an eligible $\mathrm{BF}$ operation yields compared presentations
  with the same locus but independently distinct objects, then
  locus-fixed and object-fixed candidate profiles can assign
  different classifications to that comparison.
\end{proposition}
```

## 21. `se200.def.SeparationWitness` — Separation witness

- Kind: `definition`
- Source: `06_regimes.tex:101-111`

```latex
\begin{definition}[Separation witness]
  \label{se200.def.SeparationWitness}
  Let $\tau$ and $\tau'$ be profiles with a common domain $D$ of
  eligible presentations.
  A \emph{separation witness for their generated
    relations on $D$} is a pair $(r,s)\in D\times D$ for which
  \[
    r\sim_\tau s \quad\text{and}\quad r\not\sim_{\tau'}s,
  \]
  or conversely, with each relation restricted to $D$.
\end{definition}
```

## 22. `se200.prop.DistinctCoreProfiles` — Distinct core profiles

- Kind: `proposition`
- Source: `06_regimes.tex:121-125`

```latex
\begin{proposition}[Distinct core profiles]
  \label{se200.prop.DistinctCoreProfiles}
  The nine classification functions specified by the columns of
  Table~\ref{tab:master} are pairwise distinct.
\end{proposition}
```

## 23. `se200.def.ModelDerivedVerdict` — Model-derived transformation verdict

- Kind: `definition`
- Source: `06_regimes.tex:169-186`

```latex
\begin{definition}[Model-derived transformation verdict]
  \label{se200.def.ModelDerivedVerdict}
  Fix an invariant basis $b$, an effect model $M$, and a
  transformation family $f$.

  The derived verdict is:
  \begin{enumerate}[label=(\alph*),nosep]
    \item $\NA$: no effective instance exists;
    \item $\BRK$: effective instances exist and every one
          changes the invariant;
    \item $\MIX$: some effective instance changes the invariant
          and another preserves it;
    \item $\PRS$: effective instances exist, all preserve the
          invariant, and at least one changes a supported field;
    \item $\NEU$: effective instances exist, all preserve the
          invariant, and none changes a supported field.
  \end{enumerate}
\end{definition}
```

## 24. `se200.thm.StepIdentityCollapse` — Step-generated relation equality

- Kind: `theorem`
- Source: `06_regimes.tex:344-353`

```latex
\begin{theorem}[Step-generated relation equality]
  \label{se200.thm.StepIdentityCollapse}
  Fix a common effect model, two invariant bases $b$ and $b'$,
  and a comparison domain $D$.

  The equivalence relations generated by their respective
  invariant-preserving admissible steps are equal if and only if
  the bases agree on invariant preservation for every admissible
  step with both endpoints in $D$.
\end{theorem}
```

## 25. `se200.prop.StepSeparation` — Separating transformation step

- Kind: `proposition`
- Source: `06_regimes.tex:372-380`

```latex
\begin{proposition}[Separating transformation step]
  \label{se200.prop.StepSeparation}
  Let $x,y\in D$ be connected by an admissible
  transformation step.

  If $b(x)=b(y)$ but $b'(x)\ne b'(y)$, then the
  step-generated identity relations for $b$ and
  $b'$ are distinct.
\end{proposition}
```

## 26. `se200.prop.CarrierIndexedCombination` — Carrier-indexed combination

- Kind: `proposition`
- Source: `07_distinctions.tex:129-134`

```latex
\begin{proposition}[Carrier-indexed combination]
\label{se200.prop.CarrierIndexedCombination}
Then $E$ is an equivalence relation on $D$.
Restricting $E$ to the $k$-th summand recovers $E_k$
for each $k\in K$.
\end{proposition}
```

## 27. `se200.prop.ClassificationDistinctionPersists` — Persistence of a classification distinction

- Kind: `proposition`
- Source: `07_distinctions.tex:186-191`

```latex
\begin{proposition}[Persistence of a classification distinction]
\label{se200.prop.ClassificationDistinctionPersists}
If two profiles have different classifications for some
$f\in\Fset$, their classification functions remain distinct
under extensions to $\Fset'$ that preserve the original classifications.
\end{proposition}
```

## 28. `se200.def.CoreCarrierBasisPair` — Core carrier--basis pair

- Kind: `definition`
- Source: `08_determinancy.tex:22-41`

```latex
\begin{definition}[Core carrier--basis pair]
\label{se200.def.CoreCarrierBasisPair}
A \emph{core carrier--basis pair} is one of the nine selected carrier-kind
and candidate identity-basis combinations displayed below.
The arrows
record the profile names assigned within this construction:
\[
\begin{array}{rcl}
\text{obligation-bearer with responsibility-bearing identity} &\mapsto& \OBL,\\
\text{occurrence with realization-and-provenance identity} &\mapsto& \OCC,\\
\text{record with descriptive-record identity} &\mapsto& \REC,\\
\text{plain referent with locus-fixed identity} &\mapsto& \LOC,\\
\text{plain referent with object-fixed identity} &\mapsto& \OBJ,\\
\text{scope with extension-fixed identity} &\mapsto& \SCOPEE,\\
\text{scope with structure-fixed identity} &\mapsto& \SCOPES,\\
\text{rule with content-fixed identity} &\mapsto& \RULEC,\\
\text{rule with structure-fixed identity} &\mapsto& \RULES.
\end{array}
\]
\end{definition}
```

## 29. `se200.def.CoreRegimeAssignment` — Core regime assignment

- Kind: `definition`
- Source: `08_determinancy.tex:50-56`

```latex
\begin{definition}[Core regime assignment]
\label{se200.def.CoreRegimeAssignment}
The \emph{core regime assignment} $A$ maps each selected core
carrier--basis pair to the named classification profile indicated by
the corresponding arrow in Definition~\ref{se200.def.CoreCarrierBasisPair}.
Its codomain is the selected profile catalog in Section~\ref{sec:profiles}.
\end{definition}
```

## 30. `se200.lem.CoreExistence` — Assignment existence

- Kind: `lemma`
- Source: `08_determinancy.tex:66-69`

```latex
\begin{lemma}[Assignment existence]
\label{se200.lem.CoreExistence}
Every selected core carrier--basis pair has an assigned profile under $A$.
\end{lemma}
```

## 31. `se200.lem.CoreUniqueness` — Assignment uniqueness

- Kind: `lemma`
- Source: `08_determinancy.tex:84-88`

```latex
\begin{lemma}[Assignment uniqueness]
\label{se200.lem.CoreUniqueness}
Each selected core carrier--basis pair has exactly one assigned profile
under $A$.
\end{lemma}
```

## 32. `se200.thm.CoreRegimeAssignment` — Core regime assignment

- Kind: `theorem`
- Source: `08_determinancy.tex:104-108`

```latex
\begin{theorem}[Core regime assignment]
\label{se200.thm.CoreRegimeAssignment}
For each carrier--basis pair in the selected catalog, there exists
exactly one named classification profile assigned to it by $A$.
\end{theorem}
```

