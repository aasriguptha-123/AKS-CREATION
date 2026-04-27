variable resource_group{
    type = string
}

variable azure_region{
    type = string
}

variable aks_vnet_name{
    type = string
}

variable vnetcidr{
    type = list
}

variable subnetcidr{
    type = list
}

variable dns_name{
    type = string
}

variable cluster_name{
    type = string
}


variable agent_pools{
  type = object({
      name            = string
      count           = number
      vm_size         = string
      os_disk_size_gb = string
    }
  )
}