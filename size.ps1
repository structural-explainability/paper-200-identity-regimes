Get-ChildItem sections\*.tex |
  ForEach-Object {
    $out = texcount -brief $_.FullName
    $words = ($out | Select-String "Words in text:" | ForEach-Object {
      [int]($_.Line -replace ".*Words in text:\s*", "")
    })
    [pscustomobject]@{
      Words = $words
      File = $_.Name
    }
  } |
  Sort-Object Words -Descending |
  Format-Table -AutoSize
