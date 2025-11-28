resource "azurerm_mssql_server" "mssql_server" {
  for_each = var.mssql_servers
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version

  azuread_administrator {
    login_username = each.value.azuread_administrator.login_username
    object_id      = data.azurerm_client_config.current.object_id
  }
}
