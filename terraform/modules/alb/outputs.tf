#########################
### Load balancer DNS ###
#########################

output "app_lb_dns_name" {
  description = "DNS name of the app  load balancer"
  value       = aws_lb.application-load-balancer.dns_name
}


output "web_lb_dns_name" {
  description = "DNS name of the web load balancer"
  value       = aws_lb.web-load-balancer.dns_name
}

