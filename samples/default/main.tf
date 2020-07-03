provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "accurate" 
    workspaces {
      name = "validando4"
    }
  }
}

module  "accurate" {    
   source = "app.terraform.io/accurate/ecr/aws"    
   version = "1.2.6"    
   project = "myproject" #lower case required
   environment = "test"   
   rds_db_password = var.rds_db_password
   }
