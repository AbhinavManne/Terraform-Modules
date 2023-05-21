#-------------------------------------DEFAULT VALUES OF MARIA_DB_MODULE--------------------------------#
secret_name         = "mariadmin"
keyvault_id         = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.KeyVault/vaults/kv-739"
resource_group_name = "cil-mdisk-testing-as"
location            = "East US"

#----RESOURCE: MARIA DB SERVER----#
mariadb_server_name                          = "mariadbserver-t001"
mariadb_server_sku_name                      = "GP_Gen5_2" #GP: General Purpose; B: Basic
mariadb_server_version                       = "10.3"      //"10.2"      #Possible values are 10.2 and 10.3
mariadb_server_auto_grow_enabled             = true        //false
mariadb_server_backup_retention_days         = 7
mariadb_server_create_mode                   = "Default" //"GeoRestore"//
mariadb_server_creation_source_server_id     = null      //"/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/testing-001/providers/Microsoft.DBforMariaDB/servers/testing-replica-mdb-001"
mariadb_server_geo_redundant_backup_enabled  = true      //false
mariadb_server_public_network_access_enabled = true
mariadb_server_restore_point_in_time         = null //
mariadb_server_ssl_enforcement_enabled       = true
mariadb_server_storage_mb                    = 5120
tags = {
  Contact_name  = "Aabya"
  Contact_email = "aabya.singh@gds.ey.com"
  Project_name  = "CIL"
  region        = "East US"
}

#----RESOURCE: MARIA DB DATABASE----#
mariadb_database_settings = {
  db1 = {
    name      = "maria_db_T1"
    charset   = "utf8"
    collation = "utf8_unicode_ci"
  }
  db2 = {
    name      = "maria_db_T2"
    charset   = "utf8"
    collation = "utf8_unicode_ci"
  }
}

#----RESOURCE: MARIA DB CONFIGURATION----#
mariadb_configuration_settings = {
  config1 = {
    name  = "interactive_timeout"
    value = "600"
  }
}

#----RESOURCE: MARIA DB FIREWALL RULES----#
mariadb_firewall_rules = {
  access-to-azure = {
    start_ip_address = "0.0.0.0"
    end_ip_address   = "0.0.0.0"
  },
  desktop-ip = {
    start_ip_address = "49.204.228.222"
    end_ip_address   = "49.204.228.222"
  }
}

#----RESOURCE: MARIA DB VNET RULE/SERVICE ENDPOINT----#
mariadb_virtual_network_rule = "mariadb-vnet-rule"
subnet_id                    = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/cil-mdisk-testing-as/providers/Microsoft.Network/virtualNetworks/cil-testing-maria-vnet-001/subnets/default" //


#----DEFAULT VALUES: PRIVATE ENDPOINT MODULE----#
create_private-endpoint           = true
private_endpoint_name             = "mdb-pep-testing"
private_service_connection_name   = "mdb-privateserviceconnection-testing"
subresource_names                 = ["mariadbServer"]
is_manual_connection              = false
request_message                   = null
private_connection_resource_id    = null
private_dns_zone_group            = null
private_connection_resource_alias = null

/*
#----DEFAULT VALUES: ALERT MODULE----#
action_group_name        = "test-action-groupmdb"
short_name               = "actionmdb"
action_group_rule_name   = "test-mdb"
scope_type               = "Resource"
activity_log_alert_name  = "test-activitylogalertmdb"
resource_group_id        = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/testing-001"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "test-metricalertmdb"
storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/testing-001/providers/Microsoft.Storage/storageAccounts/testingcommonstracc001"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]

#----DEFAULT VALUES: DIAGNOSTIC MODULE----#
enable_log_monitoring           = true
diag_name                       = "mdb-diag"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null #"Dedicated"
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
log_retention_days              = 7
metric_retention_policy_enabled = true
metric_retention_days           = 7
*/
