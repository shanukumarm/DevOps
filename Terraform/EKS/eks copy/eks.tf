module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_addons = var.eks.cluster_addons

  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  cluster_security_group_id = var.cluster_security_group_id

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # IAM Role for Service Account (irsa)
  enable_irsa = var.enable_irsa

  eks_managed_node_group_defaults = {
    disk_size = var.disk_size_for_nodes
  }

  eks_managed_node_groups = {
    general = {
      desired_size = var.ondemand_config.desired_number_of_nodes
      min_size     = var.ondemand_config.minimum_number_of_nodes
      max_size     = var.ondemand_config.maximum_number_of_nodes

      labels = {
        role = "general"
      }

      instance_types = var.ondemand_config.instance_types
      capacity_type  = "ON_DEMAND"
    }


    spot = {
      desired_size = var.spot_config.desired_number_of_nodes
      min_size     = var.spot_config.minimum_number_fo_nodes
      max_size     = var.spot_config.maximum_number_of_nodes

      labels = {
        role = "spot"
      }

      instance_types = var.spot_config.instance_types
      capacity_type  = "SPOT"

      taints = var.spot_config.taints
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles = [
    {
      rolearn  = module.eks_admins_iam_role.iam_role_arn
      username = module.eks_admins_iam_role.iam_role_name
      groups   = ["system:masters"]
    }
  ]

  node_security_group_additional_rules = {
    ingress_allow_access_from_control_plane = {
      type                          = "ingress"
      protocol                      = "tcp"
      from_port                     = 9443
      to_port                       = 9443
      source_cluster_security_group = true
      description                   = "Allow access from control plane to webhook port of AWS load balancer controller"
    }
  }

  tags = {
    env = "dev"
  }
}


data "aws_eks_cluster" "default" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_id
}