######   ECR    ########
variable "project" {
  type = string
  description = "Project Name"
  #default = "facial"
}
variable "images" {
  type = list(string)
  #default = ["blink-recognition","blink-recognition-client","face-recognition"]
}