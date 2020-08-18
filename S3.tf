resource "aws_s3_bucket" "b" {
  bucket = "my-tf-s3-bucket2020"
}

resource "aws_s3_bucket_policy" "b" {
  bucket = "${aws_s3_bucket.b.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject","s3:GetObjectVersion","s3:PutObject"],
      "Resource": "arn:aws:s3:::my-tf-s3-bucket2020/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}