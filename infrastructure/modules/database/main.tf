resource "google_bigtable_instance" "db_instance" {
  name = "${var.project}-${var.phase}-db"
  display_name = "Minimal DB for testing"
  deletion_protection = false

  cluster {
    cluster_id = "cluster-min"
    zone = var.region
    storage_type = "HDD"
  }
}

resource "google_bigtable_table" "db_table" {
  name = "${var.project}-${var.phase}-db"
  instance_name = google_bigtable_instance.db_instance.name
}