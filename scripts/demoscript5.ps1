# Sukiyanen Azure !! DEMO PowerShell Script
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#### ユーザー割り当てマネージドID User-assigned Managed ID (SukiyanenDemo-MID) ######
$userAssignedMID = "<user assigned managed ID>"

$resource = "https://storage.azure.com/"
$baseuri = "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=" + $resource
$authuri = $baseuri + "&client_id=" + $userAssignedMID

### Get AccessToken
$authContext = (Invoke-WebRequest -Uri $authuri -Method GET -Headers @{Metadata="true"})
$content = $authContext.Content | ConvertFrom-Json
$token = $content.access_token

$blob = "https://<storageaccountName>.blob.core.windows.net/demo/demo.png"
$stversion = "2017-11-09"
$headers = @{
	"Authorization" = "Bearer $token"
	"x-ms-version" = "$stversion"
}

# Downlaod a blob file
Invoke-WebRequest -Method GET -Headers $headers -Uri $blob -OutFile "C:\demo\demo.png"

# Disconnect Entra ID
Disconnect-AzAccount