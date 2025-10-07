# Site files
locals {
  site_files = {
    "index.html" = "${path.root}/../site/index.html"
    "404.html"   = "${path.root}/../site/404.html"
  }
}

# Private S3 bucket
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
  tags   = var.tags
}

# Increase security with bucket-owner-only, blocking public access, and disable ACLs
resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Bucket policy is in cloudformation main.tf for dependency reasons

# Site files
resource "aws_s3_object" "site_files" {
  for_each      = local.site_files
  bucket        = aws_s3_bucket.site.id
  key           = each.key
  source        = each.value
  etag          = filemd5(each.value)
  content_type  = "text/html"
  cache_control = "no-cache"

  depends_on = [
    aws_s3_bucket.site,
    aws_s3_bucket_ownership_controls.site,
    aws_s3_bucket_public_access_block.site
  ]
}
