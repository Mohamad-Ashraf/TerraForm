provider "azurerm" {
  version = "=2.0.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linsimplevmips"]
  vnet_subnet_id      = "module.network.vnet_subnets[0]"
}

module "windowsservers" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  vm_hostname                   = "mywinvm"
  admin_password                = var.admin_password
  public_ip_dns                 = ["winterravmip", "winterravmip1"]
  nb_public_ip                  = "2"
  remote_port                   = "3389"
  nb_instances                  = "2"
  vm_os_publisher               = "MicrosoftWindowsServer"
  vm_os_offer                   = "WindowsServer"
  vm_os_sku                     = "2012-R2-Datacenter"
  vm_size                       = "Standard_DS2_V2"
  vnet_subnet_id                = "module.network.vnet_subnets[1]"
  enable_accelerated_networking = "true"
}

module "network" {
  source              = "Azure/network/azurerm"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "sql-database" {
  source              = "Azure/database/azurerm"
  resource_group_name = var.resource_group_name
  location            = var.location
  db_name             = var.db_name
  sql_admin_username  = var.sql_admin_username
  sql_password        = var.sql_password

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}