
#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE ----------------------------------#
resource "azurerm_log_analytics_workspace" "log_work" {
  name                       = var.log_analytics_workspace
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.log_sku 
  retention_in_days          = var.retention_in_days
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.log_sku == "CapacityReservation" ? var.reservation_capacity_in_gb_per_day : null 
  daily_quota_gb             = var.log_sku != "Free" ? var.daily_quota_gb : null 
  tags                       = var.tags
}

#--------------------------------RESOURCE: LOG ANALYTICS SOLUTION ----------------------------------#
resource "azurerm_log_analytics_solution" "log_sol" { 
  count                 = var.create_log_analytics_solution ? 1 : 0
  solution_name         = var.solution_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_work.id
  workspace_name        = azurerm_log_analytics_workspace.log_work.name

  plan {
    publisher      = var.plan_publisher
    product        = var.plan_product
    promotion_code = var.promotion_code
  }
  tags                   = var.tags
}

