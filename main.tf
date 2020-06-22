resource "aws_ecr_repository" "repository" {
  count = length(var.repositories)
  name                 = "${var.project}/${var.repositories[count.index]}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }

}