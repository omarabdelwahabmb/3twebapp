##################################
#### ASG for Presentation Tier ###
##################################

resource "aws_launch_template" "auto-scaling-group" {
  name_prefix   = "auto-scaling-group"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = "key"
  network_interfaces {
    subnet_id       = aws_subnet.public_subnet1.id
    security_groups = [aws_security_group.webserver-security-group.id]
  }
}

resource "aws_autoscaling_group" "asg-web" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2

  launch_template {
    id      = aws_launch_template.auto-scaling-group.id
    version = "$Latest"
  }
}

##################################
#### ASG for Application Tier ###
##################################

resource "aws_launch_template" "auto-scaling-group-private" {
  name_prefix   = "auto-scaling-group-private"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = "key"

  network_interfaces {
    subnet_id       = aws_subnet.private_subnet1.id
    security_groups = [aws_security_group.app-security-group.id]
  }
}

resource "aws_autoscaling_group" "asg-app" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2

  launch_template {
    id      = aws_launch_template.auto-scaling-group-private.id
    version = "$Latest"
  }
}


