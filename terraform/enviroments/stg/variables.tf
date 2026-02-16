variable "project" {
  description = "案件名"
  type = string
  default = "watching-plan-ai"
}

variable "phase" {
  description = "環境名"
  type = string
  default = "stg"
}

variable "account" {
  description = "アカウント番号"
  type = string
  default = "xxx" 
}

variable "region" {
  description = "リージョン名"
  type = string
  default = "asia-northeast1"
}