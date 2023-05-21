
#-------------------------------------------------Analysis Services Server-----------------------------------------------------
resource "azurerm_analysis_services_server" "analysis_server" {
  name                      = var.server_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku                       = var.sku
  admin_users               = var.admin_users
  querypool_connection_mode = var.querypool_connection_mode
  backup_blob_container_uri = var.backup_blob_container_uri #"http://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.example.name}/index.html"
  enable_power_bi_service   = var.enable_power_bi_service
  tags                      = var.tags

  dynamic "ipv4_firewall_rule" {
    for_each = var.firewall_rules
    content {
      name        = ipv4_firewall_rule.value.name
      range_start = ipv4_firewall_rule.value.range_start
      range_end   = ipv4_firewall_rule.value.range_end
    }
  }
}