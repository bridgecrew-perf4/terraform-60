resource "aws_instance" "server" {
  count = local.instance_number <= 0 ? 0 : local.instance_number

  ami = var.instance_ami
  instance_type = lookup(var.instance_type, var.env)

  # Faz o merge das tags, em locals definimos as tags padrão e aqui definimos as que serão a mais
  tags = merge(
    local.common_tags,
    {
      Project = "Curso AWS terraform"
      Env = format("%s", var.env) # %s significa que vou passar uma string
      Name = format("Instance %d", count.index + 1) # %d significa que vou passar um dígito
    }
  )
}