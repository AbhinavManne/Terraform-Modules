<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 04/11/2022
##  Introduction 
This module helps us to provision cosmosdb mongodb database and collection.

## File Structure 
This particular module is having the following configuration files.
- mongo.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in mongo.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_mongo_collection.mdb_collection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_collection) | resource |
| [azurerm_cosmosdb_mongo_database.mongodb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_analytical_storage_ttl"></a> [analytical\_storage\_ttl](#input\_analytical\_storage\_ttl) | The default time to live of Analytical Storage for this Mongo Collection. If present and the value is set to -1, it is equal to infinity, and items don’t expire by default. If present and the value is set to some number n – items will expire n seconds after their last modified time. | `string` | "-1" | no |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Specifies the name of the CosmosDB Account. | `string` | n/a | yes |
| <a name="input_db_max_throughput"></a> [db\_max\_throughput](#input\_db\_max\_throughput) | The maximum throughput of the MongoDB database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput. | `number` | n/a | no |
| <a name="input_default_ttl_seconds"></a> [default\_ttl\_seconds](#input\_default\_ttl\_seconds) | The default Time To Live in seconds. If the value is -1 or 0, items are not automatically expired. | `string` | 0 | bno |
| <a name="input_index"></a> [index](#input\_index) | keys - (Required) Specifies the list of user settable keys for each Cosmos DB Mongo Collection. unique - (Optional) Is the index unique or not? Defaults to false. | <pre>list(object({<br>    keys   = list(string)<br>    unique = bool<br>  }))</pre> | n/a | no |
| <a name="input_mdc_max_throughput"></a> [mdc\_max\_throughput](#input\_mdc\_max\_throughput) | The maximum throughput of the MongoDB collection (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput. | `number` | n/a | no |
| <a name="input_mongo_db_name"></a> [mongo\_db\_name](#input\_mongo\_db\_name) | Specifies the name of the Cosmos DB Mongo Database. | `string` | n/a | yes |
| <a name="input_mongodb_collection_name"></a> [mongodb\_collection\_name](#input\_mongodb\_collection\_name) | Specifies the name of the Cosmos DB Mongo Collection. | `string` | n/a | yes |
| <a name="input_mongodb_throughput"></a> [mongodb\_throughput](#input\_mongodb\_throughput) | The throughput of the MongoDB database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. | `number` | n/a | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_shard_key"></a> [shard\_key](#input\_shard\_key) | The name of the key to partition on for sharding. There must not be any other unique index keys. | `string` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. | `number` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mongodb_collection_id"></a> [mongodb\_collection\_id](#output\_mongodb\_collection\_id) | The ID of the Cosmos DB Mongo Collection. |
| <a name="output_mongodb_id"></a> [mongodb\_id](#output\_mongodb\_id) | The ID of the Cosmos DB Mongo Database. |

## Module Usage
```
#Reference to cosmosdb mongodb module
module "cosmosdb_mongodb" {
  depends_on = [
    module.cosmosdb_account
  ]
  source                  = "../../modules/module_cosmosdb_mongo"
  mongo_db_name           = var.mongo_db_name
  resource_group_name     = var.resource_group_name
  cosmosdb_account_name   = var.cosmosdb_account_name
  mongodb_throughput      = var.mongodb_throughput
  db_max_throughput       = var.db_max_throughput
  mongodb_collection_name = var.mongodb_collection_name
  shard_key               = var.shard_key
  analytical_storage_ttl  = var.analytical_storage_ttl
  default_ttl_seconds     = var.default_ttl_seconds
  throughput              = var.throughput
  index                   = var.index
  mdc_max_throughput      = var.mdc_max_throughput
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

## Mongodb Database : Terraform
* Please refer this link to understand more about Mongodb Database configurations through terraform: [Mongodb_Database_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database)

## Mongodb Collection : Terraform
* Please refer this link to understand more about Mongodb collection configurations through terraform: [Mongodb_collection_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_collection)
<!-- END_TF_DOCS -->