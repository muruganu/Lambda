

resource "aws_lambda_function" "lambda_function_s3_gateway" {
  function_name = "lambda_function_s3_gateway"
  role          = "${aws_iam_role.lambda_exec_role.arn}"

  s3_bucket = aws_s3_bucket.lambda_s3_bucket.id
  s3_key = aws_s3_object.lambda_s3_object.key

  runtime = "python3.9"
  handler = "apigateway_lambdahandler.lambda_handler"

  source_code_hash = data.archive_file.lambda_transaction_file.output_base64sha256
}

