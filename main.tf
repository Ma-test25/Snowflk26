terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
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
}

resource "snowflake_database" "demo_mahi" {
  name    = "DEMO_MAHI"
  comment = "Database for Snowflake Terraform demo"
}
