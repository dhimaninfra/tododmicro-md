data "azurerm_network_interface" "this" {
  for_each = var.linux_virtual_machines
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}