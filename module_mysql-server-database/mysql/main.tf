#----------------------------------------------------------------
# Adding  MySQL Server creation and settings - Default is "True"
#-----------------------------------------------------------------
resource "azurerm_mysql_server" "mysql" {
  name                              = var.mysqlserver_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  administrator_login               = var.admin_username != null ? var.admin_username : null
  administrator_login_password      = var.admin_password != null ? var.admin_password : null
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  version                           = var.mysql_version
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  create_mode                       = var.create_mode
  creation_source_server_id         = var.create_mode != "Default" ? var.creation_source_server_id : null
  restore_point_in_time             = var.create_mode == "PointInTimeRestore" ? var.restore_point_in_time : null
  tags                              = var.tags

  dynamic "identity" {
    for_each = var.identity != null ? [1] : []
    content {
      type = var.identity
    }
  }

  dynamic "threat_detection_policy" {
    for_each = var.threat_detection_policy != null ? [1] : []
    content {
      enabled                    = var.threat_detection_policy.enabled
      disabled_alerts            = var.threat_detection_policy.disabled_alerts
      email_account_admins       = var.threat_detection_policy.email_account_admins
      email_addresses            = var.threat_detection_policy.email_addresses
      retention_days             = var.threat_detection_policy.retention_days
      storage_account_access_key = var.threat_detection_policy.storage_account_access_key
      storage_endpoint           = var.threat_detection_policy.storage_endpoint
    }

  }
}

#------------------------------------------------------------
# Adding  MySQL Server Database - Default is "true"
#------------------------------------------------------------
resource "azurerm_mysql_database" "mysql_database" {

  for_each = var.mysql_database != null ? { for k, v in var.mysql_database : k => v if v != null } : {}

  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  charset             = each.value.charset
  collation           = each.value.collation
}
#------------------------------------------------------------
# Adding  MySQL Server Parameters - Default is "false"
#------------------------------------------------------------
resource "azurerm_mysql_configuration" "main" {
  for_each            = var.mysql_configuration != null ? { for k, v in var.mysql_configuration : k => v if v != null } : {}
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  value               = each.value
}

#------------------------------------------------------------
# Adding Firewall rules for MySQL Server - Default is "false"
#------------------------------------------------------------
resource "azurerm_mysql_firewall_rule" "main" {
  for_each            = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  start_ip_address    = each.value["start_ip_address"]
  end_ip_address      = each.value["end_ip_address"]
}

#----------------------------------------------------------
# Adding AD Admin to MySQL Server - Default is "false"
#----------------------------------------------------------
resource "azurerm_mysql_active_directory_administrator" "example" {
  count               = var.ad_admin_login_name != null ? 1 : 0
  server_name         = azurerm_mysql_server.mysql.name
  resource_group_name = var.resource_group_name
  login               = var.ad_admin_login_name
  tenant_id           = var.tenant_id
  object_id           = var.object_id
}

#------------------------------------------------------------------------
# Manages a Customer Managed Key for a MySQL Server. - Default is "false"
#------------------------------------------------------------------------
resource "azurerm_mysql_server_key" "example" {
  count            = var.key_vault_key_id != null ? 1 : 0
  server_id        = azurerm_mysql_server.mysql.id
  key_vault_key_id = var.key_vault_key_id
}

#--------------------------------------------------------------------------------
# Allowing traffic between an Azure SQL server and a subnet - Default is "false"
#--------------------------------------------------------------------------------
resource "azurerm_mysql_virtual_network_rule" "main" {
  count               = var.subnet_id != null ? 1 : 0
  name                = format("%s-vnet-rule", var.mysqlserver_name)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql.name
  subnet_id           = var.subnet_id
}