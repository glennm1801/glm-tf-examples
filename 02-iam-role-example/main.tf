provider "aws" {
  region = var.aws_region
}

data "aws_iam_policy_document" "instance_policy_s3" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:*"]
    resources = [var.bucket_arn]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "instance_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "iam_s3_policy" {
  name        = "demo102-sample-policy"
  description = "Demo 102 Policy"
  policy      = data.aws_iam_policy_document.instance_policy_s3.json
}

resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.instance_trust.json
  tags               = merge(var.resource_tags)
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = var.role_name
  policy_arn = aws_iam_policy.iam_s3_policy.arn
}