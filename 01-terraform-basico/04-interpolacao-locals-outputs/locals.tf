# Serve para escrever algo que se repete, com isso escrevemos apenas uma vez em um locals.
locals {
  ip_filepath = "ips.json"

  application_type = "application/json"

  common_tags = {
    Service     = "Curso Terraform"
    ManagedBy   = "Terraform"
    Enviroments = var.enviroment
    Owner       = "Nilson Cunha"
  }
}