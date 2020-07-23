# Reggie Scerbo - rscerbo@databridgesites.com - 7/23/20
# Remove Slack directories from all users on a PC
# Uncomment all commented lines from the body of the script before running

Read-Host -Prompt "Press Enter to remove all Slack files from all users"
Read-Host -Prompt "ARE YOU SURE?? (Enter to continue)"

If(Test-Path -Path "C:\Program Files\Slack"){
    Remove-Item -path "C:\Program Files\Slack" -recuse
    } Else{
    Write-Host "C:\Program Files\Slack was not found"
    }
If(Test-Path -Path "C:\Program Files\Slack"){
    Remove-Item -path "C:\Program Files\Slack Deployment" -recuse
    } Else{
    Write-Host "C:\Program Files\Slack Deployment was not found"
    }

$folderS = Get-ChildItem –Path "C:\Users" | where-object {$_.Psiscontainer -eq "True"} | select-object name
foreach ($folder in $folderS) {
$path1 = "C:\Users\" + $folder.Name + "\AppData\Local\Slack"
$path2 = "C:\Users\" + $folder.Name + "\AppData\Roaming\Slack"

If (Test-Path -Path $path1) {
    Remove-Item –path $path1 –recurse
    Write-Host $path2 "was removed"
    }Else {
    Write-Host $path2 "was not found"
    }

If (Test-Path -Path $path1) {
    Remove-Item –path $path2 –recurse
    Write-Host $path2 "was removed"
    } Else {
    Write-Host $path2 "was not found"
    }

}

Read-Host
