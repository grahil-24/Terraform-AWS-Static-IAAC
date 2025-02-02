module "route53" {
  source      = "./modules/route53"
  domain_name = var.domain
}

module "s3" {
  source      = "./modules/s3"
  domain = var.domain
}

module "cer" {
  source = "./modules/cer"
  domain_name = var.domain
}

module "cloudfront" {
  source = "./modules/cloudfront"
  domain_name = var.domain
  region = var.region
  acm_certificate_arn = module.cer.acm_certificate_arn
  bucket_root_website_endpoint = module.s3.bucket_root_website_endpoint
  bucket_www_website_endpoint = module.s3.bucket_www_website_endpoint
  zone_id = module.route53.zone_id
}


