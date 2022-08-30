output "arn_bucket" {
  description = "Arn of the bucket created"
  value       = aws_s3_bucket.buck_test.arn
}