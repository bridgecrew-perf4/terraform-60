variable "aws_region" {
  type = string
  description = ""
  default = "us-east-1"
}

variable "instance_ami" {
  type = string
  description = ""
  default = "ami-0742b4e673072066f"
}

variable "instance_type" {
  type = string
  description = ""
  default = "t2.micro"
}

variable "instance_tags" {
  type = map(string)
  description = ""
  default = {
    Name = "Ubuntu"
    Project = "Curso AWS com Terraform"
  }
}