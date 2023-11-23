# Resource: AWS VPC
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

resource "aws_vpc" "eks_vpc" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  # Required by EKS
  enable_dns_support   = true
  enable_dns_hostnames = true

  # Additional Flags
  # enable_classiclink = false
  # enable_classiclink_dns_support = false
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name  = var.vpc_name
    Owner = var.owner_name
  }
}