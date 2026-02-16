provider "google" {
  project = "208342950473"
  region  = "asia-northeast1"
}

# Terraform自体のバージョン指定（任意ですが推奨）
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}