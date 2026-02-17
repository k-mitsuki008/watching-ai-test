output "hosting_bucket_name" {
  description = "ホスティングバケット"
  value = module.storage.hosting_bucket_name
}

output "vpc_id" {
  description = "VPCID"
  value = module.network.vpc_id
}

output "subnet_id" {
  description = "サブネットID"
  value = module.network.subnet_id
}

output "bigtable_instance_name" {
  description = "データベース名"
  value = module.database.bigtable_instance_name
}

output "bigtable_table_name" {
  description = "テーブル名"
  value = module.database.bigtable_table_name
}