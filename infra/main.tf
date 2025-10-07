module "s3" {
  source = "./modules/s3"

  # Passing variables
  bucket_name     = var.bucket_name
  distribution_id = module.cloudfront.distribution_id
  tags            = var.common_tags
}

module "cloudfront" {
  source = "./modules/cloudfront"

  bucket_name  = var.bucket_name
  bucket_arn   = module.s3.bucket_arn
  domain_name  = var.domain_name
  s3_origin_id = module.s3.origin_id
  s3_domain    = module.s3.bucket_regional_domain_name
  acm_cert_arn = module.route53.acm_cert_arn
  tags         = var.common_tags
}

module "route53" {
  source = "./modules/route53"

  domain_name         = var.domain_name
  distribution_domain = module.cloudfront.domain_name
  distribution_zoneid = module.cloudfront.hosted_zone_id
  tags                = var.common_tags
}
