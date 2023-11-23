resource "aws_iam_role" "eks_cluster_role" {
  name = var.cluster_role_name

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Service" : "eks.amazonaws.com"
          },
          "Action" : "sts:AssumeRole"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = var.cluster_version

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true


    subnet_ids = [
      aws_subnet.eks_public_subnet_1.id,
      aws_subnet.eks_public_subnet_2.id,
      aws_subnet.eks_private_subnet_1.id,
      aws_subnet.eks_private_subnet_2.id
    ]
  }

  depends_on = [aws_subnet.eks_public_subnet_1, aws_subnet.eks_public_subnet_2,
    aws_subnet.eks_private_subnet_1, aws_subnet.eks_private_subnet_2,
  aws_iam_role_policy_attachment.eks_cluster_policy_attachment]

}