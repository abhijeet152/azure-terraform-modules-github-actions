terraform {

  backend "azurerm" {
    resource_group_name  = "MyResourceGroup"
    storage_account_name = "mystorageaccount20260123"
    container_name       = "mycontainer"
    key                  = "dev.terraform.tfstate"
  }
}
