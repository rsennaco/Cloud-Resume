# Variables from top level main.tf
variable "bucket_name" {
  type = string
}

variable "bucket_arn" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "s3_origin_id" {
  type = string
}

variable "s3_domain" {
  type = string
}

variable "acm_cert_arn" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
