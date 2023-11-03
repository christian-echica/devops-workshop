provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0e8a34246278c21e4"
    instance_type = "t2.small"
    key_name = "eos-keypair"
    security_groups = ["devops-sg"]
}

resource "aws_security_group" "devops-sg" {
  name        = "devops-sg"
  description = "SSH Access"
  
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ssh-server"

  }
}
