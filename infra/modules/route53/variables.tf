# Variables from top level main.tf
variable "domain_name" {
  type = string
}

variable "distribution_domain" {
  type = string
}

variable "distribution_zoneid" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
