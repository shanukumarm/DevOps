# resource "azurerm_virtual_network" "aksvnet" {
#   name                = "aks-network"
#   location            = azurerm_resource_group.aks_rg.location
#   resource_group_name = azurerm_resource_group.aks_rg.name
#   address_space       = ["10.0.0.0/8"]
# }

# resource "azurerm_subnet" "aks-default" {
#   name                 = "aks-default-subnet"
#   virtual_network_name = azurerm_virtual_network.aksvnet.name
#   resource_group_name  = azurerm_resource_group.aks_rg.name
#   address_prefixes     = ["11.0.0.0/16"]
# }