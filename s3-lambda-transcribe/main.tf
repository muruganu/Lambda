resource "aws_lambda_function" "lambda-transcribe-function" {
  function_name = "lambda-transcribe-function"
  role          = aws_iam_role.transcribe-meeting-role.arn
  s3_bucket = aws_s3_bucket.lambda_s3_bucket.id
  s3_key = aws_s3_object.file_upload.key
  runtime = "python3.8"
  handler = "Lambda_Transcribe_S3.lambda_handler"
  source_code_hash = "${base64sha256(data.archive_file.s3_files.output_path)}"
}
