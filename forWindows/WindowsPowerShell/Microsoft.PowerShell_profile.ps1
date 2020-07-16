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