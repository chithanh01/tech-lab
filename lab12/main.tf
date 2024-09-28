terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-backend-bounty"
    key    = "backend.tfstate"
    region = "ap-southeast-1"
  }
}