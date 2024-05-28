# Powershell with Managed ID
# Sukiyanen Azure !! DEMO PowerShell Script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Connect with Managed ID
Connect-AzAccount -Identity

# Create a context object using Azure AD credentials
$ctx = New-AzStorageContext -StorageAccountName <storageAccountName> -UseConnectedAccount

# List the blobs in a contaner
#Get-AzStorageBlob -Container "demo" -Context $ctx

# Download blobs
$DLBlob = @{
  Blob        = 'demo.png'
  Container   = 'demo'
  Destination = 'C:\demo\'
  Context     = $ctx
}
Get-AzStorageBlobContent @DLBlob

# Disconnect Entra ID #####
Disconnect-AzAccount

# Get a AccessToken
# $token = (Get-AzAccessToken).token
