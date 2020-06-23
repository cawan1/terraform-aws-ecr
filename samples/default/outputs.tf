output "repositories" {
  value = module.accurate.ecr_repositories
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.accurate.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.accurate.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.accurate.public_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.accurate.database_subnets
}


# output "cdn-domainname" {
#   value = "${aws_cloudfront_distribution.distribution.domain_name}"
# }

# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = module.vpc.vpc_id
# }

# Subnets
# output "private_subnets" {
#   description = "List of IDs of private subnets"
#   value       = module.vpc.private_subnets
# }

# output "public_subnets" {
#   description = "List of IDs of public subnets"
#   value       = module.vpc.public_subnets
# }

# output "database_subnets" {
#   description = "List of IDs of database subnets"
#   value       = module.vpc.database_subnets
# }

# output "rds_postgres_instance_endpoint" {
#   description = "Connection Endpoint"
#   value       = "${module.db.this_db_instance_endpoint}"
# }

# output "rds_postgres_instance_name" {
#   description = "The database name"
#   value       = "${module.db.this_db_instance_name}"
# }

# output "rds_postgres_instance_username" {
#   description = "The master username for the database"
#   value       = "${module.db.this_db_instance_username}"
# }