variable "domain_name" {
  description = "The domain name for the Route53 hosted zone"
  type        = string
}

variable "region" {
    type = string
}

variable "acm_certificate_arn" {
  type = string
}

variable "bucket_regional_domain_name" {
    description = "The regional domain name of the S3 bucket for CloudFront origin."
    type        = string
}

variable "bucket_www_regional_domain_name" {
    description = "The regional domain name of the S3 bucket for CloudFront origin."
    type        = string
}

variable "zone_id" {
  description = "hosted zone for our domain in route53"
  type = string
}