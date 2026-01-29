# 1. create bastion subnet
resource "azurerm_subnet" "bastion_subnet" {
  name                 = var.bastion_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.bastion_subnet_address_prefix]
}

# 2. create network security group for bastion subnet
resource "azurerm_network_security_group" "bastion_subnet_nsg" {
  name                = "${var.bastion_subnet_name}-bastion-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

}

# 3. associate NSG to bastion subnet
resource "azurerm_subnet_network_security_group_association" "bastion_nsg_association" {
  subnet_id                 = azurerm_subnet.bastion_subnet.id
  network_security_group_id = azurerm_network_security_group.bastion_subnet_nsg.id
  #depends_on = [  ] # nsg rule
}

# 4. create NSG rules for bastion subnet
# local variable for security rules
locals {
    bastion_inbound_ports_map = {
        "100" : "22"
        "110" : "3389"
    }
}

# nsg rules for bastion subnet
resource "azurerm_network_security_rule" "bastion_nsg_rules_inbound" {
  for_each                     = local.bastion_inbound_ports_map
  name                         = "Rule-Port-${each.value}"
  priority                     = tonumber(each.key)
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "Tcp"
  source_port_range            = "*"
  destination_port_range       = each.value
  source_address_prefix        = "*"
  destination_address_prefix   = "*"
  resource_group_name          = var.resource_group_name
  network_security_group_name  = azurerm_network_security_group.bastion_subnet_nsg.name
}