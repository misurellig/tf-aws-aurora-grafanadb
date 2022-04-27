data "aws_secretsmanager_secret" "aurora_grafana_serverless" {
  name = var.aurora_grafana_serverless_secret
}

data "aws_secretsmanager_secret_version" "aurora_grafana_serverless_v" {
  secret_id = data.aws_secretsmanager_secret.aurora_grafana_serverless.id
}
