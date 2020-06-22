######   ECR    ########
variable "project" {
  description = "Project Name"
  #default = "facial"
}
variable "repositories" {
  type = list(string)
  #default = ["blink-recognition","blink-recognition-client","face-recognition"]
}