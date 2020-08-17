new-alias frmscv86 d:\ftarroux\documents\windowspowershell\script\frmscv86.ps1
new-alias frproxy ~/proxypowershell.ps1

function frperso { set-location "d:\ftarroux\documents\fred"}

new-alias frbash d:\ftarroux\documents\windowspowershell\script\frbash.ps1
new-alias archive_function d:\ftarroux\documents\windowspowershell\script\archivegit.ps1

. (join-path -path (split-path -parent -path $profile) -childpath $(switch($host.ui.rawui.backgroundcolor.tostring()){'white'{'set-solarizedlightcolordefaults.ps1'}'black'{'set-solarizeddarkcolordefaults.ps1'}default{return}}))

import-module posh-git
set-psreadlinekeyhandler -chord tab -function menucomplete
#function start-gvimdiff{
#start-process "d:\ftarroux\logiciel\vim64\vim81\gvim.exe" -d
#}
#function vimrcmod{
#start-process "d:\ftarroux\logiciel\vim64\vim81\gvim.exe" ~/.vimrc 
#}


#new-alias gvim d:\ftarroux\logiciel\vim64\vim81\gvim.exe
#new-alias frvimrc vimrcmod
#new-alias gvimdiff start-gvimdiff



# chocolatey profile
#$chocolateyprofile = "$env:chocolateyinstall\helpers\chocolateyprofile.psm1"
#if (test-path($chocolateyprofile)) {
#  import-module "$chocolateyprofile"
#}


