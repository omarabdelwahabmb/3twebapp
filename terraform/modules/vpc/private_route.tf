resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

tags = {
    Name = "private route table"
  }
}



resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private4" {
  subnet_id      = aws_subnet.private_subnet4.id
  route_table_id = aws_route_table.private.id
}



