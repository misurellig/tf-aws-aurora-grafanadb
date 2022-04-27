terraform {
  required_providers {
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.12"
    }
  }
}

provider "mysql" {
  endpoint = var.grafana_endpoint
  username = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["master_username"]
  password = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["master_password"]
}
