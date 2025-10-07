variable "domain_name" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}
