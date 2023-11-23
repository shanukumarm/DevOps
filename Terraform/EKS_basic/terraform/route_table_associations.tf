resource "aws_route_table_association" "eks_public_route_table_association_1" {

  subnet_id      = aws_subnet.eks_public_subnet_1.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_public_route_table_association_2" {

  subnet_id      = aws_subnet.eks_public_subnet_2.id
  route_table_id = aws_route_table.eks_public_route_table.id
}

resource "aws_route_table_association" "eks_private_route_table_association_1" {

  subnet_id      = aws_subnet.eks_private_subnet_1.id
  route_table_id = aws_route_table.eks_private_route_table_1.id
}

resource "aws_route_table_association" "eks_private_route_table_association_2" {

  subnet_id      = aws_subnet.eks_private_subnet_2.id
  route_table_id = aws_route_table.eks_private_route_table_2.id
}