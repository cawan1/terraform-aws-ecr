
*Accurate Software*

# AWS Terraform module

Accurate AWS Terraform module.

Terraform module which creates resources on AWS.

## Usage

     module  "accurate" {    
        source = "app.terraform.io/accurate/ecr/aws"    
        version = "1.0.4"    
        project = "myproject"
        environment = "test"   
        images = ["myimage1","myimage2","myimage3"]

        }

## Input
|  Name|Description   | Type | Default
|--|--|--|--|
|  region | AWS Region | `string`| "us-east-1" |
|  project| The name of the project for the repository lower case required | `string`| n/a |
|  images| List of images names | `list(string)`| n/a |

## Outputs

|Name|Description  |
|--|--|
|repositories  | List of "repository name = repository url"  |
|vpc_id  | The ID of the VPC  |
|private_subnets  | List of IDs of private subnets  |
|public_subnets  | List of IDs of public subnets  |
|database_subnets  | List of IDs of database subnets  |

## Examples
[Pantheon-Dev](https://git.acclabs.com.br/gitlab/acc/aplicacao-modelo-aws/src/tree/master/terraform/dev)