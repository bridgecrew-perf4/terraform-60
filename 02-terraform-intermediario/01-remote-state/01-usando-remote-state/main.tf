# Não utilizar variáveis dentro do bloco terraform
terraform {
  required_version = "0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
  # Serve para subir o arquivo tfstate para um local em que várias pessoas poderão utilizá-lo.
  backend "s3" {
    bucket = "tfstate-184984191515"
    key = "dev/01-usando-remote-state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}