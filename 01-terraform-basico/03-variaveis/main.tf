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
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}