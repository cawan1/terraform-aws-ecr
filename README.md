
*Accurate Software*

# AWS Terraform module

APP Modelo AWS Terraform module.

Terraform module which creates resources on AWS.

This module by default will create:
- VPC
  - 3 subnets
- RDS
  - Free-tier Postgres - Public Accessible
- CDN
  - CloudFront Distribution
  - S3 Bucket
  

## Usage

     module  "accurate" {    
        source = "app.terraform.io/accurate/ecr/aws"    
        version = "1.0.0"    
        project = "myproject"
        environment = "test"   
        rds_db_password = "mypassword123"
        }

## Input
|  Name|Description   | Type | Default | Required
|--|--|--|--|--|
|  project| The name of the project for the repository lower case required | `string`| n/a | yes |
|  environment | The environment of the project | `string`| n/a | yes |
|  rds_db_password | Password for root user in RDS Postgres instance | `string`| n/a | yes |

## Outputs

|Name|Description  |
|--|--|
|vpc_id  | The ID of the VPC  |
|private_subnets  | List of IDs of private subnets  |
|public_subnets  | List of IDs of public subnets  |
|database_subnets  | List of IDs of database subnets  |
|rds_instance_endpoint  | Endpoint Connection  |
|rds_instance_name  | The database name  |
|rds_instance_username  | The master username for the database  |
|cdn_domainname | CDN Domain name |


## Examples
  - [Pantheon-Dev](https://git.acclabs.com.br/gitlab/acc/aplicacao-modelo-aws/src/tree/master/terraform/dev)
  - [Sample-Default](https://git.acclabs.com.br/gitlab/acc/aplicacao-modelo-aws/terraform-aws-accurate/tree/master/samples/default)
