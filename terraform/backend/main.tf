resource "aws_s3_bucket" "odinichenko_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "odinichenko_bucket_acl" {
  bucket = aws_s3_bucket.odinichenko_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "odinichenko_bucket_versioning" {
  bucket = aws_s3_bucket.odinichenko_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}