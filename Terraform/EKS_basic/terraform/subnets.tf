resource "aws_subnet" "eks_public_subnet_1" {

  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = var.public_subnet_1_availability_zone
  cidr_block        = var.public_subnet_1_cidr

  depends_on = [aws_vpc.eks_vpc]



  tags = {
    Name                                = var.public_subnet_1_name
    Owner                               = var.owner_name
    "kubernetes.io/cluster/eks-cluster" = "shared"
    "kubernetes.io/role/elb"            = 1
  }
}


resource "aws_subnet" "eks_public_subnet_2" {

  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = var.public_subnet_2_availability_zone
  cidr_block        = var.public_subnet_2_cidr

  depends_on = [aws_vpc.eks_vpc]

  tags = {
    Name                                = var.public_subnet_2_name
    Owner                               = var.owner_name
    "kubernetes.io/cluster/eks-cluster" = "shared"
    "kubernetes.io/role/elb"            = 1
  }
}

resource "aws_subnet" "eks_private_subnet_1" {

  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = var.private_subnet_1_availability_zone
  cidr_block        = var.private_subnet_1_cidr

  depends_on = [aws_vpc.eks_vpc]

  tags = {
    Name                                = var.private_subnet_1_name
    Owner                               = var.owner_name
    "kubernetes.io/cluster/eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"   = 1
  }
}


resource "aws_subnet" "eks_private_subnet_2" {

  vpc_id            = aws_vpc.eks_vpc.id
  availability_zone = var.private_subnet_2_availability_zone
  cidr_block        = var.private_subnet_2_cidr

  depends_on = [aws_vpc.eks_vpc]

  tags = {
    Name                                = var.private_subnet_2_name
    Owner                               = var.owner_name
    "kubernetes.io/cluster/eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"   = 1
  }
}