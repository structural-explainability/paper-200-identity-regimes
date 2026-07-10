$tex   = ".\se200_referential_regimes.tex"
$files = @($tex) + (Get-ChildItem ".\sections\*.tex" | ForEach-Object { $_.FullName })

Select-String -LiteralPath $files `
  -Pattern "emph" `
  -Context 1,0
Exit 0


Select-String -LiteralPath $files `
  -Pattern "only|merely|exactly|alone" `
  -Context 1,0
Exit 0



"OBL","OCC","REC","LOC","OBJ","SCOPE-E","SCOPE-S","RULE-C","RULE-S" | ForEach-Object {
  $c = (Select-String -LiteralPath $files -SimpleMatch $_).Count
  [PSCustomObject]@{ Token = $_; Count = $c }
} | Format-Table -AutoSize
Exit 0


Select-String -LiteralPath $files `
  -Pattern "hidden|regime|discriminator" `
  -Context 1,0
Exit 0

Select-String -LiteralPath $files -Pattern "\\label\{(se200\.[^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\label\{(se200\.[^}]+)\}") {
      $ok = $Matches[1] -match "^se200\.(def|lem|prop|thm|cor|remark|note|assump)\."
      [PSCustomObject]@{ Label = $Matches[1]; WellFormed = $ok }
    }
  } | Format-Table -AutoSize
"(expect WellFormed=True for all; a False means a kind-segment typo.)"
Exit 0


Select-String -LiteralPath $files -Pattern "\\label\{([^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\label\{([^}]+)\}") {
      [PSCustomObject]@{ Label = $Matches[1]; File = Split-Path $_.Path -Leaf; Line = $_.LineNumber }
    }
  } |
  Group-Object Label | Where-Object Count -gt 1 |
  ForEach-Object { $_.Group } | Format-Table -AutoSize
"(expect: none.)"
Exit 0

Select-String -LiteralPath $files `
  -Pattern "nine[^.]*identity regime|nine[^.]*regime|nine-regime" `
  -Context 1,0
Exit 0

