resource "google_compute_network" "vpc" {
  name = "${var.project}-${var.phase}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name = "${var.project}-${var.phase}-subnet"
  ip_cidr_range = var.cidr_range
  network = google_compute_network.vpc.id
  region = var.region
}