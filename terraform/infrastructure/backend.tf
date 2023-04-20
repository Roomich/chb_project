terraform {
    backend "s3" {
        bucket = "dos11-odinichenko"
        key    = "infrastructure/terraform.tfstate"
        region = "us-east-1"
    }
}
