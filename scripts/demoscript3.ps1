# Sukiyanen Azure !! DEMO REST-API PowerShell Script
# PowerShell with Managed ID
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


### Get AccessToken from IMDS ####
$resource = "https://storage.azure.com/"
$authuri = "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=" + $resource
$authContext = (Invoke-WebRequest -Uri $authuri -Method GET -Headers @{Metadata="true"})

$content = $authContext.Content | ConvertFrom-Json
$token = $content.access_token

### Downlaod a blob file ####
$blob = "https://<storageaccountname>.blob.core.windows.net/demo/demo.png"
$stversion = "2017-11-09"
$headers = @{
	"Authorization" = "Bearer $token"
	"x-ms-version" = "$stversion"
}

Invoke-WebRequest -Method GET -Headers $headers -Uri $blob -OutFile "C:\demo\demo.png"

# Disconnect Entra ID
# Disconnect-AzAccount