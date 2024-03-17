terraform {
  required_version = "~> 1.7.5"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
  /*
  backend "s3" {
    bucket         	   = "teraform-tfstate"
    key                = "state/terraform.tfstate"
    region         	   = "eu-central-1"
    encrypt        	   = true
  */
}

provider "aws" {
  region = "eu-central-1"
  profile = "default"
}



module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source = "./ec2"

  subnet-private-1 = module.vpc.subnet-private-1
  subnet-private-2 = module.vpc.subnet-private-2

  web-sg = module.security_groups.web-sg
}

module "security_groups" {
  source = "./security-group"
  
  vpc = module.vpc.vpc
}

module "routing" {
  source = "./routing"

  vpc = module.vpc.vpc
  subnet-public-3 = module.vpc.subnet-public-3
  subnet-public-4 = module.vpc.subnet-public-4

  subnet-private-1 = module.vpc.subnet-private-1
  subnet-private-2 = module.vpc.subnet-private-2
}

module "aloadbalancer" {
  source = "./aloadbalancer"

  vpc = module.vpc.vpc
  subnet-public-3 = module.vpc.subnet-public-3
  subnet-public-4 = module.vpc.subnet-public-4

  ec2-1 = module.ec2.ec2-1
  ec2-2 = module.ec2.ec2-2

  alb-sg = module.security_groups.alb-sg
}