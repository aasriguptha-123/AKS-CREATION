resource_group = "aksdemocluster-rg"

azure_region = "australiaeast"

aks_vnet_name = "aksvnet"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

dns_name = "aksdemocluster"

cluster_name = "aksdemocluster"

agent_pools = {
  name            = "agentpool"
  count           = 1
  vm_size         = "Standard_D2ps_v6"
  os_disk_size_gb = "30"
}