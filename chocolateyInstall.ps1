$packageName = 'PowerGist.Install'

$path = Split-Path -Parent $MyInvocation.MyCommand.Definition


$pathLib = "$path\..\lib\"

Write-host $pathLib

$addinDll = "$pathLib\GripDev.PowerGist.Addin.dll"
$depDll = "$pathLib\GistsApi.dll"
$iseProfile = "$pshome\Microsoft.PowerShellISE_profile.ps1"

Copy-Item $addinDll $pshome -Force 
Copy-Item $depDll $pshome -Force 

$line1 = "Add-Type -Path '$pshome\GripDev.PowerGist.Addin.dll'�
$line2 = "Add-Type -Path '$pshome\GistsApi.dll'�
$line3 = "`$psISE.CurrentPowerShellTab.VerticalAddOnTools.Add('PowerGist', [GripDev.PowerGist.Addin.PowerGistPanel], `$true) "

Add-Content $iseProfile $line1 -Force
Add-Content $iseProfile $line2 -Force
Add-Content $iseProfile $line3 -Force

Write-ChocolateySuccess $packageName