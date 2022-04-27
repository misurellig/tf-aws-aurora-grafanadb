variable "grafana_endpoint" {
  type    = string
  default = ""
}

variable "aurora_grafana_serverless_secret" {
  type    = string
  default = ""
}

variable "grafana_db" {
  type    = string
  default = "grafana"
}

variable "default_character_set" {
  type    = string
  default = "utf8mb4"
}

variable "default_collation" {
  type    = string
  default = "utf8mb4_unicode_ci"
}
