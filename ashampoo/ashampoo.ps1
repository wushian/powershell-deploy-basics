echo "INSTALLING ASHAMPOO"

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$parent_dir = Split-Path $MyInvocation.MyCommand.Path
Start-Process -FilePath "$parent_dir\ashampoo_burning_studio_6_free_6.84_13471.exe" -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"

Start-Sleep -m 20000
kill -processname "burningstudio" -ErrorAction SilentlyContinue

Set-ItemProperty -Path "HKCU:\Software\Ashampoo\Ashampoo Burning Studio 6\ash_inet" -name InfoChannel_ashnews_Enabled -Value 0
Set-ItemProperty -Path "HKCU:\Software\Ashampoo\Ashampoo Burning Studio 6\ash_inet" -name InfoChannel_-updates-_Enabled -Value 0
echo "- registry changed"

$unins = "C:\ProgramData\Ashampoo\unins000.exe"
If (Test-Path $unins){
    Start-Process -FilePath $unins -ArgumentList "/verysilent /norestart" -Wait
}
echo "- your Software Deals uninstalled"

Remove-Item "C:\Users\Public\Desktop\Your Software Deals.url" -ErrorAction SilentlyContinue
Remove-Item "C:\Users\Public\Desktop\Ashampoo Burning Studio 6 FREE.lnk" -ErrorAction SilentlyContinue
echo "- desktop icons removed"

echo "ASHAMPOO DONE"
echo "------------------------------------------------- "