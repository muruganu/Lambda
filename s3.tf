data "archive_file" "lambda_transaction_file" {
  source_dir = "app"
  output_path = "app.zip"
  type        = "zip"
}


resource "aws_s3_bucket" "lambda_s3_bucket" {
  bucket = "terraform-lambda-s3-bucket"
  tags = {
    Name = "My Bucket"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_acl" "lambda_s3_bucket_acl" {
  bucket = aws_s3_bucket.lambda_s3_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "lambda_s3_object" {
  bucket = aws_s3_bucket.lambda_s3_bucket.id
  key    = "app.zip"
  source = data.archive_file.lambda_transaction_file.output_path
  etag = filemd5(data.archive_file.lambda_transaction_file.output_path)
}