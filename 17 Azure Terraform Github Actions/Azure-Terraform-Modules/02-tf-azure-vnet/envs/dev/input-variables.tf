variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}

# inputs for module vnet
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "web_subnet_name" {
  description = "Name of the web tier subnet"
  type        = string
}

variable "web_subnet_address_prefix" {
  description = "Address prefix for the web tier subnet"
  type        = string
}

variable "app_subnet_name" {
  description = "Name of the app tier subnet"
  type        = string
}

variable "app_subnet_address_prefix" {
  description = "Address prefix for the app tier subnet"
  type        = string
}


# db subnet variables
variable "db_subnet_name" {
  description = "Name of the database tier subnet"
  type        = string
}
variable "db_subnet_address_prefix" {
  description = "Address prefix for the database tier subnet"
  type        = string
}

# bastion subnet  variables.
variable "bastion_subnet_name" {
  description = "Name of the bastion subnet"
  type        = string
  default     = "AzureBastionSubnet"
}
variable "bastion_subnet_address_prefix" {
  description = "Address prefix for the bastion subnet"
  type        = string
}
