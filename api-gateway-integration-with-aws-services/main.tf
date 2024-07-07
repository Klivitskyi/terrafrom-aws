terraform {
  required_version = "~> 1.9.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = var.region
  profile = "default"
}

module "apigateway" {
  source = "./api-gateway"
  region = var.region
}

