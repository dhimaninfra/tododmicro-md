variable "kubernetes_clusters" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    identity            = object({
      type = string
    })
    default_node_pool   = list(object({
      name       = string
      node_count = number
      vm_size    = string
    }))
  }))
}