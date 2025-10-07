# Outputs for other modules to reference
output "origin_id" {
  description = "Stable origin identifier for Cloudfront"
  value       = "s3-${aws_s3_bucket.site.id}"
}

output "bucket_regional_domain_name" {
  description = "S3 REST endpoint for the bucket"
  value       = aws_s3_bucket.site.bucket_regional_domain_name
}

output "bucket_arn" {
  value = aws_s3_bucket.site.arn
}
