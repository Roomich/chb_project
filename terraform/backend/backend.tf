terraform {
  backend "s3" {
    bucket = "odinichenko-backend-bucket"
    key    = "backend/terraform.tfstate"
    region = "us-east-1"
  }
}
