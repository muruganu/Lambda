output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.lambda_function_s3_gateway.function_name
}

output "S3_Bucket_name" {
  value = aws_s3_bucket.lambda_s3_bucket.id
}