$LabelPattern = (
    '\\label\{' +
    '(?<paper>se[0-9]+)\.' +
    '(?<kind>[^.}]+)\.' +
    '(?<name>[^}]+)' +
    '\}'
)

$Labels = @(
    Get-ChildItem `
        -LiteralPath ".\sections" `
        -Filter "*.tex" `
        -File `
        -Recurse |
        Sort-Object FullName |
        Select-String `
            -Pattern $LabelPattern `
            -AllMatches |
        ForEach-Object {
            foreach ($Match in $_.Matches) {
                [pscustomobject]@{
                    File = $_.Path
                    Line = $_.LineNumber
                    Label = $Match.Value.Substring(
                        7,
                        $Match.Value.Length - 8
                    )
                    Paper = $Match.Groups["paper"].Value
                    Kind = $Match.Groups["kind"].Value
                    Name = $Match.Groups["name"].Value
                }
            }
        }
)

$Labels |
    Group-Object Kind |
    Sort-Object Name |
    Select-Object Name, Count
