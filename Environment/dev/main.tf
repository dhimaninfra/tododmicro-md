module "resource_group" {
  source          = "../../Modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

# module "storage_account" {
#   depends_on = [ module.resource_group ]
#   source                  = "../../Modules/azurerm_storage_account"
#   storage_account = var.storage_account
#   }

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source     = "../../Modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}

module "network_interface" {
  depends_on = [ module.virtual_network ]
  source                = "../../Modules/azurerm_network_interface"
  network_interfaces    = var.network_interfaces
}

module "linux_virtual_machine" {
  depends_on = [ module.network_interface ]
  source                = "../../Modules/azurerm_linux_virtual_machine"
  linux_virtual_machines = var.linux_virtual_machines
 
}

module "public_ip" {
  depends_on = [ module.resource_group ]
  source                = "../../Modules/azurerm_pip"
  public_ips = var.public_ips
}

module "azurerm_bastion_host" {
  depends_on = [ module.virtual_network, module.public_ip, module.resource_group ]
  source                = "../../Modules/azurerm_bastion"
  bastion_hosts = var.bastion_hosts
}

module "kubernetes_cluster" {
  depends_on = [ module.resource_group ]
  source                     = "../../Modules/azurerm_AKS"
  kubernetes_clusters = var.kubernetes_clusters
}

module "container_registries" {
  depends_on = [ module.resource_group ]
  source                = "../../Modules/azurerm_ACR"
  container_registries  = var.container_registries
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source            = "../../Modules/azurerm_keyvault"
  key_vaults = var.key_vaults 
}

# module "mssql_server" {
#   depends_on = [ module.resource_group ]
#   source                = "../../Modules/azurerm_MSSQLServer"
#   mssql_servers = var.mssql_servers
# }

# module "mssql_database" {
#   depends_on = [ module.mssql_server ]
#   source                = "../../Modules/azurerm_MSSQL_database"
#   mssql_databases = var.mssql_databases
# }
