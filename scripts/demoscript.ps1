# Entra ID Authentication with UserPrincipal
# Sukiyanen Azure !! DEMO PowerShell Script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Authentication Entra ID with Userprincipal 
Connect-AzAccount -Tenant <tenant ID>

# Create a context object using Azure AD credentials
$ctx = New-AzStorageContext -StorageAccountName sukiyanendemostorage -UseConnectedAccount

# List the blobs in a contaner
#Get-AzStorageBlob -Container "demo" -Context $ctx

# Blob Storage にある Demo コンテナー下の demo.png をローカルのc:\demo にダウンロードします
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