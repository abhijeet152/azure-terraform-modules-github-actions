# Resource Group variables for Dev environment
resource_group_name = "my-rg-dev"
location            = "East US"
environment         = "dev"
tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Owner       = "DevTeam"
}

# VNet variables for Dev environment
vnet_name     = "my-vnet-dev"
address_space = ["10.0.0.0/16"]

# web subnet variables for Dev environment
web_subnet_name = "value"
web_subnet_address_prefix = "value"

# app subnet variables for Dev environment
app_subnet_name           = "my-app-subnet"
app_subnet_address_prefix = "10.0.2.0/24"

# db subnet variables for Dev environment
db_subnet_name           = "my-db-subnet"
db_subnet_address_prefix = "10.0.3.0/24"


#bastion subnet variables for Dev environment
bastion_subnet_name           = "my-bastion-subnet"
bastion_subnet_address_prefix = "10.0.4.0/24"
