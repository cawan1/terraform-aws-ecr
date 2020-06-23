#####  GENERAL #######
variable "project" {
  default = "pantheon"
}

variable "environment" {
  default = "dev"
}


######   ECR    ########
variable "ecr_project" {
  default = "facial"
}
variable "ecr_repositories" {
  type = list(string)
  default = ["blink-recognition","blink-recognition-client","face-recognition"]
}


######   NETWORK  #########
variable "cidr" {
  default = "20.10.0.0/16"
}

variable "azs" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets" {
  type = list(string)
  default = ["20.10.1.0/24", "20.10.2.0/24"]
}

variable "public_subnets" {
  type = list(string)
  default = ["20.10.11.0/24", "20.10.12.0/24"]
}

variable "database_subnets" {
  type = list(string)
  default = ["20.10.21.0/24", "20.10.22.0/24"]
}





######   DATABASE   #########
variable "db_username" {
  default = "dbadmin"
}

variable "db_password" {
  default = "50820ca6b63e5a1fb873d007af72f900"
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_instance_port" {
  default = "5432"
}

variable "db_engine" {
  default = "postgres"
}

variable "db_engine_version" {
  default = "9.6.9"
}

variable "db_storage_type" {
  default = "gp2"
}

variable "db_allocated_storage" {
  type = number
  default = 5
}




######   CDN   #########

variable "default_root_object" {
  default = "index.html"
}

variable "allowed_methods" {
  type = list(string)
  default = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "cached_methods" {
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "price_class" {
  default = "PriceClass_All"
}

variable "default_ttl" {
  type = number
  default = 3600
}

variable "max_ttl" {
  type = number
  default = 86400
}

variable "cloudfront_default_certificate" {
  type = bool
  default = true
}

variable "restriction_type" {
  default = "none"
}