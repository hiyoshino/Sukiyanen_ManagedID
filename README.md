# Sukiyanen_ManagedID
2024年5月31日に開催した すきやねん Azure !! のマネージド ID のセッションで使用した PowerShell スクリプトです。
デモスクリプトのイメージは以下になります。Azure 上に作成した Windows 11 の仮想マシンから PowerShell のスクリプトを実行すると、Blob ストレージにあるファイルを仮想マシンにダウンロードします。

![demoimage](/media/demo001.png)

[scripts/demoscript.ps1](scripts/demoscript.ps1) : Entra IDでユーザーが認証後にファイルをダウンロードします。
