$tempFile = [IO.Path]::GetTempFileName()  

## Store the output of cmd.exe.  We also ask cmd.exe to output   
## the environment table after the batch file completes  

cmd /c " `"C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Auxiliary\Build\vcvars32.bat`" && set > `"$tempFile`" " 

## Go through the environment variables in the temp file.  
## For each of them, set the variable in our local environment.  
Get-Content $tempFile | Foreach-Object {   
    if($_ -match "^(.*?)=(.*)$")  
    { 
        Set-Content "env:\$($matches[1])" $matches[2]  
    } 
}  

Remove-Item $tempFile

. (Join-Path -Path (Split-Path -Parent -Path $PROFILE) -ChildPath $(switch($HOST.UI.RawUI.BackgroundColor.ToString()){'White'{'Set-SolarizedLightColorDefaults.ps1'}'Black'{'Set-SolarizedDarkColorDefaults.ps1'}default{return}}))




Import-Module posh-git
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
#function Start-gvimdiff{
#Start-Process "D:\ftarroux\Logiciel\Vim64\vim81\gvim.exe" -d
#}
#function vimrcmod{
#Start-Process "D:\ftarroux\Logiciel\Vim64\vim81\gvim.exe" ~/.vimrc 
#}


#New-Alias gvim D:\ftarroux\Logiciel\Vim64\vim81\gvim.exe
#New-Alias frvimrc vimrcmod
#New-Alias gvimdiff Start-gvimdiff
New-Alias frproxy ~/proxyPowerShell.ps1

function frperso { set-location "D:\ftarroux\Documents\FRED"}

New-Alias frbash D:\ftarroux\Documents\WindowsPowerShell\Script\frbash.ps1
New-Alias archive_function D:\ftarroux\Documents\WindowsPowerShell\Script\archiveGit.ps1

# Chocolatey profile
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
#}


