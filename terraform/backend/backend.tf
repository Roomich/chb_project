terraform {
    backend "s3" {
        bucket = "dos11-odinichenko"
        key    = "s3_bucket/terraform.tfstate"
        region = "us-east-1"
    }
}