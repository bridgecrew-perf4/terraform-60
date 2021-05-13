# Criando um bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${random_pet.bucket.id}-${var.enviroment}"
  acl    = "private"
  tags   = local.common_tags
}

resource "aws_s3_bucket" "cliaws" {
  bucket = "bucketcriadopeloconsole"

  tags = {
    Importado = "28/04/2021"
    ManagedBy = "Terraform"
  }
}

# Criando um objeto no bucket
resource "aws_s3_bucket_object" "this" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "config/${local.ip_filepath}" # Local que será salvo o arquivo no bucket
  source       = local.ip_filepath             # caminho que está o arquivo, aqui está na raiz
  etag         = filemd5(local.ip_filepath)    # identifica quando o conteúdo do arquivo foi alterado para subir novamente
  content_type = local.application_type

  tags = local.common_tags
}

resource "aws_s3_bucket_object" "random" {
  bucket       = aws_s3_bucket.bucket.bucket
  key          = "config/${random_pet.bucket.id}.json" # Local que será salvo o arquivo no bucket
  source       = local.ip_filepath                     # caminho que está o arquivo, aqui está na raiz
  etag         = filemd5(local.ip_filepath)            # identifica quando o conteúdo do arquivo foi alterado para subir novamente
  content_type = local.application_type

  tags = local.common_tags
}