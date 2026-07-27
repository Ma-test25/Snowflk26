terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.0"
    }
  }

  backend "remote" {
    organization = "Ma_Snow"

    workspaces {
      name = "snowflk26-demo"
    }
  }
}

provider "snowflake" {
  organization_name = "XPZNHDN"
  account_name      = "LLB66471"

  user     = "MAHINDHA"
  password = var.snowflake_password
}

variable "snowflake_password" {
  description = "Snowflake password"
  type        = string
  sensitive   = true
}

resource "snowflake_database" "demo_day" {
  name    = "DEMO_DAY"
  comment = "Database created using Terraform Cloud and GitHub Actions"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.demo_day.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}
