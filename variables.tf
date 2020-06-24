variable "project" {
    type = string
    description = "Project Name"
}

variable "environment" {
    type = string
    description = "Environment"
}

# variable "images" {
#     type = list(string)
#     description = "List of images for repository"
# }

variable "rds_db_password" {
    type = string
    description = "Root user password"
}