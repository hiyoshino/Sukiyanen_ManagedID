# すきやねん Azure ! Managed ID セッション

2024年5月31日に開催した すきやねん Azure !! のマネージド ID のセッションで使用した PowerShell スクリプトです。
デモスクリプトのイメージは以下になります。Azure 上に作成した Windows 11 の仮想マシンから PowerShell のスクリプトを実行すると、Azure Blob ストレージにあるファイル[demo/demo.png](/media/demo.png)を仮想マシンの C:\demo\ にダウンロードします。

![demoimage](/media/demo001.png)

1. [scripts/demoscript.ps1](scripts/demoscript.ps1)     : Entra IDでユーザーが認証後にファイルをダウンロードします。Az コマンドを使用しています。
1. [scripts/demoscript2.ps1](scripts/demoscript2.ps1)   : Managed ID でファイルをダウンロードします。 Az コマンドを使用しています。
1. [scripts/demoscript3.ps1](scripts/demoscript3.ps1)   : Managed ID でファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でIMDSからアクセストークンを取得しています。
1. [scripts/demoscript4.ps1](scripts/demoscript4.ps1)   : サービスプリンシパルでファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でEntra ID からアクセストークンを取得しています。

# マネージドIDを使用して Azure AI 翻訳サービスで英語文書を日本語に変換しダウンロード
Azure AI ドキュメント翻訳サービスを使用してAzure Blob にある英語のドキュメントを日本語に変換後、Blob ストレージに出力します。その後、日本語返還後のファイルを仮想マシンにダウンロードします。

![demoimage](/media/demo002.png)
- 事前設定
    仮想マシンのマネージドIDを有効化します。仮想マシンのマネージドID に Azure AI 翻訳サービスのCognitive Service ユーザーのロールとAzure Storage サービスのBlob データ閲覧者のロールを付与しておきます。
    Azure AI　翻訳サービスのマネージドID を有効化します。次に、そのマネージドIDをBlobストレージのBlob 共同作成者としてのロールを付与します。

- [scripts/demo-document-translation.ps1](scripts/dem-doument-translation.ps1)     : スクリプトを実行すると Azure AI 翻訳サービスにアクセスします。Azure AI 翻訳サービスは Azure Blob Storage から英語のドキュメントを読み込み、日本語に返還後に Blob Storage にファイル出力します。PowerShell スクリプトは日本語に変換されたファイルを仮想マシンにダウンロードします。
