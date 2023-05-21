data "azurerm_resource_group" "rg" {
  name = var.resource_group

}
#--------------------------------------Logic App Workflow-----------------------------------------------
resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.logic_app_workflow
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
}

#--------------------------------------Logic App Trigger HTTP Request---------------------------------------

resource "azurerm_logic_app_trigger_http_request" "https_request" {
  name         = var.logic_app_http_trigger
  logic_app_id = azurerm_logic_app_workflow.logic_app.id

  schema = <<SCHEMA
{
    "type": "object",
    "properties": {
        "hello": {
            "type": "string"
        }
    }
}
SCHEMA

}

#--------------------------------------Storage Account-----------------------------------------------
resource "azurerm_storage_account" "storage_account" {

  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}
