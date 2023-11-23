variable "vpc_count" {
  description = "Flag to create vpc or use old one"
  type        = bool
  default     = false
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "eks-vpc"
}

variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "private_cidr_ranges" {
  description = "CIDR range for Private Subnets"
  type        = list(string)
  default     = ["0.0.0.0/0", "0.0.0.0/0"]
}

variable "public_cidr_ranges" {
  description = "CIDR range for Public Subnets"
  type        = list(string)
  default     = ["0.0.0.0/0", "0.0.0.0/0"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Single NAT Gateway"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "One NAT Gateway Per Availability Zones"
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Enable DNS Hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS Support"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
  default     = "eks-cluster"
}

variable "cluster_version" {
  description = "Cluster Version"
  type        = string
  default     = "1.26"
}

variable "cluster_endpoint_private_access" {
  description = "Cluster Endpoint Private Access"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Cluster Endpoint Public Access"
  type        = bool
  default     = true
}

variable "enable_irsa" {
  description = "Enable IAM Role for Service Account (irsa)"
  type        = bool
  default     = true
}

variable "disk_size_for_nodes" {
  description = "Disk Size for Nodes"
  type        = number
  default     = 20
}

variable "ondemand_config" {
  description = "Configuration for On Demand instances"
  type = object({
    desired_number_of_nodes = number
    minimum_number_of_nodes = number
    maximum_number_of_nodes = number

    instance_types = list(string)
  })
  default = {
    desired_number_of_nodes = 1
    minimum_number_of_nodes = 1
    maximum_number_of_nodes = 3

    instance_types = ["t3.small"]
  }
}

variable "spot_config" {
  description = "Configuration for Spot instances"
  type = object({
    desired_number_of_nodes = number
    minimum_number_of_nodes = number
    maximum_number_of_nodes = number

    instance_types = list(string)

    taints = list(object({
      key    = string
      value  = string
      effect = string
    }))
  })
  default = {
    desired_number_of_nodes = 1
    minimum_number_of_nodes = 1
    maximum_number_of_nodes = 3

    instance_types = ["t3.small"]

    taints = [{
      key    = "market"
      value  = "spot"
      effect = "NO_SCHEDULE"
    }]
  }
}
