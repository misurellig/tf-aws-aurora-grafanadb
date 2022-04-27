module "grafana_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "6.2.0"

  name        = var.aurora_name
  engine      = var.engine
  engine_mode = var.engine_mode

  vpc_id                  = data.aws_vpc.selected.id
  subnets                 = data.aws_subnets.selected.ids
  allowed_security_groups = data.aws_security_groups.grafana_sg_list.ids
  create_db_subnet_group  = var.create_db_subnet_group
  create_security_group   = false

  storage_encrypted = true
  apply_immediately = true

  create_monitoring_role  = var.create_monitoring_role
  create_random_password  = false
  master_username = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["master_username"]
  master_password = jsondecode(
    data.aws_secretsmanager_secret_version.aurora_grafana_serverless_v.secret_string
  )["master_password"]

  scaling_configuration        = var.scaling_configuration
  preferred_maintenance_window = var.preferred_maintenance_window

  cluster_tags = {
    "Name" = var.aurora_name
  }
}

resource "aws_route53_record" "grafana_db" {
  zone_id = data.aws_route53_zone.grafana_db.id
  name = var.aurora_r53_dns_record
  type = "CNAME"
  ttl = 300
  records = [ module.grafana_aurora.cluster_endpoint ]
}

