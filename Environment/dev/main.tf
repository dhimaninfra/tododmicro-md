module "resource_group" {
  source          = "../../Modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}


module "storage_account" {
  depends_on = [ module.resource_group ]
  source                  = "../../Modules/azurerm_storage_account"
  storage_account = var.storage_account
  }

module "virtual_network" {
  depends_on = [ module.resource_group ]
  source     = "../../Modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
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