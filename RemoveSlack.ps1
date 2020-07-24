# Reggie Scerbo - rscerbo@databridgesites.com - 7/23/20
# Remove Slack directories from all users on a PC
# Uncomment all commented lines from the body of the script before running

Read-Host -Prompt "Press Enter to remove all Slack and MSTeams files from all users"
Read-Host -Prompt "ARE YOU SURE?? (Enter to continue)"

If(Test-Path -Path "C:\Program Files\Slack"){
    Remove-Item -path "C:\Program Files\Slack" -recurse
    Write-Host "C:\Program Files\Slack was removed"
    } Else{
    Write-Host "C:\Program Files\Slack was not found"
    }
If(Test-Path -Path "C:\Program Files\Slack Deployment"){
    Remove-Item -path "C:\Program Files\Slack Deployment" -recurse
    Write-Host "C:\Program Files\Slack Deployment was removed"
    } Else{
    Write-Host "C:\Program Files\Slack Deployment was not found"
    }
If(Test-Path -Path "C:\Program Files (x86)\Teams Installer"){
    Remove-Item -path "C:\Program Files (x86)\Teams Installer" -recurse
    Write-Host "C:\Program Files (x86)\Teams Installer was removed"
    } Else{
    Write-Host "C:\Program Files (x86)\Teams Installer was not found"
    }

$path = @(0,0,0,0,0,0,0,0,0,0)

$folderS = Get-ChildItem –Path "C:\Users" | where-object {$_.Psiscontainer -eq "True"} | select-object name
foreach ($folder in $folderS) {
$path[0] = "C:\Users\" + $folder.Name + "\AppData\Local\Slack"
$path[1] = "C:\Users\" + $folder.Name + "\AppData\Local\Microsoft\Teams*"
$path[2] = "C:\Users\" + $folder.Name + "\AppData\Local\SquirrelTemp"
$path[3] = "C:\Users\" + $folder.Name + "\AppData\Local\Microsoft\Teams*"
$path[4] = "C:\Users\" + $folder.Name + "\AppData\Roaming\Microsoft\Teams"
$path[5] = "C:\Users\" + $folder.Name + "\AppData\Roaming\Microsoft Teams"
$path[6] = "C:\Users\" + $folder.Name + "\Desktop\Slack"

For($i = 0; $i -le 3; $i ++) {
    If (Test-Path -Path $path[$i]) {
        Remove-Item –path $path[$i] –recurse
        Write-Host $path[$i] "was removed"
        }Else {
        Write-Host $path[$i] "was not found"
        }
    }
}

Read-Host
