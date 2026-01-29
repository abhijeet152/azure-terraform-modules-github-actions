# 1. create db subnet
resource "azurerm_subnet" "dbsubnet" {
  name                 = var.db_subnet_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.db_subnet_address_prefix]
  virtual_network_name = var.vnet_name
}


# 2. create nsg for db subnet
resource "azurerm_network_security_group" "dbsubnet_nsg" {
  name                = "${var.db_subnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

}

# 3. associate nsg to db subnet
resource "azurerm_subnet_network_security_group_association" "dbsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.dbsubnet_nsg.id
  depends_on = [ azurerm_network_security_rule.db_nsg_rule_inbound ]
}


# 4. create nsg rules for db subnet nsg

locals {
  db_inbound_ports_map = {
    "100" = "3306",
    "110" = "1433",
    "120" = "5432",
  }
}

# nsg inbuound rules for dbtier subnets.
resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
  for_each                    = local.app_inbound_ports_map
  name                        = "Rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.dbsubnet_nsg.name
  resource_group_name         = var.resource_group_name
}
