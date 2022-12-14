resource "aws_s3_bucket" "buck_test" {
  bucket_prefix = "${var.s3_bucket_name}-"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "buck_test" {
  bucket = aws_s3_bucket.buck_test.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "buck_test" {
  bucket = aws_s3_bucket.buck_test.id
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "${aws_s3_bucket.buck_test.arn}/*"
            ]
        }
    ]
    }
  POLICY
}