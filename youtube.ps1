param (
  $url,
  $format
)

if (!$url) {
  Write-Host "Please Provide a URL"
  Return
}
if (!$format) {
  $format = "(bestvideo[height<=?1080]+bestaudio/best)[protocol^=m3u8]"
}
Write-Host "Opening Video from Youtube..."
mpv $url --ytdl-format=$format