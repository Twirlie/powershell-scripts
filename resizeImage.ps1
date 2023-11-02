param(
  $path,
  $size,
  $delete
)

if (!$size) {
  $size = "1200x1200"
}

if (!$path) {
  $path = Get-Location
}

if (!$delete) {
  $delete = "false"
}

Write-Output "Resizing images in $path at $size"

Get-ChildItem -Recurse ($path) -Include @("*.png", "*.jpg")
| ForEach-Object {
  $file = $_.Name
  $folder = $_.DirectoryName
  Write-Output "$folder\$file resizing..."
  magick.exe "$file" -resize $size "$folder\$file-resized.jpg"
  Write-Output "$file has been resized!"
  if ($delete -eq "true") {
    Remove-Item $_
    Write-Output "$_ has been deleted!"
  }
}

