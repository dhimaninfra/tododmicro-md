resource "azurerm_bastion_host" "bastion_host" {
    for_each = var.bastion_hosts
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.bastion_public_ip[each.key].id
  }
}