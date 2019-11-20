$win32OSDetails = Get-CimInstance -ClassName Win32_OperatingSystem

[pscustomObject]@{
    PSTypeName = 'AcmeCorp.OSInfo'
    Name = $win32OSDetails.Caption
    Language = $win32OSDetails.OSLanguage
    RegisteredTo = $win32OSDetails.RegisteredUser
    Build = $win32OSDetails.BuildNumber
    Computer = . $PSScriptRoot\Get-ComputerInfo.ps1
}