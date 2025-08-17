terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">= 1.8"

  backend "s3" {
    bucket  = "ennaco-tf-state"
    key     = "cloud-resume.tfstate"
    region  = "us-east-1"
    profile = "Robert-CLI"
  }
}
