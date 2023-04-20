terraform {
    backend "s3" {
        bucket = "dos11-diplom-example-backend"
        key    = "infra/terraform.tfstate"
        region = "eu-central-1"
    }
}
