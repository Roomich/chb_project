terraform {
  backend "s3" {
    bucket = "odinichenko-backend-bucket"
    key    = "infrastructure/terraform.tfstate"
    region = "us-east-1"
  }
}