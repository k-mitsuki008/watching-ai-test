# モジュールの呼び出し
module "network" {
  # フォルダの指定
  source = "../../modules/network"

  # 変数名の定義
  project = var.project
  phase = var.phase
  account = var.account
  region = var.region
}

module "storage" {
  # フォルダの指定
  source = "../../modules/storage"

  # 変数名の定義
  project = var.project
  phase = var.phase
  account = var.account
  region = var.region
}