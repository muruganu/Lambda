resource "aws_iam_role" "transcribe-meeting-role" {
  name = "transcribe-meeting-role"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
  {
    "Effect": "Allow",
    "Action": [
    "sts:AssumeRole"
  ],
    "Principal": {
    "Service": [
    "lambda.amazonaws.com"
  ]
  }
  }
  ]
  })
  tags = {
    "app" = "meeting-transcriber"
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = "${aws_iam_role.transcribe-meeting-role.name}"
}

resource "aws_iam_role_policy_attachment" "transcribe-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonTranscribeFullAccess"
  role       = "${aws_iam_role.transcribe-meeting-role.name}"
}

resource "aws_iam_role_policy_attachment" "s3-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "${aws_iam_role.transcribe-meeting-role.name}"
}

resource "aws_lambda_permission" "lambda_persmission" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda-transcribe-function.function_name
  principal     = "s3.amazonaws.com"
  statement_id = "AllowS3Invoke"
  source_arn = aws_s3_bucket.lambda_s3_bucket.arn
}