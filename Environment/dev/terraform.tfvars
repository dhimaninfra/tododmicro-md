resource_groups = {
    "rg1" = {
        name = "rg-md-01"
        location = "central India"
        tags = {
            environemnt = "dev"
            owner = "mohit"
        }
    }

}

storage_account = {
  "stg-1" = {
    name                     = "storagemd0111"
    account_tier             = "Standard"
    resource_group_name      = "rg-md-01"
    location                 = "central india"
    account_replication_type = "LRS"

  }
}

virtual_networks = {
  vnet1 = {
    name                = "Primary-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "rg-md-01"
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet3 = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
  
}

public_ips = {
  ip1 = {
    name                = "mdpub-ip"
    resource_group_name = "rg-md-01"
    location            = "central india"
    allocation_method   = "Static"
  }
  
}

bastion_hosts = {
  bastion1 = {
    name                 = "md-bastion-01"
    location             = "central india"
    resource_group_name  = "rg-md-01"
    subnet_name          = "AzureBastionSubnet"
    public_ip_name       = "mdpub-ip"
    virtual_network_name = "Primary-vnet"
    ip_configuration = {
      name = "bastion1-ip-config"
    }
  }
}

key_vaults = {
  kv1 = {
    name                = "mdkeyvault1"
    resource_group_name = "rg-md-01"
    location            = "central india"
    sku_name            = "standard"
    access_policy = [{
      key_permissions     = ["Get", "List"]
      secret_permissions  = ["Get", "List"]
      storage_permissions = ["Get", "List"]
    }]
  }
}

kubernetes_clusters = {
  cluster1 = {
    name                = "md-aks-01"
    location            = "central india"
    resource_group_name = "rg-md-01"
    dns_prefix          = "mdaks01"
    identity = {
      type = "SystemAssigned"
    }
    default_node_pool = [{
      name       = "cluster1pool"
      node_count = 2
      vm_size    = "Standard_A2_v2"
    }]
  }
}

container_registries = {
  acr1 = {
    name                = "mdcontainerregistry"
    resource_group_name = "rg-md-01"
    location            = "central india"
    sku                 = "Premium"
    admin_enabled       = true
    georeplications = [
      {
        location                = "East US"
        zone_redundancy_enabled = false
        tags = {
          environment = "dev"
        }
      },
      {
        location                = "West US"
        zone_redundancy_enabled = false
        tags = {
          environment = "dev"
        }
      }
    ]
  }
}

mssql_servers = {
  mssql1 = {
    name                         = "md-mssql-01"
    resource_group_name          = "rg-md-01"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "Sql@123456"
    minimum_tls_version          = "1.2"
    azuread_administrator = {
      login_username = "azureadmin1"
    }
  }
}

mssql_databases = {
  db1 = {
    name                 = "md-sql-db-01"
    server_name          = "md-mssql-01"
    resource_group_name  = "rg-md-01"
    collation            = "SQL_Latin1_General_CP1_CI_AS"
    license_type         = "BasePrice"
    max_size_gb         = 10
    sku_name             = "S0"
    enclave_type         = "Default"
  }
}
network_interfaces = {
  nic1 = {
    name                 = "md-nic1"
    location             = "central india"
    resource_group_name  = "rg-md-01"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "Primary-vnet"
    ip_configurations = [{
      name                          = "md-nic1-ip"
      private_ip_address_allocation = "Dynamic"
    }]
  }
  nic2 = {
    name                 = "md-nic2"
    location             = "central india"
    resource_group_name  = "rg-md-01"
    subnet_name          = "frontend-subnet"
    virtual_network_name = "Primary-vnet"
    ip_configurations = [{
      name                          = "md-nic2-ip"
      private_ip_address_allocation = "Dynamic"
    }]
  }

}

linux_virtual_machines = {
  vm1 = {
    name                            = "md-vm-01"
    resource_group_name             = "rg-md-01"
    location                        = "central india"
    size                            = "standard_b1s"
    admin_username                  = "mdhiman"
    admin_password                  = "Tiyameet@123"
    disable_password_authentication = false
    network_interface_name          = "md-nic1"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}
