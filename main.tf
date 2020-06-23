module "ecr" {
    source = "./module/ecr"
    project = var.project
    images = var.images
}