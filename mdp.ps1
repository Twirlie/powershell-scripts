$playlistFileName = "MPV_Playlist.txt"

Get-ChildItem -Name | Out-File $playlistFileName
mpv --loop-playlist --playlist=$playlistFileName