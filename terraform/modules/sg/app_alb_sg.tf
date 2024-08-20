###################################
## SG app alb Tier         ###
###################################
resource "aws_security_group" "app-alb-security-group" {
  name        = "Web server Security Group"
  description = "Enable http/https access on port 80/443 via ALB and ssh via ssh sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "http access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.webserver-security-group.id}"]
  }

  ingress {
    description     = "ssh access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.bastion-security-group.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app loadbalncer Security group"
  }
}
