# ============================================================
# basis.ps1
# ============================================================
# Extracts the labeled mathematical basis from LaTeX section files.
#
# Each labeled environment is copied exactly from its opening
# \begin{...} through its matching \end{...}.
#
# Source:
#
#   sections/**/*.tex
#
# Output:
#
#   lean-basis.md
#
# Run:
#
#   .\basis.ps1
#
# Optional:
#
#   .\basis.ps1 `
#     -SectionsPath ".\sections" `
#     -OutputPath ".\lean-basis.md"
#
# Section files are processed in path order. File names should therefore
# encode paper order, for example:
#
#   01-introduction.tex
#   02-foundations.tex
#   03-results.tex
# ============================================================

[CmdletBinding()]
param(
    [string] $SectionsPath = ".\sections",
    [string] $OutputPath = ".\lean-basis.md"
)

$ErrorActionPreference = "Stop"

# ============================================================
# === REQUIRED BASIS CHECKPOINTS ===
# ============================================================
# These labels are known required items listed in authoritative
# relative order.
#
# The list does not need to contain every extractable label.
#
# The script fails if:
#
# - a required label is missing;
# - a label is duplicated across the section files; or
# - the required labels appear in a different relative order.
#
# Additional labeled mathematical environments are extracted and
# reported without causing failure.

$ExpectedLabels = @(
    "se200.def.TransformationInvariantIdentity"
    "se200.def.TransformationBasis"
    "se200.def.TransformationClassification"
    "se200.def.NonBreakingTransformation"
)

# ============================================================
# === TARGET LATEX ENVIRONMENTS ===
# ============================================================
# Add another environment name here when a paper introduces another
# theorem-like environment that belongs in the formalization basis.

$TargetKinds = @(
    "definition"
    "theorem"
    "proposition"
    "lemma"
    "corollary"
    "note"
    "assumption"
    "remark"
    "constraint"
    "example"
)

$LabelKindByEnvironment = @{
    definition  = "def"
    theorem     = "thm"
    proposition = "prop"
    lemma       = "lem"
    corollary   = "cor"
}

$KindPattern = (
    $TargetKinds |
        ForEach-Object {
            [regex]::Escape($_)
        }
) -join "|"

$BeginPattern = (
    '^\s*\\begin\{' +
    '(?<kind>' +
    $KindPattern +
    ')' +
    '\}' +
    '(?:\[(?<title>[^\]]*)\])?' +
    '\s*(?:%.*)?$'
)

# This pattern remains paper-number independent so the same script
# can be used in the other theory repositories.
$LabelPattern = '\\label\{(?<label>se[0-9]+\.[^}]+)\}'

# ============================================================
# === RESOLVE INPUT AND OUTPUT PATHS ===
# ============================================================

if (
    -not (
        Test-Path `
            -LiteralPath $SectionsPath `
            -PathType Container
    )
) {
    throw "LaTeX sections directory not found: $SectionsPath"
}

$ResolvedSectionsPath = (
    Resolve-Path -LiteralPath $SectionsPath
).Path

$ResolvedOutputPath = [System.IO.Path]::GetFullPath(
    $OutputPath
)

$OutputDirectory = Split-Path `
    -Parent `
    $ResolvedOutputPath

