variable "tags" {
    type = map(any)
    default = {
        Project   = "diplom"
        Name      = "dos11"
        Terraform = true
    }
}

variable "bucket_name" {
    type    = string
    default = "dos11-diplom-example-backend"
}