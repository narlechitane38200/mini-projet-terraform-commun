terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.26.0"
    }
  }
  required_version = "1.14.2"

  backend "s3" {
    bucket = "terraform-backend-radouane"
    key    = "terraform.tfstate"
    region = "us-east-1"
    shared_credentials_files = [ "../.secrets/credentials" ]
    profile = "radouane-mini-projet"
  }
}


provider "aws" {
  region = var.app_region
  shared_credentials_files = [ "../.secrets/credentials" ]
  profile = "radouane-mini-projet"
}
