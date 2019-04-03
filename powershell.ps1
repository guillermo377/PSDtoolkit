[CmdletBinding()]

Param(
    [string]$USERNAME,
    [string]$PASSWORD
)

#Variables
$toolkitpath = "C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.3\Downloads\0\Toolkit.zip"

#Initialize Data Disks
<#Get-Disk | ` 
Where partitionstyle -eq 'raw' | ` 
Initialize-Disk -PartitionStyle MBR -PassThru | ` 
New-Partition -AssignDriveLetter -UseMaximumSize | ` 
Format-Volume -FileSystem NTFS -NewFileSystemLabel "datadisk" -Confirm:$false#>

##Extracting Toolkit
$DestinationPath = "C:\Temp"
Test-Path $DestinationPath
if ($DestinationPath){
Expand-Archive -Path $toolkitpath -DestinationPath $DestinationPath -Force -Confirm 
}else{
New-Item -ItemType directory -Path C:\Temp´Expand-Archive -Path $toolkitpath -DestinationPath $DestinationPath -Force -Confirm 
}
##Launch Installation
powershell.exe -ExecutionPolicy Unrestricted -File ($DestinationPath +"\Deploy-Application.ps1")