data "terraform_remote_state" "server" {
  backend = "s3"
  config = {
    bucket = "tfstate-184984191515"
    key = "dev/03-data-source-s3/terraform.tfstate"
    region = "us-east-1"
  }
}