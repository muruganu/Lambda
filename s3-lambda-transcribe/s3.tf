data "archive_file" "s3_files" {
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

resource "aws_s3_object" "file_upload" {
  bucket = aws_s3_bucket.lambda_s3_bucket.id
  key    = "app.zip"
  source = data.archive_file.s3_files.output_path
  etag = filemd5(data.archive_file.s3_files.output_path)
}


resource "aws_s3_bucket_notification" "lambda_bucket_notification" {
  bucket = aws_s3_bucket.lambda_s3_bucket.id
  lambda_function {
    events = ["s3:ObjectCreated:*"]
    lambda_function_arn = aws_lambda_function.lambda-transcribe-function.arn
    filter_suffix = ".mp3"
  }
}