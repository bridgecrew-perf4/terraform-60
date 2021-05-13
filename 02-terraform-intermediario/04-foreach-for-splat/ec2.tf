data "aws_ami" "ubuntu" {
  owners = ["amazon"]
  most_recent = true
  name_regex = "linux"
}

resource "aws_instance" "this" {
  for_each = {
    # key
    web = {
      # values
      name = "Web server"
      type = "t2.micro"
    }
    # key
    ci_cd = {
      # values
      name = "CI/CD server"
      type = "t2.micro"
    }
  }

  ami = data.aws_ami.ubuntu.id
  # lookup recupera o valor de um único elemento de um mapa, dada sua chave
  # lookup(map, key, default)
  instance_type = lookup(each.value, "type", null) # Dado meus valores quero pegar a chave "type"

  tags = {
    Project = "Curso AWS com Terraform"
    Name = "${each.key}: ${lookup(each.value, "name", null)}"
    Lesson = "Foreach, For, Splat"
  }
}