if (
    -not (
        Test-Path `
            -LiteralPath $OutputDirectory `
            -PathType Container
    )
) {
    New-Item `
        -ItemType Directory `
        -Path $OutputDirectory `
        -Force |
        Out-Null
}

$TexFiles = @(
    Get-ChildItem `
        -LiteralPath $ResolvedSectionsPath `
        -Filter "*.tex" `
        -File `
        -Recurse |
        Sort-Object FullName
)

if ($TexFiles.Count -eq 0) {
    throw (
        "No LaTeX section files were found under: " +
        $ResolvedSectionsPath
    )
}

# ============================================================
# === EXTRACT COMPLETE LABELED ENVIRONMENTS ===
# ============================================================

$Items = [System.Collections.Generic.List[object]]::new()

foreach ($TexFile in $TexFiles) {
    $RelativeSourcePath = $TexFile.FullName.Substring(
        $ResolvedSectionsPath.Length
    )

    $RelativeSourcePath = (
        $RelativeSourcePath `
            -replace '^[\\/]+', '' `
            -replace '\\', '/'
    )

    # Read each source as UTF-8 and preserve each source line.
    $Lines = [System.IO.File]::ReadAllLines(
        $TexFile.FullName,
        [System.Text.Encoding]::UTF8
    )

    for (
        $Index = 0;
        $Index -lt $Lines.Length;
        $Index++
    ) {
        $BeginMatch = [regex]::Match(
            $Lines[$Index],
            $BeginPattern
        )

        if (-not $BeginMatch.Success) {
            continue
        }

        $Kind = $BeginMatch.Groups["kind"].Value
        $Title = $BeginMatch.Groups["title"].Value.Trim()

        if ([string]::IsNullOrWhiteSpace($Title)) {
            $Title = "(untitled)"
        }

        $StartIndex = $Index
        $Depth = 1
        $SearchIndex = $Index + 1

        $EscapedKind = [regex]::Escape($Kind)

        $NestedBeginPattern = (
            "^\s*\\begin\{$EscapedKind\}" +
            "(?:\[[^\]]*\])?" +
            "\s*(?:%.*)?$"
        )

        $MatchingEndPattern = (
            "^\s*\\end\{$EscapedKind\}" +
            "\s*(?:%.*)?$"
        )

        while (
            $SearchIndex -lt $Lines.Length -and
            $Depth -gt 0
        ) {
            if (
                [regex]::IsMatch(
                    $Lines[$SearchIndex],
                    $NestedBeginPattern
                )
            ) {
                $Depth++
            }

            if (
                [regex]::IsMatch(
                    $Lines[$SearchIndex],
                    $MatchingEndPattern
                )
            ) {
                $Depth--
            }

            $SearchIndex++
        }

        if ($Depth -ne 0) {
            $SourceLine = $StartIndex + 1

            throw (
                "Unclosed LaTeX environment '$Kind' in " +
                "'$RelativeSourcePath' beginning at source " +
                "line $SourceLine."
            )
        }

        $EndIndex = $SearchIndex - 1
        $BlockLines = @(
            $Lines[$StartIndex..$EndIndex]
        )

        $BlockText = $BlockLines -join (
            [Environment]::NewLine
        )

        $LabelMatch = [regex]::Match(
            $BlockText,
            $LabelPattern
        )

        # Ignore target environments without an SE paper label.
        if (-not $LabelMatch.Success) {
            $Index = $EndIndex
            continue
        }

$Label = $LabelMatch.Groups["label"].Value

# Validate known environment-to-label abbreviations.
# Environments without a configured mapping are still extracted.
if ($LabelKindByEnvironment.ContainsKey($Kind)) {
    $LabelParts = $Label -split "\."

    if ($LabelParts.Count -lt 3) {
        throw (
            "Malformed label '$Label' in " +
            "'$RelativeSourcePath' at line $($StartIndex + 1)."
        )
    }

    $ActualLabelKind = $LabelParts[1]
    $ExpectedLabelKind = $LabelKindByEnvironment[$Kind]

    if ($ActualLabelKind -ne $ExpectedLabelKind) {
        throw (
            "Label kind mismatch in '$RelativeSourcePath' at line " +
            "$($StartIndex + 1). Environment '$Kind' expects " +
            "'$ExpectedLabelKind', but label '$Label' uses " +
            "'$ActualLabelKind'."
        )
    }
}

$Items.Add(
    [pscustomobject]@{
        Label      = $Label
        Kind       = $Kind
        Title      = $Title
        SourceFile = $RelativeSourcePath
        StartLine  = $StartIndex + 1
        EndLine    = $EndIndex + 1
        Lines      = $BlockLines
    }
)

        # Continue after the complete environment just extracted.
        $Index = $EndIndex
    }
}

# ============================================================
# === VALIDATE THE EXTRACTION ===
# ============================================================

if ($Items.Count -eq 0) {
    throw (
        "No labeled mathematical environments were extracted " +
        "from the section files."
    )
}

$DuplicateLabels = @(
    $Items |
        Group-Object -Property Label |
        Where-Object Count -gt 1
)

if ($DuplicateLabels.Count -gt 0) {
    $DuplicateDescriptions = @(
        foreach ($DuplicateGroup in $DuplicateLabels) {
            $Locations = (
                $DuplicateGroup.Group |
                    ForEach-Object {
                        "$($_.SourceFile):$($_.StartLine)"
                    }
            ) -join ", "

            "$($DuplicateGroup.Name) ($Locations)"
        }
    )

    throw (
        "Duplicate labels found:`n  " +
        ($DuplicateDescriptions -join "`n  ")
    )
}

