# tf-aws-aurora-grafanadb

Terraform configurations to create a AWS Aurora MySQL serverless for Grafana DB.

# Prerequisite

  * Aurora master and Grafana DB credentials saved in the same AWS Secrets Manager secret
    * `master_username` and `master_password` as secret keys
    * `grafana_username` and `grafana_password` as secret keys
  * A Route53 zone to create a DNS record for the DB endpoint

# Usage

There are two stages involved in the process:

  1. Aurora serverless infratructure creation
  1. Grafana DB initialization

Both with terraform configurations respectively in the folders `infrastructure` and `database`.

## Terraforming infrastructure

Move into the `infrastructure` folder and initialize configurations.

```hcl
terraform init
```

To plan configurations.

```hcl
terraform plan
```

To apply configurations

```hcl
terraform apply
```

To destroy configurations

```hcl
terraform destroy
```

## Terraforming database

Move into the `database` folder and initialize configurations.

```hcl
terraform init
```

To plan configurations.

```hcl
terraform plan
```

To apply configurations

```hcl
terraform apply
```

To destroy configurations

```hcl
terraform destroy
```


