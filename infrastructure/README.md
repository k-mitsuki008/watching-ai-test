# 記載内容
1. [フォルダ構成](#フォルダ構成)
   1. [概要](#概要)
   2. [ディレクトリ構造](#ディレクトリ構造)
   3. [モジュール一覧](#モジュール一覧)

2. [ローカル実行](#ローカル実行)
   1. [事前準備](#事前準備)
   2. [実行コマンド](#実行コマンド)

3. [CloudBuild実行](#CloudBuild実行)
   1. [対応ブランチ](#対応ブランチ)
   2. [実行手順](#実行手順)

<br>
<br>
<br>

# フォルダ構成
## 概要
本プロジェクトでは、インフラのコード化（IaC化）を実現するために Terraform を採用する。
運用の効率化と保守性を高めるため、以下の設計思想に基づいた構成をとる。

### ディレクトリの役割分離
- リソースの具体的な定義を行う `modules` 配下と、環境ごとの設定を行う `environments` 配下に分離する。
- これにより、新機能を追加する際の影響範囲が明確になり、コードの再利用性が向上させる。

### 環境展開の容易性
- environments 配下には、`dev（開発）`、`stg（検証）`、`prd（本番）`といったディレクトリを配置する。
- 環境ごとの設定値を `environments/[環境名]/main.tf` 内のモジュール引数（または `variables.tf` の default 値）として管理する。

### 一貫性の確保
- すべての環境で同じモジュールを使用することで、環境間での構成差異（「開発では動くが本番では動かない」等）を最小限に抑える。

## ディレクトリ構造
```
infrastructure/
├── environments/               # 各環境ごとの実行ディレクトリ
│   └── dev/                    # 開発環境（ここが現在の作業場所）
│   │   ├── main.tf             # モジュール呼び出し、リソース定義の核
│   │   ├── provider.tf         # GCPプロバイダ、バックエンド（GCS）設定
│   │   ├── variables.tf        # 環境固有の変数の器（default値で値を管理）
│   │   └── .terraform/         # init時に生成されるキャッシュ（Git管理対象外）
│   ├── stg/
│   └── prd/ 
│   └── ・・・
└── modules/                    # 再利用可能なリソース定義（部品）
    ├── network/                # VPC、サブネット関連
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── database/               # Bigtable等のデータベース関連
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── ・・・
```

## モジュール一覧
| モジュール名 | フォルダパス | リソース | 説明 |
|----------|----------------|----------------|----------------|
| **network** | `../../modules/network` | `VPC`, `Subnet` | ネットワーク基盤 |
| **database** | `../../modules/database` | `Bigtable` | データベース関連 |
| **xxx** | `../../modules/xxx` | `xxx` | xxx |

# ローカル実行
## 事前準備
### Google Cloud CLIのインストール
- [Google Cloud 公式](https://docs.cloud.google.com/sdk/docs/install-sdk?hl=ja)から gcloud CLI をインストール
```
# 確認コマンド
gcloud version
```
### Terraformのインストール
- [Terraform 公式](https://developer.hashicorp.com/terraform/install)から Terraform をインストール
```
# 確認コマンド
terraform version
```

## 実行コマンド
### Google Cloud認証の設定
```
# ログイン
gcloud auth login
# アプリケーション デフォルト認証 (ADC)
gcloud auth application-default login
```

### 初期化設定
```
terraform init
```

### 差分確認
```
terraform plan
```

### デプロイ
```
terraform apply
```

# CloudBuild実行
- CI/CD による品質担保と、ローカル環境の依存排除のため、初期構築を除いてはCloudBuild上から手動デプロイを実行する。
- apply トリガー実行時は、意図しない変更を防ぐため承認ステップを挟むものとする。
## 対象ブランチ
- [Githubリポジトリ]()のブランチに応じてデプロイ先を固定し、一貫性のあるリリース管理を行う。

| 環境 | ブランチ |
|----------|----------------|
| **開発環境(DEV)** | `develop` |
| **検証環境(STG)** | `staging` |
| **本番環境(PRD)** | `main` |

## 実行手順
### 差分確認
1. Cloud Buildコンソール画面からサイドメニュー[トリガー]を押下する。
2. トリガー[xxx-plan]を手動実行する。
3. ビルドログより、期待値通りの差分が出力されていることを確認する。

### デプロイ
1. トリガー[xxx-apply]を手動実行する。
2. ビルド詳細画面の URL を、再鑑者（承認権限者）へチャット等で共有する。
3. 再鑑者は共有された URL から内容を確認し、承認ボタンを押下してデプロイを完了させる。
