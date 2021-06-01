output "rendered_policy" {
  description = "S3 IAM Policy"
  value = data.aws_iam_policy_document.instance_policy_s3.json
}

output "policy_arn" {
  description = "ARN of created s3 policy"
  value = aws_iam_policy.iam_s3_policy.arn
}

output "role_arn" {
  description = "ARN of created role"
  value = aws_iam_role.iam_role.arn
}
