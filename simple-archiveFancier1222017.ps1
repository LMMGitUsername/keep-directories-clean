<#This is a working variation of Archive-OlderThan. 1/22/2017#>
<#
*.SYNOPSIS
*This is a simple function that moves the contents of the provided $Path to the provided $Destination path.
*
*.PARAMETER
*Path
*The path whose contents you want to move.
*
*.PARAMETER
*Destination
*The path that you want to move the contents to.
*
*.EXAMPLE
*Archive-Path -Path "C:\Users\Admin\Documents" -Destination "C:\Users\Admin\Documents\Archive"
*
*This command moves the contents of the "C:\Users\Admin\Documents" to C:\Users\Admin\Docuemnts\Archive."
#>
Function Archive-Path{    
param(
    [Parameter(Mandatory)]
    [String]$Path,    
    [Parameter(Mandatory)]
    [String]$Destination
)
    try{
        if(Test-Path -Path $Path){
            $contents = dir $Path

            foreach($item in $contents){
                try{
                    Move-Item -Path $item.FullName -Destination $Destination
                }catch{Write-Host "Could not move $($item.FullName)"}
            }
        }

    }catch{"$Path is unavailable."}
}