resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

tags = {
    Name = "public route table"
  }
}


resource "aws_route_table_association" "public1" {
  subnet_id      = var.public_subnet1_id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = var.public_subnet2_id
  route_table_id = aws_route_table.public.id
}
