# We can have several vnets
# we can have a single ddos protection plan
# A protection plan needs to be able to be shared accross different vnets
# Thus , we need to decouple the ddos protection plan from the vnet

resource "azurerm_virtual_network" "this" {
  address_space = var.address_space
  bgp_community = var.bgp_community
  dynamic "ddos_protection_plan" {
    for_each = var.azurerm_network_ddos_protection_plan_id != "" ? [1] : []
    content {
      id     = var.azurerm_network_ddos_protection_plan_id
      enable = true
    }
  }
  dns_servers         = var.dns_servers
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
