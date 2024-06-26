# すきやねん Azure !! マネージド ID セッション

2024年5月31日に開催した すきやねん Azure !! のマネージド ID セッションで使用した PowerShell スクリプトです。
このスクリプトの実行イメージは以下になります。Azure 上に作成した Windows 11 の仮想マシンから PowerShell のスクリプトを実行すると、Azure Blob ストレージにあるファイル[demo/demo.png](/media/demo.png)を仮想マシンの C:\demo\ にダウンロードします。

> [!NOTE]
> 全ての PowerShell スクリプトはサンプルであり、動作を保証するものではありません。学習のためのスクリプトです。
> All PowerShell scripts are samples and are not guaranteed to work. Scripts are for learning purposes only.

![demoimage](/media/demo001.png)

1. [scripts/demoscript.ps1](scripts/demoscript.ps1)     : Entra IDでユーザーが認証後にファイルをダウンロードします。Az コマンドを使用しています。
1. [scripts/demoscript2.ps1](scripts/demoscript2.ps1)   : マネージド ID で Azure Blob ストレージからファイルをダウンロードします。 Az コマンドを使用しています。
1. [scripts/demoscript3.ps1](scripts/demoscript3.ps1)   : マネージド ID で Azure Blob ストレージからファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でIMDSからアクセストークンを取得しています。
1. [scripts/demoscript4.ps1](scripts/demoscript4.ps1)   : サービスプリンシパルでAzure Bob ストレージからファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でEntra ID からアクセストークンを取得しています。
1. [scripts/demoscript5.ps1](scripts/demoscript5.ps1)   : ユーザー割り当てマネージド ID を使って Azure Blob ストレージからファイルをダウンロードします。

# マネージドIDを使用して Azure AI 翻訳サービスで英語文書を日本語に変換しダウンロード
Azure AI ドキュメント翻訳サービスを使用してAzure Blob にある英語のドキュメントを日本語に変換後、Blob ストレージに出力します。その後、日本語返還後のファイルを仮想マシンにダウンロードします。

![demoimage](/media/demo002.png)
- 事前設定：
    仮想マシンのマネージドIDを有効化します。仮想マシンのマネージドID に Azure AI 翻訳サービスの 「Cognitive Service ユーザー」と Azure Storage サービスの「ストレージ Blob データ閲覧者」のロールを付与しておきます。
    Azure AI 翻訳サービスのマネージドID を有効化します。次に、そのマネージド ID を Blob ストレージの 「ストレージBlob データ共同作成者」ロールを付与します。

- [scripts/demo-document-translation.ps1](scripts/dem-doument-translation.ps1)     : スクリプトを実行すると Azure AI 翻訳サービスにアクセスします。Azure AI 翻訳サービスは Azure Blob Storage から英語のドキュメントを読み込み、日本語変換後に Blob Storage にファイル出力します。続いてPowerShell スクリプトは日本語に変換されたファイルを仮想マシンにダウンロードします。

# 参考情報

- [Azure リソースのマネージドIDとは](https://learn.microsoft.com/ja-jp/entra/identity/managed-identities-azure-resources/overview)
- [Azure VM 上で Azure リソースのマネージド ID を使用してアクセス トークンを取得する方法](https://learn.microsoft.com/ja-jp/entra/identity/managed-identities-azure-resources/how-to-use-vm-token)
