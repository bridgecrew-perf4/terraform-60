terraform {
  required_version = "0.15.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "bootcamp"
}

resource "random_pet" "this" {
  length = 3
}

module "bucket" {
  source = "./s3_module"
  name = random_pet.this.id
}

# Criando o random_pat para o bucket do website
resource "random_pet" "website" {
  length = 3
}

# Criando o bucket para o website passando os parâmetros do website
module "website" {
  source = "./s3_module"
  name = random_pet.website.id
  files = "${path.root}/website"  # path.root é a pasta principal, aqui 05-modules
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

  # Passando a policy para acessar o bucket externamente
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": [
        "arn:aws:s3:::${random_pet.website.id}/*"
      ]
    }
  ]
}
EOT
}