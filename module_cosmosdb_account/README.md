<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 04/11/2022
##  Introduction 
This module helps us to provision cosmosdb account, which further helps in cassandra, mongo db's provisioning.

## File Structure 
This particular module is having the following configuration files.
- cosmosdb_account.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in cosmosdb_account.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_account.cosmosdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_metadata_writes_enabled"></a> [access\_key\_metadata\_writes\_enabled](#input\_access\_key\_metadata\_writes\_enabled) | Is write operations on metadata resources (databases, containers, throughput) via account keys enabled? Defaults to true. | `string` | true | no |
| <a name="input_analytical_storage_enabled"></a> [analytical\_storage\_enabled](#input\_analytical\_storage\_enabled) | Enable Analytical Storage option for this Cosmos DB account. Defaults to false | `bool` | false | no |
| <a name="input_backup_interval_in_minutes"></a> [backup\_interval\_in\_minutes](#input\_backup\_interval\_in\_minutes) | The interval in minutes between two backups. This is configurable only when type is Periodic. Possible values are between 60 and 1440. | `number` | 60 | no |
| <a name="input_backup_retention_in_hours"></a> [backup\_retention\_in\_hours](#input\_backup\_retention\_in\_hours) | The time in hours that each backup is retained. This is configurable only when type is Periodic. Possible values are between 8 and 720. | `number` | 8 | no |
| <a name="input_backup_storage_redundancy"></a> [backup\_storage\_redundancy](#input\_backup\_storage\_redundancy) | The storage redundancy which is used to indicate type of backup residency. This is configurable only when type is Periodic. Possible values are Geo, Local and Zone. | `string` | n/a | no |
| <a name="input_backup_type"></a> [backup\_type](#input\_backup\_type) | The type of the backup. Possible values are Continuous and Periodic. Defaults to Periodic. Migration of Periodic to Continuous is one-way, changing Continuous to Periodic forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_capabilities_name"></a> [capabilities\_name](#input\_capabilities\_name) | The capability to enable - Possible values are AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableTable, EnableServerless, MongoDBv3.4 and mongoEnableDocLevelTTL. | `string` | n/a | yes |
| <a name="input_consistency_level"></a> [consistency\_level](#input\_consistency\_level) | The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix | `string` | n/a | yes |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | allowed\_headers -A list of headers that are allowed to be a part of the cross-origin request. allowed\_methods -A list of HTTP headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH. allowed\_origins -A list of origin domains that will be allowed by CORS. exposed\_headers -A list of response headers that are exposed to CORS clients. max\_age\_in\_seconds - (Required) The number of seconds the client should cache a preflight response. | <pre>object({<br>    allowed_headers    = string<br>    allowed_methods    = string<br>    allowed_origins    = string<br>    exposed_headers    = string<br>    max_age_in_seconds = string<br>  })</pre> | n/a | no |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | Specifies the name of the CosmosDB Account. | `string` | n/a | yes |
| <a name="input_cosmosdb_create_mode"></a> [cosmosdb\_create\_mode](#input\_cosmosdb\_create\_mode) | The creation mode for the CosmosDB Account. Possible values are Default and Restore. | `string` | "Default" | no |
| <a name="input_cosmosdb_kind"></a> [cosmosdb\_kind](#input\_cosmosdb\_kind) | Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB | `string` | n/a | yes |
| <a name="input_cosmosdb_offer_type"></a> [cosmosdb\_offer\_type](#input\_cosmosdb\_offer\_type) | Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard | `string` | n/a | yes |
| <a name="input_database_collection_names"></a> [database\_collection\_names](#input\_database\_collection\_names) | A list of the collection names for the restore request. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The database name for the restore request. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_default_identity_type"></a> [default\_identity\_type](#input\_default\_identity\_type) | The default identity for accessing Key Vault. Possible values are FirstPartyIdentity, SystemAssignedIdentity or start with UserAssignedIdentity. Defaults to FirstPartyIdentity. | `string` | n/a | yes |
| <a name="input_enable_automatic_failover"></a> [enable\_automatic\_failover](#input\_enable\_automatic\_failover) | Enable automatic fail over for this Cosmos DB account. | `bool` | n/a | no |
| <a name="input_enable_free_tier"></a> [enable\_free\_tier](#input\_enable\_free\_tier) | Enable Free Tier pricing option for this Cosmos DB account. Defaults to false | `bool` | n/a | no |
| <a name="input_enable_multiple_write_locations"></a> [enable\_multiple\_write\_locations](#input\_enable\_multiple\_write\_locations) | Enable multiple write locations for this Cosmos DB account. | `bool` | n/a | no |
| <a name="input_failover_location"></a> [failover\_location](#input\_failover\_location) | The name of the Azure region to host replicated data. | `string` | n/a | yes |
| <a name="input_failover_priority"></a> [failover\_priority](#input\_failover\_priority) | The failover priority of the region. A failover priority of 0 indicates a write region. The maximum value for a failover priority = (total number of regions - 1). Failover priority values must be unique for each of the regions in which the database account exists. | `string` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Cosmos Account. | `list(string)` | n/a | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that should be configured on this Cosmos Account. Possible value is only SystemAssigned. | `string` | n/a | yes |
| <a name="input_ignore_missing_vnet_service_endpoint"></a> [ignore\_missing\_vnet\_service\_endpoint](#input\_ignore\_missing\_vnet\_service\_endpoint) | If set to true, the specified subnet will be added as a virtual network rule even if its CosmosDB service endpoint is not active. Defaults to false | `string` | n/a | no |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces. | `string` | n/a | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account. | `bool` | n/a | no |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | Keyvault key ID | `string` | n/a | no |
| <a name="input_local_authentication_disabled"></a> [local\_authentication\_disabled](#input\_local\_authentication\_disabled) | Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication. Defaults to false. Can be set only when using the SQL API. | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_max_interval_in_seconds"></a> [max\_interval\_in\_seconds](#input\_max\_interval\_in\_seconds) | When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency\_level is set to BoundedStaleness. | `number` | n/a | yes |
| <a name="input_max_staleness_prefix"></a> [max\_staleness\_prefix](#input\_max\_staleness\_prefix) | When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency\_level is set to BoundedStaleness. | `number` | n/a | yes |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | The Server Version of a MongoDB account. Possible values are 4.2, 4.0, 3.6, and 3.2. | `string` | n/a | no |
| <a name="input_network_acl_bypass_for_azure_services"></a> [network\_acl\_bypass\_for\_azure\_services](#input\_network\_acl\_bypass\_for\_azure\_services) | If azure services can bypass ACLs. Defaults to false. | `string` | n/a | no |
| <a name="input_network_acl_bypass_ids"></a> [network\_acl\_bypass\_ids](#input\_network\_acl\_bypass\_ids) | The list of resource Ids for Network Acl Bypass for this Cosmos DB account. | `list(string)` | n/a | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this CosmosDB account. | `bool` | n/a | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_restore_timestamp_in_utc"></a> [restore\_timestamp\_in\_utc](#input\_restore\_timestamp\_in\_utc) | The creation time of the database or the collection (Datetime Format RFC 3339). | `string` | n/a | no |
| <a name="input_schema_type"></a> [schema\_type](#input\_schema\_type) | The schema type of the Analytical Storage for this Cosmos DB account. Possible values are FullFidelity and WellDefined. | `string` | n/a | no |
| <a name="input_source_cosmosdb_account_id"></a> [source\_cosmosdb\_account\_id](#input\_source\_cosmosdb\_account\_id) | The resource ID of the restorable database account from which the restore has to be initiated. The example is /subscriptions/{subscriptionId}/providers/Microsoft.DocumentDB/locations/{location}/restorableDatabaseAccounts/{restorableDatabaseAccountName}. | `string` | n/a | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_total_throughput_limit"></a> [total\_throughput\_limit](#input\_total\_throughput\_limit) | The total throughput limit imposed on this Cosmos DB account (RU/s). Possible values are at least -1. -1 means no limit. | `string` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Should zone redundancy be enabled for this region? Defaults to false. | `bool` | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_strings"></a> [connection\_strings](#output\_connection\_strings) | A list of connection strings available for this CosmosDB account. |
| <a name="output_cosmosdb_account_id"></a> [cosmosdb\_account\_id](#output\_cosmosdb\_account\_id) | The CosmosDB Account ID. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint used to connect to the CosmosDB account. |
| <a name="output_primary_key"></a> [primary\_key](#output\_primary\_key) | The Primary key for the CosmosDB Account. |
| <a name="output_primary_readonly_key"></a> [primary\_readonly\_key](#output\_primary\_readonly\_key) | The Primary read-only Key for the CosmosDB Account. |
| <a name="output_read_endpoints"></a> [read\_endpoints](#output\_read\_endpoints) | A list of read endpoints available for this CosmosDB account. |
| <a name="output_secondary_key"></a> [secondary\_key](#output\_secondary\_key) | The Secondary key for the CosmosDB Account. |
| <a name="output_secondary_readonly_key"></a> [secondary\_readonly\_key](#output\_secondary\_readonly\_key) | The Secondary read-only key for the CosmosDB Account. |
| <a name="output_write_endpoints"></a> [write\_endpoints](#output\_write\_endpoints) | A list of write endpoints available for this CosmosDB account. |

## Module Usage
```
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

## Cosmosdb Account : Terraform
* Please refer this link to understand more about Cosmosdb Account configurations through terraform: [Cosmosdb_Account_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#example-usage)
<!-- END_TF_DOCS -->