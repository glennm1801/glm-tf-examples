variable "aws_region" {
  type        = string
  description = "Region where the bucket should be created"
  default     = "us-east-1"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ssh_key" {
  type        = string
  description = "SSH Key for EC2"
  default     = ""
}

