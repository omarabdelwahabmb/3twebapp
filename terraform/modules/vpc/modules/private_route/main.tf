resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

tags = {
    Name = "private route table"
  }
}



resource "aws_route_table_association" "private1" {
  subnet_id      = var.private_subnet1_id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private2" {
  subnet_id      = var.private_subnet2_id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = var.private_subnet3_id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private4" {
  subnet_id      = var.private_subnet4_id
  route_table_id = aws_route_table.private.id
}