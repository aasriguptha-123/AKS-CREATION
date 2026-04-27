resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = "aksdemocluster-rg"
  location            = "australiaeast"
  sku                 = var.acr_sku

  admin_enabled       = false
  }
 resource "azurerm_role_assignment" "acr_pull"{
  principal_id = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope = azurerm_container_registry.acr.id
 }
