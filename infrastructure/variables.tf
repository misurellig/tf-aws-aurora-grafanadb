variable "aurora_name" {
  type    = string
  default = ""
}

variable "aurora_sn_list" {
  type = list
  default = []
}

variable "engine" {
  type    = string
  default = "aurora-mysql"
}

variable "engine_mode" {
  type    = string
  default = "serverless"
}

variable "create_monitoring_role" {
  type    = bool
  default = true
}

variable "create_db_subnet_group" {
  type    = bool
  default = true
}

variable "aurora_grafana_serverless_secret" {
  type    = string
  default = ""
}

variable "scaling_configuration" {
  type = map(any)
  default = {
    auto_pause               = true,
    min_capacity             = 1,
    max_capacity             = 64,
    seconds_until_auto_pause = 1800,
    timeout_action           = "ForceApplyCapacityChange"
  }
}

variable "preferred_maintenance_window" {
  type    = string
  default = "mon:10:00-mon:10:30"
}

variable "grafana_pg_name" {
  type    = string
  default = ""
}

variable "grafana_pg_family" {
  type    = string
  default = "aurora-mysql5.7"
}

variable "grafana_pg_desc" {
  type    = string
  default = "Grafana Aurora parameter group"
}

variable "aurora_r53_dns_record" {
  type = string
  default = ""
}

variable "grafana_pg_char_encode" {
  type    = string
  default = "utf8mb4"
}

variable "aurora_sg_list" {
  type = list
  default = []
}

variable "grafana_db_dns_zone" {
  type = string
  default = ""
}