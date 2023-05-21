data "azurerm_subscription" "current" {}

locals {
  parent               = var.parent_management_group_name != null ? true : false
  tenant_root_group_id = "/providers/Microsoft.Management/managementGroups/${data.azurerm_subscription.current.tenant_id}"
}

resource "azurerm_management_group" "mg" {
  display_name               = var.display_name
  name                       = var.name
  parent_management_group_id = local.parent ? var.parent_management_group_name : local.tenant_root_group_id
  subscription_ids           = var.subscription_ids
}