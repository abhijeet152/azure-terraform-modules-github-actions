# create app tier subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = var.app_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = [var.app_subnet_address_prefix]
}

# create network security group for app tier subnet
resource "azurerm_network_security_group" "app_subnet_nsg" {
  name                = "${var.app_subnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
    tags = {
        Environment = "AppSubnetNSG"
        ManagedBy   = "Terraform"
  }
}

# associate NSG with app tier subnet
resource "azurerm_subnet_network_security_group_association" "appsubnet_nsg_association" {
  subnet_id                 = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
  depends_on = [ azurerm_network_security_rule.web_nsg_rule_inbound ]
}

# Create nsg rules for app tier subnet nsg
# locals block for security rule.
locals {
  app_inbound_ports_map = {
    "100" : "80"
    "110" : "443"
    "120" : "8080"
    "130" : "22"

  }
}

## nsg inbound rule for apptier subnets
resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each = local.app_inbound_ports_map
  name = "Rule-port-${each.key}-inbound"
  priority = each.key
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = each.value
  source_address_prefixes = ["*"]
  destination_address_prefixes = ["*"]
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_subnet_nsg.name
}