resource "aws_eip" "eks_eip_1" {

  depends_on = [aws_internet_gateway.eks_igw]

  tags = {
    Name  = var.eip_1_name
    Owner = var.owner_name
  }
}

resource "aws_eip" "eks_eip_2" {

  depends_on = [aws_internet_gateway.eks_igw]

  tags = {
    Name  = var.eip_2_name
    Owner = var.owner_name
  }
}