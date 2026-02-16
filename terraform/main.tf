# resource "リソース名" "Terraform内変数名" {}
resource "google_storage_bucket" "my_bucket" {
  name          = "test-bucket-katakai"
  location      = "ASIA-NORTHEAST1"
  force_destroy = true
  public_access_prevention = "enforced"
}