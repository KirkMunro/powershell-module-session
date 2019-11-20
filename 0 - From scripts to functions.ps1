function Get-OSInfo {
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

function Get-BiosInfo {
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

function Get-ComputerInfo {
    $win32ComputerInfo = Get-CimInstance -Class Win32_ComputerSystem

    [pscustomobject]@{
        PSTypeName = 'AcmeCorp.ComputerInfo'
        Name = $win32ComputerInfo.Name
        Owner = $win32ComputerInfo.PrimaryOwnerName
        Manufacturer = $win32ComputerInfo.Manufacturer
        Model = $win32ComputerInfo.Model
    }
}