module "resource_group" {
  source              = "./../../Modules/resource_group"
  resource_group_name = "${local.resource_name_prefix}_${var.resource_group_name}_${random_string.myrandom.id}"
  location            = var.location

}