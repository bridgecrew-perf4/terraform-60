# Como não passei o campo defaul, o terraform irá perguntar qual é o ambiente
variable "env" {}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-0742b4e673072066f"

  validation {
    condition = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "Somente é válida com tipo informado"
  }
}
# Número de instâncias que irei rodar dependendo do ambiente
variable "instance_number" {
  type = object({
    dev = number
    prod = number
  })

  description = ""
  default = {
    dev = 1
    prod = 3
  }
}

variable "instance_type" {
  type = object({
    dev = string
    prod = string
  })

  description = ""
  default = {
    dev = "t2.micro"
    prod = "t2.micro"
  }
}