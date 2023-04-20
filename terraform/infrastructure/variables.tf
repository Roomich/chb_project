variable "tags" {
    type = map(any)
    default = {
        Project   = "diplom"
        Name      = "dos11"
        Terraform = true
    } 
}

variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}

variable "aws_region_name" {
    type = string
    default = "eu-central-1"
}

variable "aws_key_pair_name" {
    type = string
    default = "raguzin_frankfurt_key"
}