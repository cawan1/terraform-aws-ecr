provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "accurate" 
    workspaces {
      name = "validando3"
    }
  }
}

module  "accurate" {    
   source = "app.terraform.io/accurate/ecr/aws"    
   version = "1.2.3"    
   project = "myproject" #lower case required
   environment = "test"   
   }
