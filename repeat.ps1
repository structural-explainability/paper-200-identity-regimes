$tex   = ".\se200_referential_regimes.tex"
$files = @($tex) + (Get-ChildItem ".\sections\*.tex" | ForEach-Object { $_.FullName })

"=== hidden regime vs discriminator ==="
Select-String -LiteralPath $files `
  -Pattern "hidden|regime|discriminator" `
  -Context 1,0
Exit 0

"=== se200. stable-label convention ==="
Select-String -LiteralPath $files -Pattern "\\label\{(se200\.[^}]+)\}" |
  ForEach-Object {
    if ($_.Line -match "\\label\{(se200\.[^}]+)\}") {
      $ok = $Matches[1] -match "^se200\.(def|lem|prop|thm|cor|remark|note|assump)\."
      [PSCustomObject]@{ Label = $Matches[1]; WellFormed = $ok }
    }
  } | Format-Table -AutoSize
"(expect WellFormed=True for all; a False means a kind-segment typo.)"
Exit 0


"=== duplicate labels across all section files ==="
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


"=== stray leading-pipe artifacts (the sec:bound typos) ==="
Select-String -LiteralPath $files -Pattern "^\s*\|" -Context 1,1
"(expect: none. two known hits in 07_lower_bound until fixed.)"
Exit 0

"=== NS citation + arXiv id ==="
Select-String -LiteralPath $files -SimpleMatch "case2026neutral" -Context 0,0 |
  Measure-Object | ForEach-Object { "case2026neutral used: $($_.Count) time(s)" }
Select-String -LiteralPath $tex -SimpleMatch "2601.14271" -Context 1,1
"(expect the NS arXiv id 2601.14271 in the bibitem; confirm it matches SE-100's live id.)"
Exit 0


"=== regime token check ==="
"--- current SE-200 tokens (expect all present) ---"
"OBL","OCC","REC","LOC","OBJ","SCOPE-E","SCOPE-S","RULE-C","RULE-S" | ForEach-Object {
  $c = (Select-String -LiteralPath $files -SimpleMatch $_).Count
  [PSCustomObject]@{ Token = $_; Count = $c }
} | Format-Table -AutoSize
"--- retired tokens (expect zero; these are p300's old scheme / old NEU name) ---"
"ENRL","ENRI","CTXE","CTXS","NORC","NORS","IGN" | ForEach-Object {
  $c = (Select-String -LiteralPath $files -SimpleMatch $_).Count
  [PSCustomObject]@{ Token = $_; Count = $c }
} | Format-Table -AutoSize
Exit 0

"=== every 'nine regimes' site, to confirm 'at least' framing ==="
Select-String -LiteralPath $files `
  -Pattern "nine[^.]*identity regime|nine[^.]*regime|nine-regime" `
  -Context 1,0
Exit 0

"=== discovered-framing / banned diction ==="
Select-String -LiteralPath $files `
  -Pattern "gives nine|yields nine|yield nine|exactly nine|underdetermine|\bexactly\b" `
  -Context 1,1
"(expect: none. 'underdetermined kind' as the DEFINED term in sec:algebra is the one allowed exception.)"
Exit 0

"=== referential/identity term collisions ==="
Select-String -LiteralPath $files `
  -Pattern "(nine|six|distinct|these)\s+referential\s+regime|referential\s+kind" `
  -Context 1,1
"(expect: no matches. 'referential regime' is legal ONLY as the singular NS triple in background.)"
Exit 0
