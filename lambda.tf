# Zip the lambda code
data "archive_file" "init" {
  type        = "zip"
  source_file = "lambda_code/startstop_ec2.py"
  output_path = "lambda_code/startstop_ec2.zip"
}

# Create lambda function
resource "aws_lambda_function" "startstop_ec2_function" {
  filename      = data.archive_file.init.output_path
  function_name = "startstop_ec2_function"
  role          = aws_iam_role.startstop_ec2_policy_role.arn
  handler       = "startstop_ec2.lambda_handler"

  # Prevent lambda recreation
  source_code_hash = filebase64sha256(data.archive_file.init.output_path)

  runtime = "python3.8"
}