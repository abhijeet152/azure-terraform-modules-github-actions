output "resource_group_name" {
  value       = module.resource_group.out_resource_group_name
  description = "The name of the resource group"
}

output "resource_group_id" {
  value       = module.resource_group.resource_group_id
  description = "The ID of the resource group"
}

output "resource_group_location" {
  value       = module.resource_group.resource_group_location
  description = "The location of the resource group"
}

output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "The ID of the virtual network"
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "The name of the virtual network"
}

output "web_subnet_id" {
  value       = module.vnet.web_subnet_id
  description = "The ID of the Web Tier Subnet"
}

output "web_subnet_name" {
  value       = module.vnet.web_subnet_name
  description = "The name of the Web Tier Subnet"
}

output "web_subnet_nsg_id" {
  value       = module.vnet.web_subnet_nsg_id
  description = "The ID of the Web Tier Subnet NSG"
}

output "web_subnet_nsg_name" {
  value       = module.vnet.web_subnet_nsg_name
  description = "The name of the Web Tier Subnet NSG"
}


output "app_subnet_name" {
  value       = module.vnet.out_app_subnet_name
  description = "The name of the App Tier Subnet"

}

output "app_subnet_id" {
  value       = module.vnet.out_app_subnet_id
  description = "The id of the App tier subnet"
}


# db subnet outputs
output "db_subnet_name" {
  value       = module.vnet.out_db_subnet_name
  description = "The name of the DB Tier Subnet"
}

output "db_subnet_id" {
  value       = module.vnet.out_db_subnet_id
  description = "The id of the DB tier subnet"
}

output "db_subnet_nsg_id" {
  value       = module.vnet.out_db_subnet_nsg_id
  description = "The id of the DB tier subnet NSG"
}

output "db_subnet_nsg_name" {
  value       = module.vnet.out_db_subnet_nsg_name
  description = "This is db subnet nsg name"
}


# bastion subnet outputs
output "bastion_subnet_name" {
  value       = module.vnet.out_bastion_subnet_name
  description = "The name of the Bastion Tier Subnet"
}
output "bastion_subnet_id" {
  value       = module.vnet.out_bastion_subnet_id
  description = "The id of the Bastion tier subnet"
}
output "bastion_subnet_nsg_id" {
  value       = module.vnet.out_bastion_subnet_nsg_id
  description = "The id of the Bastion tier subnet NSG"
}
output "bastion_subnet_nsg_name" {
  value       = module.vnet.out_bastion_subnet_nsg_name
  description = "The name of the Bastion Tier Subnet NSG"
}
