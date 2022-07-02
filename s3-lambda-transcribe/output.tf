output "S3_bucket_name" {
  value = aws_s3_bucket.lambda_s3_bucket.bucket_domain_name
}

output "Lambda_handler_name" {
  value = aws_lambda_function.lambda-transcribe-function.handler
}