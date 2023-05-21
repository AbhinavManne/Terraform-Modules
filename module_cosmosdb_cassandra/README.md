<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 04/11/2022
##  Introduction 
This module helps us to provision cosmosdb cassandra keyspace and table.

## File Structure 
This particular module is having the following configuration files.
- cassandra.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cassandra.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_cassandra_keyspace.ckeyspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_cassandra_keyspace) | resource |
| [azurerm_cosmosdb_cassandra_table.ctable](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_cassandra_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytical_storage_ttl"></a> [analytical\_storage\_ttl](#input\_analytical\_storage\_ttl) | Time to live of the Analytical Storage. Possible values are between -1 and 2147483647 except 0. -1 means the Analytical Storage never expires. Changing this forces a new resource to be created. | `number` | n/a | no |
| <a name="input_cass_keyspace_name"></a> [cass\_keyspace\_name](#input\_cass\_keyspace\_name) | Specifies the name of the Cosmos DB Cassandra KeySpace. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cass_table_name"></a> [cass\_table\_name](#input\_cass\_table\_name) | Specifies the name of the Cosmos DB Cassandra Table. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Specifies the name of the CosmosDB Account. | `string` | n/a | yes |
| <a name="input_ctable_max_throughput"></a> [ctable\_max\_throughput](#input\_ctable\_max\_throughput) | The maximum throughput of the Cassandra Table (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput. | `number` | n/a | no |
| <a name="input_ctable_throughput"></a> [ctable\_throughput](#input\_ctable\_throughput) | The throughput of Cassandra KeySpace (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. | `number` | n/a | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Time to live of the Cosmos DB Cassandra table. Possible values are at least -1. -1 means the Cassandra table never expires. | `number` | n/a | no |
| <a name="input_keyspace_max_throughput"></a> [keyspace\_max\_throughput](#input\_keyspace\_max\_throughput) | The maximum throughput of the Cassandra KeySpace (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput. | `number` | n/a | no |
| <a name="input_keyspace_throughput"></a> [keyspace\_throughput](#input\_keyspace\_throughput) | The throughput of Cassandra KeySpace (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. | `number` | n/a | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | schema block of cassandra table | <pre>object({<br>    column = list(object({<br>      name = string<br>      type = string<br>    }))<br>    partition_key = list(object({<br>      name = string<br>    }))<br>    cluster_key = list(object({<br>      name     = string<br>      order_by = string<br>    }))<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cass_keyspace_id"></a> [cass\_keyspace\_id](#output\_cass\_keyspace\_id) | the ID of the CosmosDB Cassandra KeySpace. |
| <a name="output_cass_table_id"></a> [cass\_table\_id](#output\_cass\_table\_id) | the ID of the CosmosDB Cassandra Table. |

## Module Usage
```
#Reference to cosmosdb cassandra module
module "cosmosdb_cassandra" {
    depends_on = [
      module.cosmosdb_account
    ]
  source                  = "../../modules/module_cosmosdb_cassandra"
  cass_keyspace_name      = var.cass_keyspace_name
  resource_group_name     = var.resource_group_name
  cosmosdb_account_name   = var.cosmosdb_account_name
  keyspace_throughput     = var.keyspace_throughput
  keyspace_max_throughput = var.keyspace_max_throughput
  cass_table_name         = var.cass_table_name
  ctable_throughput       = var.ctable_throughput
  default_ttl             = var.default_ttl
  analytical_storage_ttl  = var.analytical_storage_ttl
  schema                  = var.schema
  ctable_max_throughput   = var.ctable_max_throughput
}

#Reference to cosmosdb account module
module "cosmosdb_account" {
  source                                = "../../modules/module_cosmosdb_account"
  cosmosdb_account_name                 = var.cosmosdb_account_name
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  cosmosdb_offer_type                   = var.cosmosdb_offer_type
  cosmosdb_kind                         = var.cosmosdb_kind
  cosmosdb_create_mode                  = var.cosmosdb_create_mode
  default_identity_type                 = var.default_identity_type
  enable_automatic_failover             = var.enable_automatic_failover
  ip_range_filter                       = var.ip_range_filter
  enable_free_tier                      = var.enable_free_tier
  analytical_storage_enabled            = var.analytical_storage_enabled
  enable_multiple_write_locations       = var.enable_multiple_write_locations
  access_key_metadata_writes_enabled    = var.access_key_metadata_writes_enabled
  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  key_vault_key_id                      = var.key_vault_key_id
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  mongo_server_version                  = var.mongo_server_version
  local_authentication_disabled         = var.local_authentication_disabled
  consistency_level                     = var.consistency_level
  max_interval_in_seconds               = var.max_interval_in_seconds
  max_staleness_prefix                  = var.max_staleness_prefix
  failover_location                     = var.failover_location
  failover_priority                     = var.failover_priority
  zone_redundant                        = var.zone_redundant
  capabilities_name                     = var.capabilities_name
  subnet_id                             = var.subnet_id
  ignore_missing_vnet_service_endpoint  = var.ignore_missing_vnet_service_endpoint
  schema_type                           = var.schema_type
  total_throughput_limit                = var.total_throughput_limit
  backup_type                           = var.backup_type
  backup_interval_in_minutes            = var.backup_interval_in_minutes
  backup_retention_in_hours             = var.backup_retention_in_hours
  backup_storage_redundancy             = var.backup_storage_redundancy
  cors_rule                             = var.cors_rule
  identity_type                         = var.identity_type
  identity_ids                          = var.identity_ids
  source_cosmosdb_account_id            = var.source_cosmosdb_account_id
  restore_timestamp_in_utc              = var.restore_timestamp_in_utc
  database_name                         = var.database_name
  database_collection_names             = var.database_collection_names
  tags                                  = var.tags
}
```

## Cassandra Keyspace : Terraform
* Please refer this link to understand more about Cassandra Keyspace configurations through terraform: [Cassandra_Keyspace_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_cassandra_keyspace)

## Cassandra Table : Terraform
* Please refer this link to understand more about Cassandra Table configurations through terraform: [Cassandra_Table_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_cassandra_table)
<!-- END_TF_DOCS -->