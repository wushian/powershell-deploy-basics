echo "INSTALLING ANYDESK v2.6.0 (2016-10-14)"
# http://anydesk.com/platforms

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\AnyDesk.exe" -ArgumentList '--install "C:\Program Files (x86)\AnyDesk"',"--silent","--create-shortcuts" -Wait

echo "- copying config file"
$targetdirectory = "$env:APPDATA\AnyDesk"
robocopy $parent_dir $targetdirectory user.conf >> "$env:temp\robo_log.txt"

Set-Service "AnyDesk" -startupType manual
echo "- anydesk service set to manual startup"

echo "ANYDESK DONE"
echo "------------------------------------------------------------------------------"
