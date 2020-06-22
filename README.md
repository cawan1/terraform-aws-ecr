
*Accurate Software*

# terraform-aws-ecr

AWS ECR Terraform module
Accurate Terraform module which creates ECR resources on AWS.

AWS ECR by default creates a repository for each image, just versioning image by tags.
We are using the name of the ECR repositories, such as "project/image:tag" for organizational purposes.

## Usage

     module  "ecr" {    
        source = "app.terraform.io/accurate/ecr/aws"    
        version = "1.0.0"    
        project = "MyProject"    
        images = ["myimage1","myimage2","myimage3"]    
        }

## Input
|  Name|Description   | Type | Default
|--|--|--|--|
|  project| The name of the project for the repository | `string`| n/a |
|  images| List of images names | `list(string)`| n/a |

## Outputs

|Name|Description  |
|--|--|
|repositories  | List of "repository name = repository url"  |


## Examples
[Pantheon-Dev](https://git.acclabs.com.br/gitlab/acc/aplicacao-modelo-aws/src/tree/master/terraform/dev)