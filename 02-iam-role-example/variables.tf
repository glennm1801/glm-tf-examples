variable "aws_region" {
  type        = string
  description = "Region where the bucket should be created"
  default     = "us-east-1"
}

variable "bucket_arn" {
  type        = string
  description = "Bucket ARN"
}

variable "role_name" {
  type        = string
  description = "Role Name"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "sdt-training",
    environment = "dev"
  }
}