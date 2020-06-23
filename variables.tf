variable "project" {
    type = string
    description = "Project Name"
}
variable "images" {
    type = list(string)
    description = "List of images for repository"
}
