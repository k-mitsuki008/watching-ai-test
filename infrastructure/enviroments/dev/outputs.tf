output "hosting_bucket_name" {
  description = "ホスティングバケット"
  value = module.storage.hosting_bucket_name
}

output "vpc_id" {
  description = "VPCID"
  value = google_compute_network.vpc.id
}

output "subnet_id" {
  description = "サブネットID"
  value = google_compute_subnetwork.subnet.id
}