[CmdletBinding()]

Param(
    [string]$USERNAME,
    [string]$PASSWORD
)

#Variables
$toolkitpath = "C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.9.3\Downloads\0\Toolkit.zip"



#Initialize Data Disks
Get-Disk | ` 
Where partitionstyle -eq 'raw' | ` 
Initialize-Disk -PartitionStyle MBR -PassThru | ` 
New-Partition -AssignDriveLetter -UseMaximumSize | ` 
Format-Volume -FileSystem NTFS -NewFileSystemLabel "datadisk" -Confirm:$false
