variable "region" {
	description = "name of the region"
	type = string
}

variable "domain" {
	description = "name of our domain. will be useful in configuring s3 bucket and route53"
	type = string
}