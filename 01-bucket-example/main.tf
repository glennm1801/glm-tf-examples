provider "aws" {
  region = var.aws_region
}

#resource "random_pet" "random_code" {
#  length = 2
#}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-test-s3-terraform-bucket"
#  bucket = "my-test-s3-terraform-bucket-${random_pet.random_code.id}"
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    Name = "my-test-s3-terraform-bucket"
#    Name = "my-test-s3-terraform-bucket-${random_pet.random_code.id}"
  }
}