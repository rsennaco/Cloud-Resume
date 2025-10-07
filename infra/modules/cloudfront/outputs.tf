output "domain_name" {
  description = "Cloudfront distribution domain name"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "hosted_zone_id" {
  description = "Cloudfront hosted zone ID"
  value       = aws_cloudfront_distribution.cdn.hosted_zone_id
}

output "distribution_id" {
  description = "Cloudfront distribution ID"
  value       = aws_cloudfront_distribution.cdn.id
}
