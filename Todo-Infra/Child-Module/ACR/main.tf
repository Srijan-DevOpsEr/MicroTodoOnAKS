resource "azurerm_resource_group" "rg-blk" {
    for_each = var.acr
  name     = each.value.rg_name
  location = each.value.location
}

resource "azurerm_container_registry" "acr" {
    for_each = var.acr
  name                = each.value.acr_name
  resource_group_name = azurerm_resource_group.rg-blk[each.key].name
  location            = azurerm_resource_group.rg-blk[each.key].location
  sku                 = "Premium"
  admin_enabled       = false
}
