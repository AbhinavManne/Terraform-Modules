

data "azurerm_resource_group" "rg" {
  name = var.resource_group
}


#--------------------------------------------Logic App Workflow---------------------------------------------

resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.logic_apps
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.example.id]
  }
}
#--------------------------------------------Storage Account---------------------------------------------
resource "azurerm_storage_account" "storage_account" {

  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}
#--------------------------------------------User Assigned Identity---------------------------------------------
resource "azurerm_user_assigned_identity" "example" {
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location

  name = "logic_app_identity"
}