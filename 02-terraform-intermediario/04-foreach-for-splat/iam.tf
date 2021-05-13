resource "aws_iam_user" "the-accounts" {
  # Não aceita o método tolist
  for_each = toset(["Neto", "Cunha"])

  name = each.key # each.key and each.value são os mesmos para o set
}