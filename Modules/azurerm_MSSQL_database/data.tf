data "azurerm_mssql_server" "mssql_server" {
    for_each = var.mssql_databases
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name 
}