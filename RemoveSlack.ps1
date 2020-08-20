# Reggie Scerbo - rscerbo@databridgesites.com - 7/23/20

Read-Host -Prompt "Press Enter to remove all Slack and MSTeams files from all users"

# remove slack from program files
If(Test-Path -Path "C:\Program Files\Slack"){
    Remove-Item -path "C:\Program Files\Slack" -recurse
    Write-Host "C:\Program Files\Slack was removed"
    } Else{
    Write-Host "C:\Program Files\Slack was not found"
    }
# remove slack deployment from program files
If(Test-Path -Path "C:\Program Files\Slack Deployment"){
    Remove-Item -path "C:\Program Files\Slack Deployment" -recurse
    Write-Host "C:\Program Files\Slack Deployment was removed"
    } Else{
    Write-Host "C:\Program Files\Slack Deployment was not found"
    }
# remove teams installer from program files (x86)
If(Test-Path -Path "C:\Program Files (x86)\Teams Installer"){
    Remove-Item -path "C:\Program Files (x86)\Teams Installer" -recurse
    Write-Host "C:\Program Files (x86)\Teams Installer was removed"
    } Else{
    Write-Host "C:\Program Files (x86)\Teams Installer was not found"
    }

# make an array of all the 7 file paths that need to be removed from each user account
$path = @(0,0,0,0,0,0,0,0,0,0)
$folderS = Get-ChildItem –Path "C:\Users" | where-object {$_.Psiscontainer -eq "True"} | select-object name
foreach ($folder in $folderS) {
$path[0] = "C:\Users\" + $folder.Name + "\AppData\Local\Slack"
$path[1] = "C:\Users\" + $folder.Name + "\AppData\Local\Teams"
$path[2] = "C:\Users\" + $folder.Name + "\AppData\Local\SquirrelTemp"
$path[3] = "C:\Users\" + $folder.Name + "\AppData\Local\Microsoft\Teams*"
$path[4] = "C:\Users\" + $folder.Name + "\AppData\Roaming\Microsoft\Teams"
$path[5] = "C:\Users\" + $folder.Name + "\AppData\Roaming\Microsoft Teams"
$path[6] = "C:\Users\" + $folder.Name + "\AppData\Roaming\Slack"
$path[7] = "C:\Users\" + $folder.Name + "\Desktop\Slack.lnk"

# loop through each user account and remove the file paths from the array
For($i = 0; $i -le 7; $i ++) {
    If (Test-Path -Path $path[$i]) {
        Remove-Item –path $path[$i] –recurse
        Write-Host $path[$i] "was removed"
        }Else {
        Write-Host $path[$i] "was not found"
        }
    }
}

Read-Host
