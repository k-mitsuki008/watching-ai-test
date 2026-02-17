# モジュール内で使用する変数を定義する。

variable "project" {
  description = "案件名"
  type = string
}

variable "phase" {
  description = "環境名"
  type = string
}

variable "account" {
  description = "アカウント番号"
  type = string
}

variable "region" {
  description = "リージョン名"
  type = string
}

# 他モジュールから参照する値がある場合は、定義する。
variable "vpc_id"  { type = string }