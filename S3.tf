resource "aws_s3_bucket" "b" {
  bucket = "june_s3-bucket"
  acl    = "private"
  }