
resource "azurerm_container_registry" "container_registry" {
  name                = "flixtube"
  resource_group_name = azurerm_resource_group.flixtube.name # This forces a dependency on the resource group! 
  location            = "westus"
  admin_enabled       = true
  sku                 = "Basic"
}
