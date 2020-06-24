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