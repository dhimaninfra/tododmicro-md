resource_groups = {
    "rg1" = {
        name = "rg-md-01"
        location = "central India"
    }

    "rg2" = {
        name = "rg-md-02"
        location = "Central India"
        managed_by = "mohit dhiman"
        tags = {
            environemnt = "dev"
            owner = "mohit"
        }
    }
}

storage_account = {
  "stg-1" = {
    name                     = "storagemd01"
    account_tier             = "Standard"
    resource_group_name      = "rg-md-01"
    location                 = "central india"
    account_replication_type = "LRS"

  }
  "stg-2" = {
    name                     = "storagemd02"
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
    subnet_name          = "subnet3"
    public_ip_name       = "ip1"
    virtual_network_name = "vnet1"
    ip_configuration = {
      name = "bastion1-ip-config"
    }
  }
}

