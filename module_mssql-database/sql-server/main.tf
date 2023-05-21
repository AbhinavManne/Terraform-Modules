#----Local Block --------------#

locals {
  if_threat_detection_policy_enabled  = var.enable_threat_detection_policy ? [{}] : []
  if_extended_auditing_policy_enabled = var.enable_auditing_policy ? true : false
  if_create_database                  = var.if_database_name == true ? var.database_name : null
}


#-------------------------------------------------------------
# MSSQL servers 
#-------------------------------------------------------------

resource "azurerm_mssql_server" "primary" {
  name                          = format("%s-mssql-primary", var.sqlserver_name)
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.sql_server_version
  administrator_login           = var.admin_login != null ? var.admin_login : null
  administrator_login_password  = var.admin_password_primary != null ? var.admin_password_primary : null
  minimum_tls_version           = var.min_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  connection_policy             = var.connection_policy


  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled #false


  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator != null ? [1] : []
    content {
      login_username              = lookup(var.azuread_administrator, "login_username")
      object_id                   = lookup(var.azuread_administrator, "object_id")
      tenant_id                   = lookup(var.azuread_administrator, "tenant_id", null)
      azuread_authentication_only = lookup(var.azuread_administrator, "azuread_authentication_only", null)
    }
  }


  primary_user_assigned_identity_id = var.managed_identity_type == "UserAssigned" ? var.managed_identity_ids[0] : null

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }

  tags = var.tags
}


#----------------------------------
#Secondary server is depends_on Failover Group
#----------------------------------
resource "azurerm_mssql_server" "secondary" {
  count                                = var.enable_failover_group ? 1 : 0
  name                                 = format("%s-mssql-secondary", var.sqlserver_name)
  resource_group_name                  = var.resource_group_name
  location                             = var.secondary_sql_server_location
  version                              = var.sql_server_version
  administrator_login                  = var.admin_login != null ? var.admin_login : null
  administrator_login_password         = var.admin_password_secondary != null ? var.admin_password_secondary : null
  public_network_access_enabled        = var.public_network_access_enabled
  minimum_tls_version                  = var.min_tls_version
  connection_policy                    = var.connection_policy
  outbound_network_restriction_enabled = var.outbound_network_restriction_enabled
  primary_user_assigned_identity_id    = var.managed_identity_type == "UserAssigned" ? var.managed_identity_ids[0] : null



  dynamic "azuread_administrator" {
    for_each = var.azuread_administrator != null ? [1] : []
    content {
      login_username              = lookup(var.azuread_administrator, "login_username")
      object_id                   = lookup(var.azuread_administrator, "object_id")
      tenant_id                   = lookup(var.azuread_administrator, "tenant_id", null)
      azuread_authentication_only = lookup(var.azuread_administrator, "azuread_authentication_only", null)
    }
  }

  dynamic "identity" {
    for_each = var.managed_identity_type != null ? [1] : []
    content {
      type         = var.managed_identity_type
      identity_ids = var.managed_identity_type == "UserAssigned" || var.managed_identity_type == "SystemAssigned, UserAssigned" ? var.managed_identity_ids : null
    }
  }
  tags = var.tags
}


# #---------------------------------------------------------
# # Azure MSSQL server auditing policy 
# #---------------------------------------------------------
#  Enable database auditing to track database events and write them to an audit log in Azure storage account
resource "azurerm_mssql_server_extended_auditing_policy" "extended_auditing_policy" {
  count                                   = local.if_extended_auditing_policy_enabled ? 1 : 0
  server_id                               = azurerm_mssql_server.primary.id
  retention_in_days                       = var.retention_days
  storage_endpoint                        = var.primary_blob_endpoint
  storage_account_access_key              = var.primary_access_key
  storage_account_access_key_is_secondary = var.primary_blob_endpoint != null ? var.storage_account_access_key_is_secondary : null
  log_monitoring_enabled                  = var.log_monitoring_enabled
}

# #---------------------------------------------------------
# #   Azure MSSQL database
# #---------------------------------------------------------

