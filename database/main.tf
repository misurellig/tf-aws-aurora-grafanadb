resource "mysql_database" "grafana_db" {
  name                  = var.grafana_db
  default_character_set = var.default_character_set
  default_collation     = var.default_collation
}

resource "mysql_user" "grafana_usr" {
  user = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["grafana_username"]
  plaintext_password = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["grafana_password"]
  host = "%"
}

resource "mysql_grant" "grafana_db" {
  user       = mysql_user.grafana_usr.user
  host       = mysql_user.grafana_usr.host
  database   = mysql_database.grafana_db.name
  privileges = ["ALL"]
}
