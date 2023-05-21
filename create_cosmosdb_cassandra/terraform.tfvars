resource_group_name = "testing-cosmos-rg-as"
location            = "East US"

#----CASSANDRA KEYSPACE----#
cass_keyspace_name      = "testing-ckeyspace-as"
keyspace_throughput     = 400
keyspace_max_throughput = null

#----CASSANDRA TABLE----#
cass_table_name        = "testing-ctable-as"
ctable_throughput      = 400
default_ttl            = 0
analytical_storage_ttl = 1
schema = {
  cluster_key = null
  column = [{
    name = "test1"
    type = "ascii"
    },
    {
      name = "test2"
      type = "ascii"
  }]
  partition_key = [{
    name = "test1"
  }]
}
ctable_max_throughput = null

#----COSMOSDB ACCOUNT----#
cosmosdb_account_name                 = "testing-cosmosdb-acc-001"
cosmosdb_offer_type                   = "Standard"
cosmosdb_kind                         = null//"MongoDB"
cosmosdb_create_mode                  = null //"Default"
default_identity_type                 = "FirstPartyIdentity"
enable_automatic_failover             = true
ip_range_filter                       = "49.204.228.223/29,0.0.0.0" #The Azure feature "Allow access to Azure services" can be enabled by setting ip_address to 0.0.0.0             
enable_free_tier                      = false
analytical_storage_enabled            = true
enable_multiple_write_locations       = true
access_key_metadata_writes_enabled    = true
public_network_access_enabled         = true
is_virtual_network_filter_enabled     = true
key_vault_key_id                      = null
network_acl_bypass_for_azure_services = true
network_acl_bypass_ids                = null
mongo_server_version                  = null //"3.6"
local_authentication_disabled         = false
consistency_level                     = "BoundedStaleness"
max_interval_in_seconds               = 300
max_staleness_prefix                  = 100000
failover_location                     = "west us"
failover_priority                     = "0"
zone_redundant                        = false
capabilities_name                     = "EnableCassandra"
subnet_id                             = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/testing-cosmos-rg-as/providers/Microsoft.Network/virtualNetworks/testing-cosmos-vnet-as/subnets/default"
ignore_missing_vnet_service_endpoint  = true
schema_type                           = "WellDefined"
total_throughput_limit                = "-1"
backup_type                           = "Periodic"
backup_interval_in_minutes            = 60
backup_retention_in_hours             = 8
backup_storage_redundancy             = "Local"
cors_rule                             = null
identity_type                         = "SystemAssigned"
identity_ids                          = null
source_cosmosdb_account_id            = null
restore_timestamp_in_utc              = null
database_name                         = null
database_collection_names             = null
tags = {
  contact_email = "aabya.singh@gds.ey.com"
  contact_name  = "Aabya"
  project_name  = "Azure_CIL"
  region        = "East US"
}
