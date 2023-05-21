resource "azurerm_netapp_volume" "example_primary" {
  lifecycle {
    prevent_destroy = true
  }

  name                = var.netapp_volume_primary
  location            = var.location
  resource_group_name = var.resource_group_name
  account_name        = var.account_name
  pool_name           = var.pool_name
  volume_path         = var.netapp_volume_primary
  service_level       = var.service_level
  protocols           = var.protocols
  subnet_id           = var.primary_subnet
  storage_quota_in_gb = var.storage_quota_in_gb
  tags                = var.tags

  # export_policy_rule {
  #   rule_index        = var.rule_index
  #   allowed_clients   = var.allowed_clients
  #   protocols_enabled = var.protocols_enabled
  #   unix_read_only    = var.unix_read_only
  #   unix_read_write   = var.unix_read_write
  # }

  dynamic "export_policy_rule" {
    for_each = var.export_policy_rule
    iterator = item #optional
    content {
      rule_index        = item.value.rule_index
      allowed_clients   = item.value.allowed_clients
      protocols_enabled = item.value.protocols_enabled
      unix_read_only    = item.value.unix_read_only
      unix_read_write   = item.value.unix_read_write

    }
  }
}


