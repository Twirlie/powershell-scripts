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
  
Write-Host "Resizing images in $path at $size "
Write-Host ""

  
Get-ChildItem -Recurse ($path) -Include @("*.png", "*.jpg")
| ForEach-Object -ThrottleLimit 10 -Parallel {
  $file = $_.Name
  $folder = $_.Directory
  Write-Host "`r$folder\$file resizing..."
  magick.exe "$folder\$file" -resize $using:size "$folder\$file-resized.jpg"
  Write-Host "`r$file has been resized!"
  if ($using:delete -eq "true") {
    Remove-Item $_
    Write-Host "`r$_ has been deleted!"
  }

}
