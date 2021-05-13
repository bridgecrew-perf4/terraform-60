terraform {
  required_version = "0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-184984191515"
    key = "dev/03-data-source-s3/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}