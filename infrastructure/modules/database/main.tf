# 環境固有の値(プロジェクト名やリージョン名など)は直接記述せず、variables.tf の変数（var.xxx）経由で受け取る。

resource "google_bigtable_instance" "db_instance" {
  name = "${var.project}-${var.phase}-db"
  display_name = "Minimal DB for testing"
  deletion_protection = false

  cluster {
    cluster_id = "cluster-min"
    zone = "${var.region}-a"
    num_nodes = 1
    storage_type = "HDD"
  }
}

resource "google_bigtable_table" "db_table" {
  name = "${var.project}-${var.phase}-db"
  instance_name = google_bigtable_instance.db_instance.name
}