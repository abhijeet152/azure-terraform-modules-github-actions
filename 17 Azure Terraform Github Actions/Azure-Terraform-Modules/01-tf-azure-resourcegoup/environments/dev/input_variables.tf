# Generic variables

variable "business_division" {
  description = "The business division for the resources"
  type        = string
  default     = "sap"

}

variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"

}

### Input Variables
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "MyResourceGroup"

}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"

}