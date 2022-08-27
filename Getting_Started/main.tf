terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Parvez"

    workspaces {
      name = "getting_started"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.26.0"
    }
  }
}

locals {
  project_name = "parvez"
}