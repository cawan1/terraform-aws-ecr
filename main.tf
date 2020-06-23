module "ecr" {
    source = "./modules/ecr"
    project = var.project
    images = var.images
}

module "vpc" {
    source = "./modules/vpc"
    project = var.project
    environment = var.environment
}