terraform {
    backend "s3" {
        bucket = "dos11-diplom-example-backend"
        key    = "s3_bucket/terraform.tfstate"
        region = "eu-central-1"
    }
}