$ActualLabels = @(
    $Items |
        ForEach-Object Label
)

$MissingLabels = @(
    $ExpectedLabels |
        Where-Object {
            $_ -notin $ActualLabels
        }
)

if ($MissingLabels.Count -gt 0) {
    throw (
        "Required labels were not extracted:`n  " +
        ($MissingLabels -join "`n  ")
    )
}

# Verify only the relative order of the required labels.
# Additional extracted labels may occur between them.

$PreviousExpectedPosition = -1
$PreviousExpectedLabel = $null

foreach ($ExpectedLabel in $ExpectedLabels) {
    $CurrentExpectedPosition = -1

    for (
        $ActualIndex = 0;
        $ActualIndex -lt $ActualLabels.Count;
        $ActualIndex++
    ) {
        if (
            $ActualLabels[$ActualIndex] -eq
            $ExpectedLabel
        ) {
            $CurrentExpectedPosition = $ActualIndex
            break
        }
    }

    if ($CurrentExpectedPosition -lt 0) {
        throw (
            "Required label position could not be resolved: " +
            $ExpectedLabel
        )
    }

    if (
        $CurrentExpectedPosition -le
        $PreviousExpectedPosition
    ) {
        throw (
            "Required label order differs. Expected " +
            "'$ExpectedLabel' after " +
            "'$PreviousExpectedLabel'."
        )
    }

    $PreviousExpectedPosition = $CurrentExpectedPosition
    $PreviousExpectedLabel = $ExpectedLabel
}

$AdditionalLabels = @(
    $ActualLabels |
        Where-Object {
            $_ -notin $ExpectedLabels
        }
)

# ============================================================
# === BUILD THE ORGANIZED MARKDOWN OUTPUT ===
# ============================================================

$Markdown = [System.Collections.Generic.List[string]]::new()

