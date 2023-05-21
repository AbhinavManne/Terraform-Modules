#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

#Reading existing log analytics workspace info
data "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.example.name
}

#Provisions a basic Azure Sentinel
resource "azurerm_log_analytics_solution" "example" {
  solution_name         = "SecurityInsights"
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  workspace_resource_id = data.azurerm_log_analytics_workspace.example.id
  workspace_name        = data.azurerm_log_analytics_workspace.example.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
  tags = var.tags
}