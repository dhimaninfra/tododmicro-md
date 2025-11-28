variable "mssql_servers" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    administrator_login          = string
    administrator_login_password = string
    version                      = string
    minimum_tls_version          = optional(string, "1.2")
    azuread_administrator = object({
      login_username = string
    })
  }))
}