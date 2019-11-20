<#
.Synopsis
   Gets local operating system information.
.DESCRIPTION
   This command gets local operating system information including
   the name, the language, and the build number. It also includes
   details about the computer from which the information was
   retrieved.
.EXAMPLE
   PS C:\> Get-OSInfo

   Returns the operating system information from the local system.
.INPUTS
   None
.OUTPUTS
   AcmeCorp.OSInfo
#>
function Get-OSInfo {
    [CmdletBinding()]
    param()
    $win32OSDetails = Get-CimInstance -ClassName Win32_OperatingSystem

    [pscustomObject]@{
        PSTypeName = 'AcmeCorp.OSInfo'
        Name = $win32OSDetails.Caption
        Language = $win32OSDetails.OSLanguage
        RegisteredTo = $win32OSDetails.RegisteredUser
        Build = $win32OSDetails.BuildNumber
        Computer = Get-ComputerInfo
    }
}

<#
.Synopsis
   Gets local BIOS information.
.DESCRIPTION
   This command gets local BIOS information, including the
   manufacturer, the version, and the release date. It also
   includes details about the computer from which the
   information was retrieved.
.EXAMPLE
   PS C:\> Get-BiosInfo

   Returns the bios information from the local system.
.INPUTS
   None
.OUTPUTS
   AcmeCorp.BiosInfo
#>
function Get-BiosInfo {
    [CmdletBinding()]
    param()
    $win32BiosInfo = Get-CimInstance -Class Win32_BIOS

    [pscustomObject]@{
        PSTypeName = 'AcmeCorp.BiosInfo'
        Manufacturer = $win32BiosInfo.Manufacturer
        Version = New-Object -TypeName System.Version -ArgumentList @(
            $win32BiosInfo.SystemBiosMajorVersion
            $win32BiosInfo.SystemBiosMinorVersion
        )
        ReleaseDate = $win32BiosInfo.ReleaseDate
        Computer = Get-ComputerInfo
    }
}


<#
.Synopsis
   Get details from the local computer.
.DESCRIPTION
   This command gets details such as name, owner, and
   manufacturer from the local computer.
.EXAMPLE
   PS:\> Get-ComputerInfo

   Gets local computer information.
.INPUTS
   None
.OUTPUTS
   AcmeCorp.ComputerInfo
#>
function Get-ComputerInfo {
    [CmdletBinding()]
    param()
    $win32ComputerInfo = Get-CimInstance -Class Win32_ComputerSystem

    [pscustomobject]@{
        PSTypeName = 'AcmeCorp.ComputerInfo'
        Name = $win32ComputerInfo.Name
        Owner = $win32ComputerInfo.PrimaryOwnerName
        Manufacturer = $win32ComputerInfo.Manufacturer
        Model = $win32ComputerInfo.Model
    }
}