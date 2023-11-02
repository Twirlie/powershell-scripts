param(
  $path,
  $size,
  $delete
)

if (!$size) {
  $size = "1000x1000"
}

if (!$path) {
  $path = Get-Location
}

if (!$delete) {
  $delete = "false"
}

Write-Output "Resizing images in $path at $size "

$count = 0

Get-ChildItem -Recurse ($path) -Include @("*.png", "*.jpg")
| ForEach-Object {
  $file = $_.Name
  $folder = $_.Directory
  Write-Output "$folder\$file resizing..."
  magick.exe "$folder\$file" -resize $size "$folder\$file-resized.jpg"
  Write-Output "$file has been resized!"
  if ($delete -eq "true") {
    Remove-Item $_
    Write-Output "$_ has been deleted!"
  }
  $count = $count + 1
  Write-Output ""
}

Write-Output "$count images have been resized"
