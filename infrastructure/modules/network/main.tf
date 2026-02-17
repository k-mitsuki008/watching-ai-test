# 環境固有の値(プロジェクト名やリージョン名など)は直接記述せず、variables.tf の変数（var.xxx）経由で受け取る。

resource "google_compute_network" "vpc" {
  name = "${var.project}-${var.phase}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = "${var.project}-${var.phase}-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network = google_compute_network.vpc.self_link
  region = var.region
}