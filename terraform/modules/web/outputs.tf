output "web_lb_sg" {
  value       = aws_security_group.web-alb-security-group.id
}

output "web_sg" {
  value       = aws_security_group.webserver-security-group.id
}


