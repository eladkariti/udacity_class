# TODO: Designate a cloud provider, region, and credentials

locals {
  lambda_zip_location = "output/udacity_lambda.zip"
}

data "archive_file" "Udacity_Lambda" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = local.lambda_zip_location
}

resource "aws_lambda_function" "Udacity_Lambda" {
  role             = aws_iam_role.udacity_lambda_role.arn
  function_name    = "Udacity_Lambda"
  filename         = local.lambda_zip_location
  handler          = "greet_lambda.lambda_handler"
  source_code_hash = filebase64sha256(local.lambda_zip_location)
  runtime          = "python3.8"

  tags = {
    class = "Udacity lambda"
  }

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.Udacity_Lambda_Log_Group,
  ]
}

# This is to optionally manage the CloudWatch Log Group for the Lambda Function.
# If skipping this resource configuration, also add "logs:CreateLogGroup" to the IAM policy below.
resource "aws_cloudwatch_log_group" "Udacity_Lambda_Log_Group" {
  name              = "/aws/lambda/Udacity_Lambda"
  retention_in_days = 14
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.udacity_lambda_role.name
  policy_arn = aws_iam_policy.udacity_lambda_policy.arn
}




