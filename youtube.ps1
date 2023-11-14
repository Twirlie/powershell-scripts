param (
  $url,
  $format
)

if (!$url) {
  Write-Host "Please Provide a URL"
  Return
}
if (!$format) {
  $format = 22
}
Write-Host "Opening Video from Youtube..."
mpv $url --ytdl-format=$format