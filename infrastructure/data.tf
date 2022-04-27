data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["default VPC"]
  }
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name = "tag:Name"
    values = var.aurora_sn_list
  }
}

data "aws_security_groups" "aurora_sg" {
  filter {
    name   = "tag:Name"
    values = var.aurora_sg_list
  }
}

data "aws_secretsmanager_secret" "aurora_grafana_serverless" {
  name = var.aurora_grafana_serverless_secret
}

data "aws_secretsmanager_secret_version" "aurora_grafana_serverless_v" {
  secret_id = data.aws_secretsmanager_secret.aurora_grafana_serverless.id
}

data "aws_route53_zone" "grafana_db" {
  name         = var.grafana_db_dns_zone
  private_zone = var.r53_private_zone
}