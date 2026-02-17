# モジュール追加の度に、ここに呼び出し定義を追記する。

module "network" {
  # フォルダの指定
  source = "../../modules/network"

  # 変数名の定義(enviroments/dev/variables.tfで定義した値を参照)
  project = var.project
  phase = var.phase
  account = var.account
  region = var.region
}

# module "database" {
#   source  = "../../modules/database"

#   project = var.project
#   phase = var.phase
#   account = var.account
#   region = var.region
#   vpc_id  = module.network.vpc_id
# }

module "storage" {
  source = "../../modules/storage"

  project = var.project
  phase = var.phase
  account = var.account
  region = var.region
}