# REMINDER: RUN ALL AT ONCE USING F5

# Step 0:
# Session cleanup.
foreach ($commandName in 'Get-OSInfo','Get-BiosInfo','Get-ComputerInfo') {
    if (Test-Path -LiteralPath function:${commandName}) {
        Remove-Item -LiteralPath function:${commandName}
    }
}

# Step 1:
# Decide your module name and where it will go.
$moduleName = 'AcmeInfo'
$modulesRoot = "$([Environment]::GetFolderPath('MyDocuments'))\WindowsPowerShell\Modules"

# Step 1.1:
# Make sure you remove the module from the last time you ran this.
if (Test-Path -LiteralPath "${modulesRoot}\${moduleName}") {
    Remove-Item -LiteralPath "${modulesRoot}\${moduleName}" -Recurse -Force
}

# Step 2:
# Create a folder named as your module name.
New-Item -Path "${modulesRoot}\${moduleName}" -ItemType Directory > $null

# Step 3:
# Copy your ps1 file into your module folder, but with a psm1 extension.
Copy-Item `
    -LiteralPath "${psScriptRoot}\2 - Document your advanced functions.ps1" `
    -Destination "${modulesRoot}\${moduleName}\${moduleName}.psm1"

# Step 4:
# Give your module a manifest.
New-ModuleManifest `
    -Path "${modulesRoot}\${moduleName}\${moduleName}.psd1" `
    -RootModule "${moduleName}.psm1" `
    -Author 'Kirk Munro' `
    -Description 'Retrieve computer information from ACME workstations and servers' `
    -FunctionsToExport @('Get-OSInfo','Get-BiosInfo','Get-ComputerInfo')

# Step 4:
# Have a look at the folder in Explorer and the files in PSISE
explorer "${modulesRoot}\${moduleName}"
psedit "${modulesRoot}\${moduleName}\${moduleName}.psm1"
psedit "${modulesRoot}\${moduleName}\${moduleName}.psd1"

# Step 5:
# Look at the module in PowerShell
Get-Module -ListAvailable -Name AcmeInfo
