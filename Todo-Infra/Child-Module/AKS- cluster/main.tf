
resource "azurerm_kubernetes_cluster" "aks-blk" {
  for_each            = var.aks
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.data-rg-blk[each.key].name
  dns_prefix          = "todo"

  default_node_pool {
    name       = each.value.node_pool_name
    node_count = each.value.node_count
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = each.value.network_plugin
    network_policy    = each.value.network_policy             # Enabling Calico as the network policy
    load_balancer_sku = each.value.load_balancer_sku          # Recommended for network policies
  }
}

data "azurerm_resource_group" "data-rg-blk" {
  for_each = var.aks
  name     = each.value.rg_name
}
