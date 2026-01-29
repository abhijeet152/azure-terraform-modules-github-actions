variable "resource_group_name" {
    description = "Name of the resource group"
    type        = string
}

variable "location" {
    description = "Azure region for resources"
    type        = string
}

variable "vnet_name" {
    description = "Name of the virtual network"
    type        = string
}

variable "address_space" {
    description = "Address space for the virtual network"
    type        = list(string)
    default     = ["10.0.0.0/16"]
}

# subnet variables
variable "web_subnet_name" {
    description = "Base name for the web tier subnet"
    type        = string
}   

variable "web_subnet_address_prefix" {
    description = "Address prefix for the web tier subnet"
    type        = string
}  

# app subnet variables
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
variable "enable_bastion" {
    description = "Flag to enable or disable bastion host"
    type        = bool
    default     = false
}
variable "tags" {
    description = "Tags to be applied to resources"
    type        = map(string)
    default     = {}
}

