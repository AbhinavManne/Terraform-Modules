
locals {
  default_tags = {
    env   = var.environment
    stack = var.stack
  }

  name_prefix = var.name_prefix != "" ? replace(var.name_prefix, "/[a-z0-9]$/", "$0-") : ""

  server_name = coalesce(
    var.server_custom_name,
    "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-sql",
  )
  elastic_pool_name = coalesce(
    var.elastic_pool_custom_name,
    "${local.name_prefix}${var.stack}-${var.client_name}-${var.location_short}-${var.environment}-pool",
  )

  elastic_pool_sku = {
    name     = format("%sPool", var.sku.tier)
    capacity = var.sku.capacity
    tier     = var.sku.tier
  }
  /*
  log_categories = [
    "SQLInsights",
    "AutomaticTuning",
    "QueryStoreRuntimeStatistics",
    "QueryStoreWaitStatistics",
    "Errors",
    "DatabaseWaitStatistics",
    "Timeouts",
    "Blocks",
    "Deadlocks",
    "Audit",
    "SQLSecurityAuditEvents",
  ] */
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------

#Reading an existing resource group info
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "random_password" "main" {
  length      = var.random_password_length
  min_upper   = 4
  min_lower   = 2
  min_numeric = 4
  special     = false

  keepers = {
    administrator_login_password = local.server_name
  }
}

data "azurerm_sql_server" "example" {
  name                = var.sqlserver_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_sql_firewall_rule" "firewall_rule" {
  count = length(var.allowed_cidr_list)

  name                = "rule-${count.index}"
  resource_group_name = data.azurerm_resource_group.rg.name
  server_name         = data.azurerm_sql_server.example.name

  start_ip_address = cidrhost(var.allowed_cidr_list[count.index], 0)
  end_ip_address   = cidrhost(var.allowed_cidr_list[count.index], -1)
}

resource "azurerm_mssql_elasticpool" "elastic_pool" {
  name = local.elastic_pool_name

  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  server_name = data.azurerm_sql_server.example.name

  per_database_settings {
    max_capacity = coalesce(var.database_max_dtu_capacity, var.sku.capacity)
    min_capacity = var.database_min_dtu_capacity
  }

  max_size_gb    = var.elastic_pool_max_size
  zone_redundant = var.zone_redundant

  sku {
    capacity = local.elastic_pool_sku.capacity
    name     = local.elastic_pool_sku.name
    tier     = local.elastic_pool_sku.tier
  }

  tags = merge(local.default_tags, var.extra_tags, var.elastic_pool_extra_tags)
}

resource "azurerm_sql_database" "db" {
  count = length(var.databases_names)

  name                = var.databases_names[count.index]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  server_name = data.azurerm_sql_server.example.name
  collation   = var.databases_collation

  requested_service_objective_name = "ElasticPool"
  elastic_pool_name                = azurerm_mssql_elasticpool.elastic_pool.name

  threat_detection_policy {
    email_account_admins = var.enable_advanced_data_security_admin_emails ? "Enabled" : "Disabled"
    email_addresses      = var.advanced_data_security_additional_emails
    state                = var.enable_advanced_data_security ? "Enabled" : "Disabled"
  }

  tags = merge(local.default_tags, var.extra_tags, var.databases_extra_tags)
}