#########webec2############
resource "aws_instance" "PublicWebTemplate" {
  ami                    = "ami-066784287e358dad1"
  instance_type          = "t2.micro"
  subnet_id              = var.public_1
  vpc_security_group_ids = [var.web_lb_sg]
  key_name               = "key"
  user_data              = file("/home/yat/Desktop/3twebapp/aws/webUserdata.sh")

  tags = {
    Name = "web-ec2"
  }
}
####################web_ami######################
resource "aws_ami_from_instance" "web" {
  name               = "web_ami"
  source_instance_id = aws_instance.PublicWebTemplate.id
}


############app_ec2###################
resource "aws_instance" "PublicappTemplate" {
  ami                    = "ami-066784287e358dad1"
  instance_type          = "t2.micro"
  subnet_id              = var.public_1
  vpc_security_group_ids = [var.web_lb_sg]
  key_name               = "key"
  user_data              = file("/home/yat/Desktop/3twebapp/aws/appUserData.sh")
  tags = {
    Name = "app-ec2"
  }
}

####################app_ami######################
resource "aws_ami_from_instance" "app" {
  name               = "app_ami"
  source_instance_id = aws_instance.PublicappTemplate.id
}

