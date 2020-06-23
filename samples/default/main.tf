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
   version = "1.0.8"    
   project = "myproject" #lower caase required
   environment = "test"   
   images = ["myimage1","myimage2","myimage3"]
   }