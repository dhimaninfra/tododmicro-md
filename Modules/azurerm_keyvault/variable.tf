variable "key_vaults" {
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    enabled_for_disk_encryption = optional(bool)
    enabled_for_deployment      = optional(bool)
    soft_delete_retention_days  = optional(number)
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
    access_policy = list(object({
      key_permissions     = optional(list(string))
      secret_permissions  = optional(list(string))
      storage_permissions = optional(list(string))
    }))
  }))
}