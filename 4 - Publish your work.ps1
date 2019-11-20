# Get a list of the repositories we have available to us
Get-PSRepository

# Register an internal, corporate repository in a UNC share
Register-PSRepository `
    -Name AcmeCorpGallery `
    -SourceLocation \\${env:COMPUTERNAME}\my-repo `
    -InstallationPolicy Trusted

# Get a list of the repositories now
Get-PSRepository

# Publish our module to our repository
Publish-Module `
    -Name AcmeInfo `
    -Repository AcmeCorpGallery `
    -NuGetApiKey 'ThisIsNotUsedForLocalRepositories'

# Let's go find our module now
Find-Module -Name AcmeInfo -Repository AcmeCorpGallery

# Now let's clean up our work
Unregister-PSRepository -Name AcmeCorpGallery
