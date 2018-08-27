function Clear-Space ([Parameter(Mandatory)][string] $path) {
    Write-Output 'Path is: ' $path
    $filesToDeleteByParent = Get-Item -Path $path | 
    Get-ChildItem -Directory | Get-ChildItem -Directory | Sort -Property CreationTime | Select -Property FullName, CreationTime, Parent |
    Group -Property Parent | Where -Property Count -gt 1 


    foreach($files in $filesToDeleteByParent)
    {
        $oldVersionsToDelete = $files.Group | Select -ExpandProperty FullName -SkipLast 1 
        Write-Output 'Deleting files at path: ' $oldVersionsToDelete
        Remove-Item $oldVersionsToDelete -recurse 
    }
}



