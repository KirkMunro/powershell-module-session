$win32BiosInfo = Get-CimInstance -Class Win32_BIOS

[pscustomObject]@{
    PSTypeName = 'AcmeCorp.BiosInfo'
    Manufacturer = $win32BiosInfo.Manufacturer
    Version = New-Object -TypeName System.Version -ArgumentList @(
        $win32BiosInfo.SystemBiosMajorVersion
        $win32BiosInfo.SystemBiosMinorVersion
    )
    ReleaseDate = $win32BiosInfo.ReleaseDate
    Computer = . $PSScriptRoot\Get-ComputerInfo.ps1
}