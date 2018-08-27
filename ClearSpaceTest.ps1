Describe "Clear-Space" {
    BeforeAll {
        . (Resolve-Path "C:\Users\RawanS\Desktop\Notes\Clean Disk Space\ClearSpace.ps1")
        #. ClearSpace.ps1
    }

    

    Context "When Clear-Space is called" {
        It "Deletes found files" {
            $removeCalled = $false;
            $path = "testPath"
            Mock 'Remove-Item' { $removeCalled = $true}
            Mock 'Get-Item' {
                # return [PSCustomObject]@{
                #     Name = Value
                # }
                return @(
                    [PSCustomObject]`
                    @{ Name = 'shouldbecopied.JPG'; },`
                    [PSCustomObject]`
                    @{ Name = 'shouldbecopiedalso.JPG'; }
                )
            }


            Clear-Space -Path $path

            $removeCalled | Should Be $true
            
        }
    }
}