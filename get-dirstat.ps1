$FileSystemObject = new-object -com Scripting.FileSystemObject
$directories = Get-ChildItem -Directory -Force `
| Select-Object @{l = 'Size'; e = { $FileSystemObject.GetFolder($_.FullName).Size } }, FullName

$totalSize = ($directories | Measure-Object -Property Size -Sum).Sum

"`nTotal Size: {0:N2} MB`n" -f ($totalSize / 1MB)

$directories `
| Sort-Object Size -Descending `
| Format-Table @{l = 'Size [MB]'; e = { '{0:N2}    ' -f ($_.Size / 1MB) } }, @{l = 'Percentage of Total'; e = { '{0:P2}' -f ($_.Size / $totalSize) } }, FullName