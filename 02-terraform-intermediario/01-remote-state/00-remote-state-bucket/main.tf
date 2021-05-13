terraform {
  required_version = "0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
# Serve para pegar as informações da conta
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote-state" {
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}" # Cria um bucket com o código da conta

  versioning {
    enabled = true
  }

  tags = {
    Description = "Stores terraform remote state files"
    Managedby = "Terraform"
  }
}

output "remote_state_bucket" {
  value = aws_s3_bucket.remote-state.bucket # Expõe o nome do bucket
}

output "remote_state_bucket_arn" {
  value = aws_s3_bucket.remote-state.arn # Expõe o arn do bucket
}