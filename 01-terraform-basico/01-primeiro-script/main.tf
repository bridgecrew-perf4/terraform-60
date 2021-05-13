# Especificando qual versão do terraform e provider estou trabalhando
terraform {
  required_version = "0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

# Cloud que estou trabalhando
# Se o profile for o Default não precisa especificar
provider "aws" {
  region = "us-east-1"
}

# Recurso que será criado na aws
# Nome do recurso da aws, nome para o recurso
resource "aws_s3_bucket" "my-teste-bucket" {
  bucket        = "my-terraform258010022"
  acl           = "private"
  force_destroy = true

  tags = {
    Name       = "My bucket"
    Enviroment = "Dev"
    ManagedBy  = "Terraform"
    Owner      = "Nilson Cunha" # Adicionado depois
  }
}
