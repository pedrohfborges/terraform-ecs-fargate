resource "aws_security_group" "example" {
  name        = "example"
  description = "example"
  vpc_id      = aws_vpc.lab-vpc.id
  tags = {
    Name = "example"

  }

  ingress {
    description = "enableports"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}