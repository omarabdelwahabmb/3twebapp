############################
##   application app load balancer ##
#############################
resource "aws_lb" "application-load-balancer" {
  name                       = "app-internal-load-balancer"
  internal                   = true
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.app-alb-security-group.id]
  subnets                    = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
  enable_deletion_protection = false

  tags = {
    Name = "App load balancer"
  }
}

resource "aws_lb_target_group" "app_alb_target_group" {
  name     = "app_tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "app-attachment" {
  target_group_arn = aws_lb_target_group.app_alb_target_group.arn
  target_id        = aws_autoscaling_group.asg-app.id
  port             = 80
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application-load-balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_alb_target_group.arn
  }
}


