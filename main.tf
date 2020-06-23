module "ecr" {
    source = "./modules/ecr"
    project = var.project
    images = var.images
}