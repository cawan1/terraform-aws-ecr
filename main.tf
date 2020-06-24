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


module "rds" {
    source = "./modules/rds"
    project = var.project
    environment = var.
    vpc_id = module.vpc.vpc_id
    db_password = "cawanzinhoboladao001112"
}