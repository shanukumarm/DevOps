resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  depends_on = [aws_vpc.eks_vpc]

  tags = {
    Name  = var.igw_name
    Owner = var.owner_name
  }
}