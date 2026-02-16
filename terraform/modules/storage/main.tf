# resource "サービス名" "Terraform内の変数名"
resource "google_storage_bucket" "hosting_bucket" {
  name          = "${var.project}-${var.phase}-hosting-bucket"
  location      = var.region
  force_destroy = true

  # セキュリティ設定
  public_access_prevention = "enforced"
}