resource "aws_nat_gateway" "eks_nat_1" {
  allocation_id = aws_eip.eks_eip_1.id
  subnet_id     = aws_subnet.eks_public_subnet_1.id

  depends_on = [aws_eip.eks_eip_1, aws_subnet.eks_public_subnet_1]

  tags = {
    Name  = var.nat_gateway_1_name
    Owner = var.owner_name
  }
}

resource "aws_nat_gateway" "eks_nat_2" {
  allocation_id = aws_eip.eks_eip_2.id
  subnet_id     = aws_subnet.eks_public_subnet_2.id

  depends_on = [aws_eip.eks_eip_2, aws_subnet.eks_public_subnet_2]

  tags = {
    Name  = var.nat_gateway_2_name
    Owner = var.owner_name
  }
}