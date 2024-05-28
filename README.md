# Sukiyanen_ManagedID
2024年5月31日に開催した すきやねん Azure !! のマネージド ID のセッションで使用した PowerShell スクリプトです。
デモスクリプトのイメージは以下になります。Azure 上に作成した Windows 11 の仮想マシンから PowerShell のスクリプトを実行すると、Azure Blob ストレージにあるファイル[demo/demo.png](/media/demo.png)を仮想マシンの C:\demo\ にダウンロードします。

![demoimage](/media/demo001.png)

1. [scripts/demoscript.ps1](scripts/demoscript.ps1)     : Entra IDでユーザーが認証後にファイルをダウンロードします。Az コマンドを使用しています。
1. [scripts/demoscript2.ps1](scripts/demoscript2.ps1)   : Managed ID でファイルをダウンロードします。 Az コマンドを使用しています。
1. [scripts/demoscript3.ps1](scripts/demoscript3.ps1)   : Managed ID でファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でIMDSからアクセストークンを取得しています。
1. [scripts/demoscript4.ps1](scripts/demoscript4.ps1)   : サービスプリンシパルでファイルをダウンロードします。 REST API を使用し、invoke-WebRequest でEntra ID からアクセストークンを取得しています。