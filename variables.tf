variable "region" {
    type = string
    default = "us-east-1"
    description = "AWS Region"
}
variable "project" {
    type = string
    description = "Project Name"
}
variable "environment" {
    type = string
}

variable "images" {
    type = list(string)
    description = "List of images for repository"
}
