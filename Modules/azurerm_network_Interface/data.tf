data "azurerm_subnet" "md-net" {
    for_each = var.network_interfaces
    name                 = each.value.subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name  = each.value.resource_group_name
}