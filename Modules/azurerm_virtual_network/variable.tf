variable "virtual_networks" {
  type = map(object({
    name                = string
    address_space       = optional(list(string))
    location            = string
    resource_group_name = string
    bgp_community      = optional(string)
    dns_servers        = optional(list(string))
    edge_zone         = optional(string)
    flow_timeout_in_minutes = optional(number)
    ip_address_pool = optional(object({
      name                = string
      address_prefixes    = list(string)
    }))
    ddos_protection_plan = optional(object({
      id = string
    }))
    encryption = optional(object({
      key_vault_key_id = string
      key_vault_id     = string
    }))
    subnets             = optional(map(object({
      name            = string
      address_prefixes = optional(list(string))
    })))
  }))
}