data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.example.name
}

data "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = var.diagnostic_setting_name
  target_resource_id = data.azurerm_key_vault.example.id
  storage_account_id = data.azurerm_storage_account.example.id

  log {
    category = var.log_category
    enabled  = var.enabled

    retention_policy {
      enabled = var.enabled
    }
  }

  metric {
    category = var.metric_category

    retention_policy {
      enabled = var.enabled
    }
  }
}