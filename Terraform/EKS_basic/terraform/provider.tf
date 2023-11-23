provider "aws" {
  # profile = "terraform"
  region = "us-east-1"
}

terraform {
  # required_version = ">= 0.12.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.21"
    }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = ">= 2.10"
    # }
  }
}