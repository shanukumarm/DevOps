variable "eks" {
  description = "EKS variable list"
  type = object({
    cluster_name                         = string
    cluster_addons                       = any
    cluster_endpoint_private_access      = bool
    cluster_endpoint_public_access       = bool
    cluster_endpoint_public_access_cidrs = list(string)
  })
  default = {
    cluster_name                         = "eks-cluster"
    cluster_addons                       = {}
    cluster_endpoint_private_access      = true
    cluster_endpoint_public_access       = false
    cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  }
}