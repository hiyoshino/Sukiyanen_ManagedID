# Sukiyanen Azure !! DEMO PowerShell Script
# サービスプリンシパルのデモ
# Entra ID Authentication with ServicePrincipal
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#### Service principal's Credential ##############
$applicationId = "<Application ID (Client ID)>"
$clientSecret = "<ClientSecret>"
###

$tenantID = "<Tenant ID>"
$resource = "https://storage.azure.com/"
# Access Token Endpoint ##
$authuri = "https://login.microsoftonline.com/$tenantID/oauth2/token"

# トークン取得用のボディ
$body = @{
    grant_type    = "client_credentials"
    resource      = $resource
    client_id     = $applicationId
    client_secret = $clientSecret
    ContentType   = "application/x-www-form-urlencoded"
}

#### トークン取得 from Entra ID token endpoint #######
$authContext = (Invoke-RestMethod -Method Post -Uri $authuri -Body $body)
$token = $authContext.access_token

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