$GeneratedAt = Get-Date `
    -Format "yyyy-MM-ddTHH:mm:ssK"

$Markdown.Add("# Lean Formalization Basis")
$Markdown.Add("")
$Markdown.Add(
    "> Exact labeled mathematical environments extracted from " +
    "the authoritative LaTeX section files."
)
$Markdown.Add("")
$Markdown.Add(
    (
        '- Source directory: `{0}`' -f
            (
                Split-Path `
                    -Leaf `
                    $ResolvedSectionsPath
            )
    )
)
$Markdown.Add(
    (
        "- Source files: {0}" -f
            $TexFiles.Count
    )
)
$Markdown.Add(
    (
        "- Extracted: {0}" -f
            $GeneratedAt
    )
)
$Markdown.Add(
    (
        "- Labeled items: {0}" -f
            $Items.Count
    )
)
$Markdown.Add(
    (
        "- Required labels verified: {0}" -f
            $ExpectedLabels.Count
    )
)
$Markdown.Add(
    (
        "- Additional labels extracted: {0}" -f
            $AdditionalLabels.Count
    )
)
$Markdown.Add("")
$Markdown.Add(
    'Each item contains the exact LaTeX environment from its ' +
    'opening `\begin{...}` through its matching `\end{...}`.'
)
$Markdown.Add("")
$Markdown.Add(
    "Items remain in section-file and source-line order. " +
    "No mathematical text inside an extracted environment " +
    "has been rewritten."
)
$Markdown.Add("")

# ============================================================
# === SUMMARY BY KIND ===
# ============================================================

$Markdown.Add("## Summary")
$Markdown.Add("")
$Markdown.Add("| Kind | Count |")
$Markdown.Add("| --- | ---: |")

foreach ($KindName in $TargetKinds) {
    $Count = @(
        $Items |
            Where-Object Kind -eq $KindName
    ).Count

    if ($Count -gt 0) {
        $Markdown.Add(
            (
                "| {0} | {1} |" -f
                    $KindName,
                    $Count
            )
        )
    }
}

$Markdown.Add("")

# ============================================================
# === PAPER-ORDER INDEX ===
# ============================================================

$Markdown.Add("## Paper-Order Index")
$Markdown.Add("")
$Markdown.Add(
    "| # | Paper ID | Kind | Title | Source | Lines |"
)
$Markdown.Add(
    "| ---: | --- | --- | --- | --- | ---: |"
)

for (
    $ItemIndex = 0;
    $ItemIndex -lt $Items.Count;
    $ItemIndex++
) {
    $Item = $Items[$ItemIndex]

    $SafeTitle = $Item.Title.Replace(
        "|",
        "\|"
    )

    $SafeSourceFile = $Item.SourceFile.Replace(
        "|",
        "\|"
    )

    $LineRange = (
        "$($Item.StartLine)-$($Item.EndLine)"
    )

    $Markdown.Add(
        (
            '| {0} | `{1}` | {2} | {3} | `{4}` | {5} |' -f
                ($ItemIndex + 1),
                $Item.Label,
                $Item.Kind,
                $SafeTitle,
                $SafeSourceFile,
                $LineRange
        )
    )
}

$Markdown.Add("")

# ============================================================
# === REQUIRED LABEL CHECKPOINTS ===
# ============================================================

$Markdown.Add("## Required Label Checkpoints")
$Markdown.Add("")

if ($ExpectedLabels.Count -eq 0) {
    $Markdown.Add(
        "No required label checkpoints were configured."
    )
}
else {
    foreach ($ExpectedLabel in $ExpectedLabels) {
        $Markdown.Add(
            ("- {0}" -f $ExpectedLabel)
        )
    }
}

$Markdown.Add("")

# ============================================================
# === EXACT EXTRACTED BLOCKS ===
# ============================================================

$Markdown.Add("## Extracted Basis")
$Markdown.Add("")

for (
    $ItemIndex = 0;
    $ItemIndex -lt $Items.Count;
    $ItemIndex++
) {
    $Item = $Items[$ItemIndex]
    $Number = $ItemIndex + 1

    $Markdown.Add(
        (
            '## {0:D2}. `{1}` — {2}' -f
                $Number,
                $Item.Label,
                $Item.Title
        )
    )

    $Markdown.Add("")
    $Markdown.Add(
        (
            '- Kind: `{0}`' -f
                $Item.Kind
        )
    )
    $Markdown.Add(
        (
            '- Source: `{0}:{1}-{2}`' -f
                $Item.SourceFile,
                $Item.StartLine,
                $Item.EndLine
        )
    )
    $Markdown.Add("")
    $Markdown.Add('```latex')

    foreach ($Line in $Item.Lines) {
        $Markdown.Add($Line)
    }

    $Markdown.Add('```')
    $Markdown.Add("")
}

# ============================================================
# === WRITE OUTPUT ===
# ============================================================

Set-Content `
    -LiteralPath $ResolvedOutputPath `
    -Value $Markdown `
    -Encoding utf8

# ============================================================
# === REPORT ===
# ============================================================

Write-Host ""
Write-Host "Lean basis extracted successfully."
Write-Host ""
Write-Host "Source directory:"
Write-Host "  $ResolvedSectionsPath"
Write-Host ""
Write-Host "Section files:"
Write-Host "  $($TexFiles.Count)"
Write-Host ""
Write-Host "Output:"
Write-Host "  $ResolvedOutputPath"
Write-Host ""
Write-Host "Extracted:"
Write-Host "  $($Items.Count) labeled environments"
Write-Host ""
Write-Host "Validation:"
Write-Host (
    "  {0} required labels verified" -f
        $ExpectedLabels.Count
)
Write-Host (
    "  {0} additional labels extracted" -f
        $AdditionalLabels.Count
)
Write-Host ""

foreach ($KindName in $TargetKinds) {
    $Count = @(
        $Items |
            Where-Object Kind -eq $KindName
    ).Count

    if ($Count -gt 0) {
        Write-Host (
            "  {0,-12} {1,2}" -f
                $KindName,
                $Count
        )
    }
}

Write-Host ""

Exit 0
