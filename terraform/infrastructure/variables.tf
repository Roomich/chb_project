variable "tags" {
  type = map(any)
  default = {
    Project   = "diplom"
    Name      = "odinichenko"
    Terraform = true
  }
}

variable "acces_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "aws_region_name" {
  type = string
  default = "us-east-1"
}

variable "aws_key_pair_name" {
  type = string
  default = "odinichenko"
}