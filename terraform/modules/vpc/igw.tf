resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main"
  }
}

module "public_route" {
  source = "../public_route"
  igw_id = aws_internet_gateway.igw.id
}