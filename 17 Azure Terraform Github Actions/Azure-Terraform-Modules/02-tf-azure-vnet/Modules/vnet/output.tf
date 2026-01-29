output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

# web subnet outputs
output "web_subnet_id" {
  description = "ID of the Web Tier Subnet"
  value       = azurerm_subnet.websubnet.id
}

output "web_subnet_name" {
  description = "Name of the Web Tier Subnet"
  value       = azurerm_subnet.websubnet.name
}

output "web_subnet_nsg_id" {
  description = "ID of the Web Tier Subnet NSG"
  value       = azurerm_network_security_group.web_subnet_nsg.id
}

output "web_subnet_nsg_name" {
  description = "Name of the Web Tier Subnet NSG"
  value       = azurerm_network_security_group.web_subnet_nsg.name
}


# app tier subnet details
output "out_app_subnet_id" {
  description = "ID of the App Tier Subnet"
  value       = azurerm_subnet.appsubnet.id
}

output "out_app_subnet_name" {
  description = "Name of the App Tier Subnet"
  value       = azurerm_subnet.appsubnet.name
} 

output "out_app_subnet_nsg_id" {
  description = "ID of the App Tier Subnet NSG"
  value       = azurerm_network_security_group.app_subnet_nsg.id
}


# db tier subnet details
output "out_db_subnet_id" {
  description = "ID of the DB Tier Subnet"
  value       = azurerm_subnet.dbsubnet.id
} 
output "out_db_subnet_name" {
  description = "Name of the DB Tier Subnet"
  value       = azurerm_subnet.dbsubnet.name
}
output "out_db_subnet_nsg_id" {
  description = "ID of the DB Tier Subnet NSG"
  value       = azurerm_network_security_group.dbsubnet_nsg.id
}
output "out_db_subnet_nsg_name" {
  description = "Name of the DB Tier Subnet NSG"
  value       = azurerm_network_security_group.dbsubnet_nsg.name
}


# bastion tier subnet details
output "out_bastion_subnet_id" {
  description = "ID of the Bastion Tier Subnet"
  value       = azurerm_subnet.bastion_subnet.id
} 

output "out_bastion_subnet_name" {
  description = "Name of the Bastion Tier Subnet"
  value       = azurerm_subnet.bastion_subnet.name
}

output "out_bastion_subnet_nsg_id" {
  description = "ID of the Bastion Tier Subnet NSG"
  value       = azurerm_network_security_group.bastion_subnet_nsg.id
}

output "out_bastion_subnet_nsg_name" {
  description = "Name of the Bastion Tier Subnet NSG"
  value       = azurerm_network_security_group.bastion_subnet_nsg.name
}