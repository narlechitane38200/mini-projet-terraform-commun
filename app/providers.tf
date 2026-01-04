terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.26.0"
    }
  }
  required_version = "1.14.2"
}


provider "aws" {
  region = var.app_region
  shared_credentials_files = [ "../.secrets/credentials" ]
  profile = "radouane-mini-projet"
}