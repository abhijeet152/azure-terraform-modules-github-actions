module "resource_group" {
  source = "../../Modules/rg"

  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

module "vnet" {
  source = "../../Modules/vnet"

  vnet_name                     = var.vnet_name
  address_space                 = var.address_space
  location                      = module.resource_group.resource_group_location
  resource_group_name           = module.resource_group.out_resource_group_name
  web_subnet_name               = var.web_subnet_name
  web_subnet_address_prefix     = var.web_subnet_address_prefix
  app_subnet_name               = var.app_subnet_name
  app_subnet_address_prefix     = var.app_subnet_address_prefix
  db_subnet_name                = var.db_subnet_name
  db_subnet_address_prefix      = var.db_subnet_address_prefix
  bastion_subnet_name           = var.bastion_subnet_name
  bastion_subnet_address_prefix = var.bastion_subnet_address_prefix
  
}

