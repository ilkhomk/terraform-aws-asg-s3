resource "aws_iam_user" "ken" {
  name = "user-ken"
  path = "/system/"
}

resource "aws_iam_access_key" "key_k" {
  user = "aws_iam_user.ken.name"
}

resource "aws_iam_user_policy" "s3_role" {
  name = "test"
  user = "aws_iam_user.ken.name"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
       "Effect": "Allow",
       "Action": "s3:*",
       "Resource": "aws_s3_bucket.b.bucket"
    }   
    ]
}
EOF
}