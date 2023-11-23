resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name  = var.public_route_table_name
    Owner = var.owner_name
  }
}


resource "aws_route_table" "eks_private_route_table_1" {
  vpc_id = aws_vpc.eks_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_nat_1.id
  }

  tags = {
    Name  = var.private_route_table_1_name
    Owner = var.owner_name
  }
}


resource "aws_route_table" "eks_private_route_table_2" {
  vpc_id = aws_vpc.eks_vpc.id

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks_nat_2.id
  }

  tags = {
    Name  = var.private_route_table_2_name
    Owner = var.owner_name
  }
}