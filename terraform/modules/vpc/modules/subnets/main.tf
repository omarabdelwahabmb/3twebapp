resource "aws_subnet" "public_subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet1_cidr
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet2_cidr
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet2"
  }
}



resource "aws_subnet" "private_subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet1_cidr
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet1"
  }
}



resource "aws_subnet" "private_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet2_cidr
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet2"
  }
}



resource "aws_subnet" "private_subnet3" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet3_cidr
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet3"
  }
}


resource "aws_subnet" "private_subnet4" {
  vpc_id     = var.vpc_id
  cidr_block = var.private_subnet4_cidr
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet4"
  }
}

module "public_route" {
  source = "../public_route"
  vpc_id     = var.vpc_id
  public_subnet1_id = aws_subnet.public_subnet1.id
  public_subnet2_id = aws_subnet.public_subnet2.id
}

module "private_route" {
  source = "../private_route"
  private_subnet1_id = aws_subnet.private_subnet1.id
  private_subnet2_id = aws_subnet.private_subnet2.id
  private_subnet3_id = aws_subnet.private_subnet3.id
  private_subnet4_id = aws_subnet.private_subnet4.id
}