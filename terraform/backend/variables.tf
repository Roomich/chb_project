variable "tags" {
  type = map(any)
  default = {
    Project   = "diplom"
    Name      = "odinichenko"
    Terraform = true
  }
}

variable "bucket_name" {
  type    = string
  default = "odinichenko-backend-bucket"
}