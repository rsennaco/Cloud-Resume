provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = "ennaco-website-bucket"
}