resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group
  location = var.azure_region
}

resource "azurerm_virtual_network" "aks_vnet" {
    name =  var.aks_vnet_name
    resource_group_name = azurerm_resource_group.aks_rg.name
    location = azurerm_resource_group.aks_rg.location
    address_space = var.vnetcidr
}

resource "azurerm_subnet" "aks_subnet" {
    name = "aks_subnet"
    resource_group_name = azurerm_resource_group.aks_rg.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes = var.subnetcidr
}

resource "azurerm_kubernetes_cluster" "aks_cluster"{
    name = var.cluster_name
    location = azurerm_resource_group.aks_rg.location
    resource_group_name = azurerm_resource_group.aks_rg.name
    dns_prefix = var.dns_name
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name = var.agent_pools.name
    node_count = var.agent_pools.count
    vm_size = var.agent_pools.vm_size
  }

  role_based_access_control_enabled = true
  network_profile{
    network_plugin = "azure"
  }

  oidc_issuer_enabled = true
  workload_identity_enabled = true

  tags = {
    Environment = "Demo"
  }
 
}