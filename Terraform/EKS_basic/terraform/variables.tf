variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = ""
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 CIDR block"
  type        = string
  default     = ""
}

variable "public_subnet_1_availability_zone" {
  description = "Public Subnet 1 Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "public_subnet_2_cidr" {
  description = "Public Subnet 2 CIDR block"
  type        = string
  default     = ""
}

variable "public_subnet_2_availability_zone" {
  description = "Public Subnet 2 Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 CIDR block"
  type        = string
  default     = ""
}

variable "private_subnet_1_availability_zone" {
  description = "Private Subnet 1 Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "private_subnet_2_cidr" {
  description = "Private Subnet 2 CIDR block"
  type        = string
  default     = ""
}

variable "private_subnet_2_availability_zone" {
  description = "Private Subnet 2 Availability Zone"
  type        = string
  default     = "us-east-1b"
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
  default     = "1.26"
}

variable "desired_number_of_nodes" {
  description = "Number of Desired Worker Nodes"
  type        = number
  default     = 1
}

variable "max_number_of_nodes" {
  description = "Maximum Number of Worker Nodes"
  type        = number
  default     = 3
}

variable "min_number_of_nodes" {
  description = "Minimum Number of Worker Nodes"
  type        = number
  default     = 1
}

variable "ami_type" {
  description = "AMI Type for the Worker Nodes"
  type        = string
  default     = ""
}

variable "capacity_type" {
  description = "Caapacity Type for the Worker Nodes, types ON_DEMAND/SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "disk_size" {
  description = "Disk size for the Worker Nodes"
  type        = number
  default     = 20
}

variable "force_update_version" {
  description = "Force Update the Worker Nodes"
  type        = bool
  default     = false
}

variable "instance_types" {
  description = "Instance Types for the Worker Nodes"
  type        = list(string)
  default     = ["t3.small"]
}

variable "labels" {
  description = "Labels for the Worker Nodes"
  type        = map(string)
  default = {
    role = "eks-node-group"
  }
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "eks-vpc"
}

variable "public_subnet_1_name" {
  description = "Name of public subnet 1"
  type        = string
  default     = "eks-public-subnet-1"
}

variable "public_subnet_2_name" {
  description = "Name of public subnet 2"
  type        = string
  default     = "eks-public-subnet-2"
}

variable "private_subnet_1_name" {
  description = "Name of private subnet 1"
  type        = string
  default     = "eks-private-subnet-1"
}

variable "private_subnet_2_name" {
  description = "Name of private subnet 2"
  type        = string
  default     = "eks-private-subnet-2"
}

variable "igw_name" {
  description = "Name of Internet Gateway"
  type        = string
  default     = "eks-igw"
}

variable "eip_1_name" {
  description = "Name of Elastic IP 1"
  type        = string
  default     = "eks-eip-1"
}

variable "eip_2_name" {
  description = "Name of Elastic IP 2"
  type        = string
  default     = "eks-eip-2"
}

variable "nat_gateway_1_name" {
  description = "Name of NAT Gateway 1"
  type        = string
  default     = "eks-natgw-1"
}

variable "nat_gateway_2_name" {
  description = "Name of NAT Gateway 2"
  type        = string
  default     = "eks-natgw-2"
}

variable "public_route_table_name" {
  description = "Name of Public Route Table"
  type        = string
  default     = "eks-pub-rou-table"
}

variable "private_route_table_1_name" {
  description = "Name of Private Route Table 1"
  type        = string
  default     = "eks-pri-rou-table-1"
}

variable "private_route_table_2_name" {
  description = "Name of Private Route Table 2"
  type        = string
  default     = "eks-pri-rou-table-2"
}

variable "cluster_role_name" {
  description = "Name of Cluster Role"
  type        = string
  default     = "eks-cluster-role"
}

variable "node_group_role_name" {
  description = "Name of Node Group Role"
  type        = string
  default     = "eks-node-group-role"
}

variable "cluster_name" {
  description = "Name of Cluster"
  type        = string
  default     = "eks-cluster"
}

variable "node_group_name" {
  description = "Name of Node Group"
  type        = string
  default     = "eks-node-group"
}

variable "owner_name" {
  description = "Owner of resources"
  type        = string
  default     = "unknown"
}