resource "azurerm_mssql_database" "database" {
  name                        = local.if_create_database
  server_id                   = azurerm_mssql_server.primary.id
  collation                   = var.collation != null ? var.collation : null
  license_type                = var.license_type != null ? var.license_type : null
  max_size_gb                 = var.max_size_gb != null ? var.max_size_gb : null
  read_scale                  = var.read_scale != null ? var.read_scale : null
  sku_name                    = var.sku_name != null ? var.sku_name : null
  zone_redundant              = var.zone_redundant != null ? var.zone_redundant : null
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes != null ? var.auto_pause_delay_in_minutes : null
  create_mode                 = var.create_mode != null ? var.create_mode : null
  creation_source_database_id = var.creation_source_database_id != null ? var.creation_source_database_id : null
  elastic_pool_id             = var.elastic_pool_id != null ? var.elastic_pool_id : null
  min_capacity                = var.min_capacity_db != null ? var.min_capacity_db : null
  restore_point_in_time       = var.create_mode == "PointInTimeRestore" ? var.restore_point_in_time : null
  read_replica_count          = var.read_replica_count != null ? var.read_replica_count : null
  sample_name                 = var.sample_name != null ? var.sample_name : null
  storage_account_type        = var.storage_account_type != null ? var.storage_account_type : null
  geo_backup_enabled          = var.geo_backup_enabled != null ? var.geo_backup_enabled : null
  ledger_enabled              = var.ledger_enabled != null ? var.ledger_enabled : null
  recover_database_id         = var.create_mode == "Recovery" ? var.recover_database_id : null
  restore_dropped_database_id = var.create_mode == "Restore" ? var.restore_dropped_database_id : null
  tags                        = var.tags

  # Threat Detection to get security alerts and recommendations on how to investigate and mitigate threats with the help of Azure Defender. From Azure Console 
  dynamic "threat_detection_policy" {
    for_each = local.if_threat_detection_policy_enabled
    content {
      state                      = var.state
      disabled_alerts            = var.disabled_alerts
      email_account_admins       = var.threat_policy_email_account_admins
      storage_endpoint           = var.primary_blob_endpoint
      storage_account_access_key = var.primary_access_key
      retention_days             = var.retention_days
      email_addresses            = var.email_addresses_for_alerts
    }
  }

  ##-------------For Backups ----------------------------------------##

  dynamic "short_term_retention_policy" {
    for_each = var.short_retentiondays != null ? [1] : []
    content {
      retention_days           = var.short_retentiondays
      backup_interval_in_hours = var.backup_interval_in_hours
    }
  }


  dynamic "long_term_retention_policy" {
    for_each = var.long_term_retention_policy != null ? [1] : []
    content {
      weekly_retention  = lookup(var.long_term_retention_policy, "ltr_weekly_retention", null)
      monthly_retention = lookup(var.long_term_retention_policy, "tr_monthly_retention", null)
      yearly_retention  = lookup(var.long_term_retention_policy, "ltr_yearly_retention", null)
      week_of_year      = lookup(var.long_term_retention_policy, "week_of_year") //required
    }
  }
}

####---------------Auditing Policy for mssql db-----------------------------#####
resource "azurerm_mssql_database_extended_auditing_policy" "mssqldb" {
  count                                   = var.mssql_db_auditing_enabled == true ? 1 : 0
  database_id                             = azurerm_mssql_database.database.id
  enabled                                 = var.mssql_db_auditing_enabled //setting it as false will not create auditing policy for db
  storage_endpoint                        = var.sa_primary_blob_endpoint
  storage_account_access_key              = var.sa_primary_access_key
  storage_account_access_key_is_secondary = var.storage_account_access_key_is_secondary
  retention_in_days                       = var.retention_days
  log_monitoring_enabled                  = var.log_monitoring_enabled
}

# #---------------------------------------------------------
# # Azure MSSQL Firewall Rule 
# #---------------------------------------------------------

#firewall rules in Azure SQL to grant access to databases based on the originating IP address of each request 
#trigger alerts if any malicious activity observed on firewall rules

resource "azurerm_mssql_firewall_rule" "fw01" {
  count            = var.enable_firewall_rules ? 1 : 0
  name             = var.firewall_rule1
  server_id        = azurerm_mssql_server.primary.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

#This firewall rule is for secondary server if if we set enable_failover_group as "true" the only firewall rule will be created
resource "azurerm_mssql_firewall_rule" "fw02" {
  count            = var.enable_failover_group ? 1 : 0
  name             = var.firewall_rule2
  server_id        = azurerm_mssql_server.secondary.0.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address
}

# # #---------------------------------------------------------
# # # Azure MSSQL Failover Group  
# # #---------------------------------------------------------


#Enforce usage of Failover groups  in Azure SQL to manage replication and availablity of the databases by choosing a different partner server in a different region.
resource "azurerm_mssql_failover_group" "failover_group" {
  count = var.enable_failover_group ? 1 : 0
  name  = format("%s-failovergroup", var.sqlserver_name)


  server_id = azurerm_mssql_server.primary.id
  databases = [azurerm_mssql_database.database.id]
  partner_server {
    id = azurerm_mssql_server.secondary.0.id
  }

  read_write_endpoint_failover_policy {
    mode          = var.mode
    grace_minutes = var.grace_minutes
  }
  tags = var.tags
}


#Manages the transparent data encryption configuration for a MSSQL Server(service managed key)
resource "azurerm_mssql_server_transparent_data_encryption" "data_encryption" {
  server_id = azurerm_mssql_server.primary.id
}


#----------------------------
#Security Alert Policy 
#----------------------------
resource "azurerm_mssql_server_security_alert_policy" "alert_policy" {
  count                      = var.create_alert-policy ? 1 : 0
  resource_group_name        = var.resource_group_name
  server_name                = azurerm_mssql_server.primary.name
  state                      = var.state
  email_addresses            = var.email_addresses_for_alerts
  email_account_admins       = var.email_account_admins
  storage_endpoint           = var.primary_blob_endpoint
  storage_account_access_key = var.primary_access_key
}

#########---------------------Elastic pool for mssql ----------------########################
resource "azurerm_mssql_elasticpool" "sqlelastic" {
  count               = var.create_elasticpool ? 1 : 0
  name                = var.sql_elasticpool
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_mssql_server.primary.name
  license_type        = var.license_type
  max_size_gb         = var.max_size_gb
  tags                = var.tags
  #Elastic pool Configuration(required blocks for elastic pool)
  sku {
    name     = var.sku
    tier     = var.tier
    family   = var.family
    capacity = var.capacity
  }
  #required block
  per_database_settings {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }
}
resource "azurerm_mssql_virtual_network_rule" "current" {
    count = length(var.vnet_rules)

    server_id                               = azurerm_mssql_server.current.id
    name                                    = var.vnet_rules[count.index].name
    subnet_id                               = var.vnet_rules[count.index].subnet_id
    ignore_missing_vnet_service_endpoint    = true
}




