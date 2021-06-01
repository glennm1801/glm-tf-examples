provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "demo101_security_group" {
  description = "Demo 101 Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.vpc_id
}

resource "aws_instance" "web" {
  count                   = 1
  ami                     = "ami-0d5eff06f840b45e9"
  instance_type           = "t2.micro"
  disable_api_termination = true
  monitoring              = true
  key_name                = var.ssh_key != "" ? var.ssh_key : ""
  user_data               = data.template_file.userdata.rendered
  tags = {
    Name = "demo101-ec2-instance"
  }
  vpc_security_group_ids = [aws_security_group.demo101_security_group.id]
}