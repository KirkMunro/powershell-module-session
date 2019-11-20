$win32ComputerInfo = Get-CimInstance -Class Win32_ComputerSystem

[pscustomobject]@{
    PSTypeName = 'AcmeCorp.ComputerInfo'
    Name = $win32ComputerInfo.Name
    Owner = $win32ComputerInfo.PrimaryOwnerName
    Manufacturer = $win32ComputerInfo.Manufacturer
    Model = $win32ComputerInfo.Model
}