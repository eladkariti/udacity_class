
resource "aws_iam_role" "udacity_lambda_role" {
  name               = "udacity_lambda_role"
  assume_role_policy = file("policy/udacity-lambda-assume-policy.json")
}

# See also the following AWS managed policy: AWSLambdaBasicExecutionRole
resource "aws_iam_policy" "udacity_lambda_policy" {
  name        = "udacity_lambda_policy"
  description = "IAM policy for logging from a lambda"

  policy = file("policy/udacity-lambda-policy.json")
}
