output "cdn-domainname" {
  value = aws_cloudfront_distribution.distribution.domain_name
  description = "CDN Domain name"
}
