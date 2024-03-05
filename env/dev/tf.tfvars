rgnames = {
  rg1 = {
    name     = "dev-rgs"
    location = "eastus"
  }
}

vnets = {
  vnet = {
    name                = "dev-vnet"
    location            = "eastus"
    resource_group_name = "dev-rgs"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4"]

  }
}

subnets = {
  subnet = {
    name                 = "dev-subnet"
    resource_group_name  = "dev-rgs"
    virtual_network_name = "dev-vnet"
    address_prefixes     = "10.0.1.0/24"
  }
}
pips = {
  pip = {
    name                = "dev-pip"
    resource_group_name = "dev-rgs"
    location            = "eastus"
    allocation_method   = "Static"
  }
}

nics = {
  nic = {
    name                 = "dev-nic"
    location             = "eastus"
    resource_group_name  = "dev-rgs"
    subnetname           = "dev-subnet"
    virtual_network_name = "dev-vnet"
    pipname              = "dev-pip"
  }
}

nsgs = {
  ngs1 = {
    name                = "dev-nsg"
    location            = "eastus"
    resource_group_name = "dev-rgs"
    subnetname          = "dev-subnet"
  }

}
security_rule = {
  rule1 = {
    name                   = "test123"
    priority               = "1001"
    destination_port_range = "22"
  },
  rule2 = {
    name                   = "test1234"
    priority               = "1002"
    destination_port_range = "80"
  }
}
nsgass = {
  nsgass1 = {
    name                 = "dev-nsgass"
    nsgname              = "dev-nsg"
    subnetname           = "dev-subnet"
    virtual_network_name = "dev-vnet"
    resource_group_name  = "dev-rgs"

  }
}
vms = {
  vm = {
    name                = "dev-vms"
    resource_group_name = "dev-rgs"
    location            = "eastus"
    size                = "Standard_F2"
    admin_username      = "adminrm"
    admin_password      = "adminrm@1234"
    nicname             = "dev-nic"

  }
}
