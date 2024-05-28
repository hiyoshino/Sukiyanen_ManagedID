# Sukiyanen Azure !! DEMO PowerShell Script
# Azure AI ドキュメント翻訳サービスで英語ドキュメントを日本語ドキュメントへ変換する
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$resource = "https://cognitiveservices.azure.com/"
$authuri = "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2019-08-01&resource=" + $resource

### Get AccessToken (Azure AI ドキュメント翻訳にアクセスするためのアクセストークンを取得）
$authContext = (Invoke-WebRequest -Uri $authuri -Method GET -Headers @{Metadata="true"})
$content = $authContext.Content | ConvertFrom-Json
$accessToken = $content.access_token

# ドキュメント翻訳リクエスト URI
$baseuri = "https://<customname>.cognitiveservices.azure.com/translator/text/batch/v1.1/batches"

# HTTP Request ヘッダー
$headers = @{
    'Ocp-Apim-Subscription-Region' = '<Region>'
    'Ocp-Apim-ResourceId' = '<resource ID>'
    'Content-type' = 'application/json'
    'Authorization' = 'Bearer '+$accessToken
}

# POSTで渡す日本語変換するドキュメントの場所情報
$body = '{"inputs":[{"storageType":"File","source":{"sourceUrl":"https://<StoraeAccountName>.blob.core.windows.net/demo/document-translation-sample.docx"},"targets":[{"targetUrl":"https://<StorageAccountName>.blob.core.windows.net/demo/JA_document-translation-sample.docx"
,"language":"ja"}]}]}'

# ドキュメント翻訳実行
Invoke-WebRequest -Method POST -Headers $headers -Uri $baseuri -Body $body

echo "Document being converted to Japanese"

Start-Sleep 15

## 翻訳後のドキュメントをダウンロードする ######################
$resource = "https://storage.azure.com/"
$authuri = "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=" + $resource

### Get AccessToken
$authContext = (Invoke-WebRequest -Uri $authuri -Method GET -Headers @{Metadata="true"})
$content = $authContext.Content | ConvertFrom-Json
$token = $content.access_token

$blob = "https://<StorageAccountName>.blob.core.windows.net/demo/JA_document-translation-sample.docx"
$stversion = "2017-11-09"
$headers = @{
	"Authorization" = "Bearer $token"
	"x-ms-version" = "$stversion"
}

# Downlaod a blob file
Invoke-WebRequest -Method GET -Headers $headers -Uri $blob -OutFile "C:\demo\JA_document-translation-sample.docx"


echo "Document downloaded."

