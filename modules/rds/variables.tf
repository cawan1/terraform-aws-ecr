variable "project" {
  type = string
  description = "Project Name"
}

variable "environment" {
  type = string
  description = "environment"
}

variable "db_username" {
  type = string
  default = "dbadmin"
  description = "Root username for rds"
}

variable "db_password" {
  type = string
  default = "50820ca6b63e5a1fb873d007af72f900"
  description = "Password for root user"
}

variable "db_instance_class" {
  type = string
  default = "db.t2.micro"
  description = "RDS instance type"
}

variable "db_instance_port" {
  type = string
  default = "5432"
  description = "Port of db instance"
}

variable "db_engine" {
  type = string
  default = "postgres"
  description = "The database engine to use"
}

variable "db_engine_version" {
  type = string
  default = "9.6.9"
  description = "	The engine version to use"
}

variable "db_storage_type" {
  type = string
  default = "gp2"
}

variable "db_allocated_storage" {
  type = number
  default = 5
  description = "Size in GB for storage allocated for database"
}


variable "db_family" {
  type = string
  default = "postgres9.6"
  description = "The family of the DB parameter group	"
}


variable "db_major_engine_version" {
  type = string
  default = "9.6"
  description = "	Specifies the major version of the engine that this option group should be associated with"
}

variable "vpc_id" {
  type = string
  description = "VPC ID which RDS will run"
}

variable "database_subnets" {
  type = list(string)
  description = "List of database subnets CIDR"
}