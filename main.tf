provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "accurate" 
    workspaces {
      name = "${var.project}-${var.environment}"
    }
  }
}

module "ecr" {
    source = "./module/ecr"
    project = var.project
    images = var.images
}