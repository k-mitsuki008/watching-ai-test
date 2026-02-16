# GCPへの接続設定
provider "google" {
  project = var.project
  region = var.region
}

# Terraform自体のバージョン指定
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  # GCPプロジェクト内のステータスを保存
  backend "gcs" {
    bucket = "watching-plan-ai-dev-gcp-state-bucket"
    prefix = "terraform/state"
  }
}