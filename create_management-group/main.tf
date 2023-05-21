module "azure-management-group" {
  source                     = "../../modules/module_management-group"
  name                       = var.name
  display_name               = var.display_name
  parent_management_group_name = var.parent_management_group_name
  subscription_ids           = var.subscription_ids
}