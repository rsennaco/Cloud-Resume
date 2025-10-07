# Variables from top level main.tf
variable "bucket_name" {
  type = string
}

variable "distribution_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
