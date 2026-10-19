provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    name = "example-instance"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.example.id
  domain   = "vpc"
}

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Security group for EC2 instance"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "${aws_eip.eip.public_ip}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

output "public_ip" {
  value = "https://${aws_eip.eip.public_ip}:8080"
}
