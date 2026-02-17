resource "google_bigtable_instance" "instance" {
  name = "${var.project}-${var.phase}-db"
  display_name = "Minimal DB for testing"
  instance_type = "DEVELOPMENT"
  deletion_protection = false

  cluster {
    cluster_id = "cluster-min"
    zone = var.region
    storage_type = "HDD"
  }
}