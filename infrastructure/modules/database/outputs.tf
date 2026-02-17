output "bigtable_instance_name" {
  value = google_bigtable_instance.db_instance.name
}

output "bigtable_table_name" {
  value = google_bigtable_table.db_table.name
}