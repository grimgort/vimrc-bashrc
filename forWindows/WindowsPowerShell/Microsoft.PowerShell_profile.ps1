Import-Module 'D:\ftarroux\Logiciel\vcpkg\scripts\posh-vcpkg'

Import-Module PSReadLine
Import-Module posh-git
#Set-PSReadlineOption -EditMode Vi -ViModeIndicator  Cursor

Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
function Start-gvimdiff{
Start-Process "D:\ftarroux\Logiciel\Vim64\vim81\gvim.exe" -d
}

New-Alias gvim D:\ftarroux\Logiciel\Vim64\vim81\gvim.exe
New-Alias gvimdiff Start-gvimdiff

function frperso { set-location "D:\ftarroux\Documents\FRED"}

New-Alias frbash D:\ftarroux\Documents\WindowsPowerShell\Script\frbash.ps1

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

    $dateTime = get-date -Format "dd.MM.yyyy HH:mm:ss"
$global:GitPromptSettings.DefaultPromptPrefix = '$(write-host "DATE : $(Get-Date -format "dd.MM.yyyy HH:mm:ss " )" -ForegroundColor green)' 
#$global:GitPromptSettings.DefaultPromptPrefix = '$(Get-Date -format "dd.MM.yyyy HH:mm:ss " )' 
#function prompt {
    #$dateTime = get-date -Format "dd.MM.yyyy HH:mm:ss"
    #$currentDirectory = $(Get-Location)
    #write-host "DATE : $dateTime" -ForegroundColor red
    #write-host "PS $(Convert-Path $currentDirectory)>" -NoNewline
    #return " "
#}
