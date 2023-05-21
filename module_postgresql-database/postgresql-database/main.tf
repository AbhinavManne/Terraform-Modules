
locals {
  if_threat_detection_policy_enabled = var.enable_threat_detection_policy ? [{}] : []
}

data "azurerm_client_config" "current" {}

#------------------------------------------ Postgresql Server -------------------------------------------
resource "azurerm_postgresql_server" "main" {
  name                              = format("%s", var.postgresqlserver_name)
  resource_group_name               = var.resource_group_name
  location                          = var.location
  administrator_login               = var.admin_username == null ? "postgresqladmin" : var.admin_username
  administrator_login_password      = var.admin_password
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  version                           = var.postgresql_version
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  create_mode                       = var.create_mode
  tags                              = merge({ "Name" = format("%s", var.postgresqlserver_name) }, var.tags, )

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type = var.managed_identity_type
    }
  }

  dynamic "threat_detection_policy" {
    for_each = var.enable_threat_detection_policy ? [1] : []
    content {
      enabled                    = var.enable_threat_detection_policy
      disabled_alerts            = var.disabled_alerts
      email_account_admins       = var.email_addresses_for_alerts != null ? true : false
      email_addresses            = var.email_addresses_for_alerts
      retention_days             = var.log_retention_days
      storage_account_access_key = var.storage_account_access_key
      storage_endpoint           = var.storage_endpoint
    }
  }
}

#----------------------------------- Postgresql Database --------------------------------------------

resource "azurerm_postgresql_database" "main" {
  name                = format("%s-database", var.postgresqlserver_name)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  charset             = var.charset
  collation           = var.collation
}

#----------------------------------- Postgresql Configuration -----------------------------------------

resource "azurerm_postgresql_configuration" "main" {
  for_each            = var.postgresql_configuration != null ? { for k, v in var.postgresql_configuration : k => v if v != null } : {}
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  value               = each.value
}

#----------------------------------- Postgresql Firewall Rules --------------------------------------------

resource "azurerm_postgresql_firewall_rule" "main" {
  for_each            = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  start_ip_address    = each.value["start_ip_address"]
  end_ip_address      = each.value["end_ip_address"]
}

#------------------------------ Postgresql Active directory administrator ----------------------------------

resource "azurerm_postgresql_active_directory_administrator" "ad_administrator" {
  count               = var.ad_admin_login_name != null ? 1 : 0
  server_name         = azurerm_postgresql_server.main.name
  resource_group_name = var.resource_group_name
  login               = var.ad_admin_login_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}

#----------------------------------------- Postgresql server key -------------------------------------------

resource "azurerm_postgresql_server_key" "mysql_server_key" {
  server_id        = azurerm_postgresql_server.main.id
  key_vault_key_id = var.key_vault_key_id
}

#------------------------------------- Postgresql Vnet Rules -----------------------------------------------

resource "azurerm_postgresql_virtual_network_rule" "main" {
  name                = format("%s-vnet-rule", var.postgresqlserver_name)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.main.name
  subnet_id           = var.subnet_id
}

