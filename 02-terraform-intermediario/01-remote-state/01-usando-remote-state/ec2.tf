resource "aws_instance" "web" {
  ami = var.ami
  instance_type = var.instance

  tags = {
    Name = "Remote state"
    Env = "dev"
  }
}