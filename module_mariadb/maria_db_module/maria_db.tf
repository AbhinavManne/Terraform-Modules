#MARIA_DB_MODULE
#-----------------------------------RESOURCE: MARIA DB SERVER------------------------------------------#
resource "azurerm_mariadb_server" "mariadb_server" {
  name                          = var.mariadb_server_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.mariadb_server_sku_name
  version                       = var.mariadb_server_version
  administrator_login           = var.mariadb_server_administrator_login
  administrator_login_password  = var.mariadb_server_administrator_login_password
  auto_grow_enabled             = var.mariadb_server_auto_grow_enabled
  backup_retention_days         = var.mariadb_server_backup_retention_days
  create_mode                   = var.mariadb_server_create_mode
  creation_source_server_id     = var.mariadb_server_create_mode != "Default" ? var.mariadb_server_creation_source_server_id : null
  geo_redundant_backup_enabled  = var.mariadb_server_geo_redundant_backup_enabled
  public_network_access_enabled = var.mariadb_server_public_network_access_enabled
  restore_point_in_time         = var.mariadb_server_create_mode != "PointInTimeRestore" ? var.mariadb_server_restore_point_in_time : null
  ssl_enforcement_enabled       = var.mariadb_server_ssl_enforcement_enabled
  storage_mb                    = var.mariadb_server_storage_mb
  tags                          = var.tags
}


#--------------------------------------RESOURCE: MARIA DB DATABASE-------------------------------------#
resource "azurerm_mariadb_database" "mariadb_database" {
  for_each            = var.mariadb_database_settings
  name                = each.value.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  resource_group_name = var.resource_group_name
  charset             = each.value.charset
  collation           = each.value.collation
}


#-------------------------------------RESOURCE: MARIA DB CONFIGURATION---------------------------------#
resource "azurerm_mariadb_configuration" "mariadb_configuration" {
  for_each            = var.mariadb_configuration_settings
  name                = each.value.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  resource_group_name = var.resource_group_name
  value               = each.value.value
}


#---------------------------------------RESOURCE: MARIA DB FIREWALL RULE--------------------------------#
#The Azure feature "Allow access to Azure services" can be enabled by setting start_ip_address and end_ip_address to 0.0.0.0
resource "azurerm_mariadb_firewall_rule" "mariadb_fr" {
  for_each            = var.mariadb_firewall_rules != null ? { for k, v in var.mariadb_firewall_rules : k => v if v != null } : {}
  name                = format("%s", each.key)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  start_ip_address    = each.value["start_ip_address"]
  end_ip_address      = each.value["end_ip_address"]
}


#-----------------------RESOURCE: MARIA DB VNET RULE ----------------------#
#MariaDB Virtual Network Rules can only be used with SKU Tiers of GeneralPurpose or MemoryOptimized
resource "azurerm_mariadb_virtual_network_rule" "mariadb_vnetrule" {
  name                = var.mariadb_virtual_network_rule
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  subnet_id           = var.subnet_id
}

