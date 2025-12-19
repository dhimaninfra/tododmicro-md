variable "network_interfaces" {
  type        = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name        = string
    virtual_network_name = string
    ip_configurations   = list(object({
      name                          = string
      subnet_id                     = optional(string)
      private_ip_address_allocation = string
    }))
  }))

  default     = {}
}