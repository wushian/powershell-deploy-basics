# http://www.sumatrapdfreader.org/download-free-pdf-viewer.html

echo 'TEAMVIEWER v9 (2013)'

$parent_dir = Split-Path $MyInvocation.MyCommand.Path

echo ' - placing the exe file'

$target_dir = "$env:programfiles"
robocopy $parent_dir $target_dir teamviewer.exe >> "$env:temp\robo_log.txt"

echo 'TEAMVIEWER DONE'
echo '------------------------------------------------------------------------------'
