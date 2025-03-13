terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.TF_SG.id]
  key_name = "my-key"

    root_block_device {
    volume_type           = "gp3"
    volume_size           = 10
  }

  tags = {
    Name = "My-server"
  }
}
 

resource "aws_security_group" "TF_SG" {
  name        = "security group using terrform"
  description = "security group using terrform"
  vpc_id      = "vpc-035c6c65b2313705f"

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "My-server"
  }
}

resource "local_file" "inventory" {
  filename = "ansible/inventory.ini"
  content  = <<-EOT
    [server]
    ${aws_instance.app_server.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=/home/harshal/Downloads/my-key.pem
  EOT
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}
