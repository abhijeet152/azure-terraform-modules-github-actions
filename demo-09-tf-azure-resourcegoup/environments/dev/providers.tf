# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }


  backend "azurerm" {

    resource_group_name  = "rg_tfstate"
    storage_account_name = "storage20260122"
    container_name       = "tfstate-container"
    key                  = "dev.tfstate"

  }
}


# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "fee3badb-324c-44d6-9f37-855eced24ba1"
}


