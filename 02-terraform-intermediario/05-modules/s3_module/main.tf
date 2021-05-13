resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl = var.acl
  policy = var.policy
  tags = var.tags

  # Insere as informações abaixo somente caso informe no módulo
  dynamic "website" {  # Acesso o bloco dinâmico com o nome dele
    # Serve para iterar se o recurso tem um ou mais blocos dinâmico do mesmo tipo
    for_each = length(keys(var.website)) == 0 ? [] : [var.website]
    content {
      index_document = lookup(website.value, "index_document", null)
      error_document = lookup(website.value, "error_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules = lookup(website.value, "routing_rules", null)
    }
  }
}

module "object" {
  source = "./s3_object"
  for_each = var.files != "" ? fileset(var.files, "**") : []  # fileset percorre a pasta de forma "**" (recursiva)
  bucket = aws_s3_bucket.this.bucket
  key = "${var.key_prefix}/${each.value}"
  src = "${var.files}/${each.value}"  # each.value preenche o nome de forma automática a cada iteração
}