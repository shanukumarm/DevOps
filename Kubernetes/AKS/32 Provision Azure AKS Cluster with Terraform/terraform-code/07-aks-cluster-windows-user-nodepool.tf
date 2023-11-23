# resource "azurerm_kubernetes_cluster_node_pool" "win101" {
##   vnet_subnet_id        = azurerm_subnet.aks-default.id # Remove it if you want to create new vnet and subnet
#   zones                 = [1, 2, 3]
#   enable_auto_scaling   = true
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
#   max_count             = 3
#   min_count             = 1
#   mode                  = "User"
#   name                  = "win101"
#   orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   os_disk_size_gb       = 35
#   os_type               = "Windows"
#   vm_size               = "Standard_D2as_v4"
#   priority              = "Regular" # Regular, Spot;  Default is Regular
#   node_labels = {
#     "nodepool-type" = "windows-nodepool"
#     "environment"   = var.environment
#     "nodepools"     = "windows"
#     "app"           = "general-apps"
#   }
#   tags = {
#     "nodepool-type" = "windows-nodepool"
#     "environment"   = var.environment
#     "nodepools"     = "windows"
#     "app"           = "general-apps"
#   }
# }