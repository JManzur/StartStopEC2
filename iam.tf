# IAM Policy: Allow Lambda to Stop/Start EC2 and send Logs to CloudWatch
resource "aws_iam_policy" "startstop_ec2_policy" {
  name        = "startstop_ec2_policy"
  path        = "/"
  description = "Start/Stop EC2 using Lambda"
  policy      = file("iam/lambda_iam_policy.json")
  tags        = merge(var.demo-startstop, { Name = "${var.tag_project}-policy" }, )
}

# IAM Role: Lambda execution role
resource "aws_iam_role" "startstop_ec2_policy_role" {
  name               = "startstop_ec2_policy_role"
  assume_role_policy = file("iam/lambda_iam_role.json")
  tags               = merge(var.demo-startstop, { Name = "${var.tag_project}-role" }, )
}

# Attach Role and Policy
resource "aws_iam_role_policy_attachment" "startstop_ec2_attach" {
  role       = aws_iam_role.startstop_ec2_policy_role.name
  policy_arn = aws_iam_policy.startstop_ec2_policy.arn
}