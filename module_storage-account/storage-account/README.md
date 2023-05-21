
<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 19/08/2022
## Introduction

This module helps us to provision storage account along with the following resources:

* Storage Account Network Rules
* Storage Encryption Scope
* Advanced Threat Protection

## File Structure 

This particular module is having the following configuration files.
- storage.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in storage.tf
- Output.tf : This file will be having the resource output details generated.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.16.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_advanced_threat_protection.atp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/advanced_threat_protection) | resource |
| [azurerm_storage_account.sa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.storacc_nr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_storage_encryption_scope.scope](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_encryption_scope) | resource |
| [random_string.unique](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | It defines the access tier for the storage account i.e., Hot,Cool | `string` | "Hot" | yes |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Defines the kind of Storage Account possible values are: BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2 | `string` | `"StorageV2"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account (Standard or Premium). | `string` | n/a | yes |
| <a name="input_allow_nested_items_to_be_public"></a> [allow\_nested\_items\_to\_be\_public](#input\_allow\_nested\_items\_to\_be\_public) | Allow or disallow nested items within this Account to opt into being public | `bool` | `true` | no |
| <a name="input_blob_properties_allowed_headers"></a> [blob\_properties\_allowed\_headers](#input\_blob\_properties\_allowed\_headers) | list of headers that are allowed to be a part of the cross-origin request | `list(string)` | n/a | yes |
| <a name="input_blob_properties_allowed_methods"></a> [blob\_properties\_allowed\_methods](#input\_blob\_properties\_allowed\_methods) | list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH. | `list(string)` | n/a | yes |
| <a name="input_blob_properties_allowed_origins"></a> [blob\_properties\_allowed\_origins](#input\_blob\_properties\_allowed\_origins) | list of origin domains that will be allowed by CORS | `list(string)` | n/a | yes |
| <a name="input_blob_properties_exposed_headers"></a> [blob\_properties\_exposed\_headers](#input\_blob\_properties\_exposed\_headers) | list of response headers that are exposed to CORS clients | `list(string)` | n/a | yes |
| <a name="input_blob_properties_max_age_in_seconds"></a> [blob\_properties\_max\_age\_in\_seconds](#input\_blob\_properties\_max\_age\_in\_seconds) | number of seconds the client should cache a preflight response | `number` | n/a | yes |
| <a name="input_blob_soft_delete_retention_days"></a> [blob\_soft\_delete\_retention\_days](#input\_blob\_soft\_delete\_retention\_days) | Retention days for deleted blob. Valid value is between 1 and 365 (set to 0 to disable). | `number` | `7` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None | `list(string)` | <pre>[<br>  "None"<br>]</pre> | no |
| <a name="input_change_feed_enabled"></a> [change\_feed\_enabled](#input\_change\_feed\_enabled) | to enable blob service properties for change feed events | `bool` | `false` | no |
| <a name="input_change_feed_retention_in_days"></a> [change\_feed\_retention\_in\_days](#input\_change\_feed\_retention\_in\_days) | The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years). | `number` | `7` | no |
| <a name="input_channel_encryption_type"></a> [channel\_encryption\_type](#input\_channel\_encryption\_type) | A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM | `string` | `"AES-256-GCM"` | no |
| <a name="input_container_soft_delete_retention_days"></a> [container\_soft\_delete\_retention\_days](#input\_container\_soft\_delete\_retention\_days) | Specifies the number of days that the blob should be retained, between `1` and `365` days. Defaults to `7` | `number` | `7` | no |
| <a name="input_cross_tenant_replication_enabled"></a> [cross\_tenant\_replication\_enabled](#input\_cross\_tenant\_replication\_enabled) | For enabling cross Tenant replication | `bool` | `true` | no |
| <a name="input_custom_domain_name"></a> [custom\_domain\_name](#input\_custom\_domain\_name) | The Custom Domain Name to use for the Storage Account | `string` | n/a | yes |
| <a name="input_default_service_version"></a> [default\_service\_version](#input\_default\_service\_version) | service version | `string` | `"2020-06-12"` | no |
| <a name="input_directory_type"></a> [directory\_type](#input\_directory\_type) | Specifies the directory service used. Possible values are AADDS and AD | `string` | n/a | yes |
| <a name="input_domain_guid"></a> [domain\_guid](#input\_domain\_guid) | Specifies the domain GUID | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Specifies the primary domain that the AD DNS server is authoritative for | `string` | n/a | yes |
| <a name="input_domain_sid"></a> [domain\_sid](#input\_domain\_sid) | Specifies the security identifier (SID) | `string` | n/a | yes |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Storage Account should exist | `string` | `null` | no |
| <a name="input_enable_advanced_threat_protection"></a> [enable\_advanced\_threat\_protection](#input\_enable\_advanced\_threat\_protection) | to enable threat protection | `bool` | n/a | yes |
| <a name="input_enable_blob_properties"></a> [enable\_blob\_properties](#input\_enable\_blob\_properties) | to enable blob properties | `bool` | n/a | yes |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Enabling this will force HTTPS traffic only | `bool` | `true` | no |
| <a name="input_enable_routing"></a> [enable\_routing](#input\_enable\_routing) | to enable routing | `bool` | n/a | yes |
| <a name="input_enable_share_properties"></a> [enable\_share\_properties](#input\_enable\_share\_properties) | To enable share properties block | `bool` | n/a | yes |
| <a name="input_enable_static_website"></a> [enable\_static\_website](#input\_enable\_static\_website) | to enable static website | `bool` | `null` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | to enable versioning | `bool` | `false` | no |
| <a name="input_encryption_scopes"></a> [encryption\_scopes](#input\_encryption\_scopes) | Encryption scopes, keys are scope names. more info https://docs.microsoft.com/en-us/azure/storage/common/infrastructure-encryption-enable?tabs=portal | <pre>map(object({<br>    enable_infrastructure_encryption = bool<br>    source_encryption                = string<br>  }))</pre> | n/a | yes |
| <a name="input_endpoint_resource_id"></a> [endpoint\_resource\_id](#input\_endpoint\_resource\_id) | The resource id of the resource access rule to be granted access | `string` | n/a | yes |
| <a name="input_endpoint_tenant_id"></a> [endpoint\_tenant\_id](#input\_endpoint\_tenant\_id) | he tenant id of the resource of the resource access rule to be granted access | `string` | `null` | no |
| <a name="input_forest_name"></a> [forest\_name](#input\_forest\_name) | Specifies the Active Directory forest | `string` | n/a | yes |
| <a name="input_hour_metrics_enabled"></a> [hour\_metrics\_enabled](#input\_hour\_metrics\_enabled) | Indicates whether minute metrics are enabled for the Queue service | `bool` | n/a | yes |
| <a name="input_hour_metrics_include_apis"></a> [hour\_metrics\_include\_apis](#input\_hour\_metrics\_include\_apis) | Indicates whether metrics should generate summary statistics for called API operations | `bool` | `null` | no |
| <a name="input_hour_metrics_retention_policy_days"></a> [hour\_metrics\_retention\_policy\_days](#input\_hour\_metrics\_retention\_policy\_days) | Specifies the number of days that logs will be retained | `number` | `null` | no |
| <a name="input_hour_metrics_version"></a> [hour\_metrics\_version](#input\_hour\_metrics\_version) | The version of storage analytics to configure | `string` | n/a | yes |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | List of public IP or IP ranges in CIDR Format. | `list(string)` | `null` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | to enable hierarchical namespace | `bool` | `null` | no |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The ID of the Key Vault Key | `string` | n/a | yes |
| <a name="input_large_file_share_enabled"></a> [large\_file\_share\_enabled](#input\_large\_file\_share\_enabled) | to enable large file share | `bool` | `false` | no |
| <a name="input_last_access_time_enabled"></a> [last\_access\_time\_enabled](#input\_last\_access\_time\_enabled) | to enable last access time based tracking | `bool` | `false` | no |
| <a name="input_length"></a> [length](#input\_length) | length of string | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_logging_delete"></a> [logging\_delete](#input\_logging\_delete) | Indicates whether all delete requests should be logged | `bool` | n/a | yes |
| <a name="input_logging_read"></a> [logging\_read](#input\_logging\_read) | Indicates whether all read requests should be logged | `bool` | n/a | yes |
| <a name="input_logging_retention_policy_days"></a> [logging\_retention\_policy\_days](#input\_logging\_retention\_policy\_days) | Specifies the number of days that logs will be retained | `number` | `null` | no |
| <a name="input_logging_version"></a> [logging\_version](#input\_logging\_version) | The version of storage analytics to configure | `string` | n/a | yes |
| <a name="input_logging_write"></a> [logging\_write](#input\_logging\_write) | Indicates whether all write requests should be logged | `bool` | n/a | yes |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | type of identity | `string` | `null` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. | `string` | `"TLS1_2"` | no |
| <a name="input_minute_metrics_enabled"></a> [minute\_metrics\_enabled](#input\_minute\_metrics\_enabled) | Indicates whether minute metrics are enabled for the Queue service | `bool` | n/a | yes |
| <a name="input_minute_metrics_include_apis"></a> [minute\_metrics\_include\_apis](#input\_minute\_metrics\_include\_apis) | Indicates whether metrics should generate summary statistics for called API operations | `bool` | `null` | no |
| <a name="input_minute_metrics_retention_policy_days"></a> [minute\_metrics\_retention\_policy\_days](#input\_minute\_metrics\_retention\_policy\_days) | Specifies the number of days that logs will be retained | `number` | `null` | no |
| <a name="input_minute_metrics_version"></a> [minute\_metrics\_version](#input\_minute\_metrics\_version) | The version of storage analytics to configure | `string` | n/a | yes |
| <a name="input_netbios_domain_name"></a> [netbios\_domain\_name](#input\_netbios\_domain\_name) | Specifies the NetBIOS domain name | `string` | n/a | yes |
| <a name="input_network_rule_default_action"></a> [network\_rule\_default\_action](#input\_network\_rule\_default\_action) | Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow | `string` | n/a | yes |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | to enable NFSv3 protocol | `bool` | `false` | no |
| <a name="input_publish_internet_endpoints"></a> [publish\_internet\_endpoints](#input\_publish\_internet\_endpoints) | to publish internet routing storage endpoints | `bool` | `false` | no |
| <a name="input_publish_microsoft_endpoints"></a> [publish\_microsoft\_endpoints](#input\_publish\_microsoft\_endpoints) | to publish Microsoft routing storage endpoints | `bool` | `false` | no |
| <a name="input_queue_properties_allowed_headers"></a> [queue\_properties\_allowed\_headers](#input\_queue\_properties\_allowed\_headers) | list of headers that are allowed to be a part of the cross-origin request | `list(string)` | n/a | yes |
| <a name="input_queue_properties_allowed_methods"></a> [queue\_properties\_allowed\_methods](#input\_queue\_properties\_allowed\_methods) | list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH. | `list(string)` | n/a | yes |
| <a name="input_queue_properties_allowed_origins"></a> [queue\_properties\_allowed\_origins](#input\_queue\_properties\_allowed\_origins) | list of origin domains that will be allowed by CORS | `list(string)` | n/a | yes |
| <a name="input_queue_properties_exposed_headers"></a> [queue\_properties\_exposed\_headers](#input\_queue\_properties\_exposed\_headers) | list of response headers that are exposed to CORS clients | `list(string)` | n/a | yes |
| <a name="input_queue_properties_max_age_in_seconds"></a> [queue\_properties\_max\_age\_in\_seconds](#input\_queue\_properties\_max\_age\_in\_seconds) | number of seconds the client should cache a preflight response | `number` | n/a | yes |
| <a name="input_replication_type"></a> [replication\_type](#input\_replication\_type) | Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_retention_policy_days"></a> [retention\_policy\_days](#input\_retention\_policy\_days) | Specifies the number of days that the azurerm\_storage\_share should be retained, between 1 and 365 days. | `number` | `7` | no |
| <a name="input_routing_choice"></a> [routing\_choice](#input\_routing\_choice) | Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting | `string` | `"MicrosoftRouting"` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | enable shared access key | `bool` | `true` | no |
| <a name="input_shared_properties_allowed_headers"></a> [shared\_properties\_allowed\_headers](#input\_shared\_properties\_allowed\_headers) | list of headers that are allowed to be a part of the cross-origin request | `list(string)` | n/a | yes |
| <a name="input_shared_properties_allowed_methods"></a> [shared\_properties\_allowed\_methods](#input\_shared\_properties\_allowed\_methods) | list of HTTP methods that are allowed to be executed by the origin. Options are: DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH. | `list(string)` | n/a | yes |
| <a name="input_shared_properties_allowed_origins"></a> [shared\_properties\_allowed\_origins](#input\_shared\_properties\_allowed\_origins) | list of origin domains that will be allowed by CORS | `list(string)` | n/a | yes |
| <a name="input_shared_properties_exposed_headers"></a> [shared\_properties\_exposed\_headers](#input\_shared\_properties\_exposed\_headers) | list of response headers that are exposed to CORS clients | `list(string)` | n/a | yes |
| <a name="input_shared_properties_max_age_in_sec"></a> [shared\_properties\_max\_age\_in\_sec](#input\_shared\_properties\_max\_age\_in\_sec) | number of seconds the client should cache a preflight response | `number` | n/a | yes |
| <a name="input_smb_authentication_types"></a> [smb\_authentication\_types](#input\_smb\_authentication\_types) | A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos | `string` | `"Kerberos"` | no |
| <a name="input_smb_kerberos_ticket_encryption_type"></a> [smb\_kerberos\_ticket\_encryption\_type](#input\_smb\_kerberos\_ticket\_encryption\_type) | A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256 | `string` | `"AES-256"` | no |
| <a name="input_smb_versions"></a> [smb\_versions](#input\_smb\_versions) | A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1 | `string` | `"SMB3.1.1"` | no |
| <a name="input_special"></a> [special](#input\_special) | special character | `any` | n/a | yes |
| <a name="input_static_website_error_doc"></a> [static\_website\_error\_doc](#input\_static\_website\_error\_doc) | webpage path to an non exixting file | `string` | `null` | no |
| <a name="input_static_website_index_document"></a> [static\_website\_index\_document](#input\_static\_website\_index\_document) | The webpage that Azure Storage serves for requests to the root of a website or any subfolder | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | n/a | yes |
| <a name="input_storage_sid"></a> [storage\_sid](#input\_storage\_sid) | Specifies the security identifier (SID) for Azure Storage | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | list of subnet IDs | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be applied to resources | `map(string)` | n/a | yes |
| <a name="input_upper"></a> [upper](#input\_upper) | uppercase alphabet character | `any` | n/a | yes |
| <a name="input_use_subdomain"></a> [use\_subdomain](#input\_use\_subdomain) | Should the Custom Domain Name be validated by using indirect CNAME validation? | `string` | `null` | no |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | The ID of a user assigned identity | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_id"></a> [storage\_id](#output\_storage\_id) | The name of the resource group in which resources are created |
| <a name="output_storage_primary_access_key"></a> [storage\_primary\_access\_key](#output\_storage\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_storage_primary_blob_connection_string"></a> [storage\_primary\_blob\_connection\_string](#output\_storage\_primary\_blob\_connection\_string) | The connection string associated with the primary blob location. |
| <a name="output_storage_primary_blob_endpoint"></a> [storage\_primary\_blob\_endpoint](#output\_storage\_primary\_blob\_endpoint) | The endpoint URL for blob storage in the primary location. |
| <a name="output_storage_primary_blob_host"></a> [storage\_primary\_blob\_host](#output\_storage\_primary\_blob\_host) | The hostname with port if applicable for blob storage in the primary location. |
| <a name="output_storage_primary_connection_string"></a> [storage\_primary\_connection\_string](#output\_storage\_primary\_connection\_string) | The connection string associated with the primary location. |
| <a name="output_storage_primary_dfs_endpoint"></a> [storage\_primary\_dfs\_endpoint](#output\_storage\_primary\_dfs\_endpoint) | The endpoint URL for DFS storage in the primary location. |
| <a name="output_storage_primary_dfs_host"></a> [storage\_primary\_dfs\_host](#output\_storage\_primary\_dfs\_host) | The hostname with port if applicable for DFS storage in the primary location. |
| <a name="output_storage_primary_file_endpoint"></a> [storage\_primary\_file\_endpoint](#output\_storage\_primary\_file\_endpoint) | The endpoint URL for file storage in the primary location. |
| <a name="output_storage_primary_file_host"></a> [storage\_primary\_file\_host](#output\_storage\_primary\_file\_host) | The hostname with port if applicable for file storage in the primary location. |
| <a name="output_storage_primary_location"></a> [storage\_primary\_location](#output\_storage\_primary\_location) | The primary location of the storage account. |
| <a name="output_storage_primary_queue_endpoint"></a> [storage\_primary\_queue\_endpoint](#output\_storage\_primary\_queue\_endpoint) | The endpoint URL for queue storage in the primary location. |
| <a name="output_storage_primary_queue_host"></a> [storage\_primary\_queue\_host](#output\_storage\_primary\_queue\_host) | The hostname with port if applicable for queue storage in the primary location. |
| <a name="output_storage_primary_table_endpoint "></a> [storage\_primary\_table\_endpoint ](#output\_storage\_primary\_table\_endpoint ) | The endpoint URL for table storage in the primary location. |
| <a name="output_storage_primary_table_host"></a> [storage\_primary\_table\_host](#output\_storage\_primary\_table\_host) | The hostname with port if applicable for table storage in the primary location. |
| <a name="output_storage_primary_web_endpoint"></a> [storage\_primary\_web\_endpoint](#output\_storage\_primary\_web\_endpoint) | The endpoint URL for web storage in the primary location. |
| <a name="output_storage_primary_web_host"></a> [storage\_primary\_web\_host](#output\_storage\_primary\_web\_host) | The hostname with port if applicable for web storage in the primary location. |
| <a name="output_storage_secondary_access_key"></a> [storage\_secondary\_access\_key](#output\_storage\_secondary\_access\_key) | The secondary access key for the storage account. |
| <a name="output_storage_secondary_blob_connection_string"></a> [storage\_secondary\_blob\_connection\_string](#output\_storage\_secondary\_blob\_connection\_string) | The connection string associated with the secondary blob location. |
| <a name="output_storage_secondary_blob_endpoint"></a> [storage\_secondary\_blob\_endpoint](#output\_storage\_secondary\_blob\_endpoint) | The endpoint URL for blob storage in the secondary location. |
| <a name="output_storage_secondary_blob_host"></a> [storage\_secondary\_blob\_host](#output\_storage\_secondary\_blob\_host) | The hostname with port if applicable for blob storage in the secondary location |
| <a name="output_storage_secondary_connection_string"></a> [storage\_secondary\_connection\_string](#output\_storage\_secondary\_connection\_string) | The connection string associated with the secondary location |
| <a name="output_storage_secondary_dfs_endpoint"></a> [storage\_secondary\_dfs\_endpoint](#output\_storage\_secondary\_dfs\_endpoint) | The endpoint URL for DFS storage in the secondary location. |
| <a name="output_storage_secondary_dfs_host"></a> [storage\_secondary\_dfs\_host](#output\_storage\_secondary\_dfs\_host) | The hostname with port if applicable for DFS storage in the secondary location. |
| <a name="output_storage_secondary_file_endpoint"></a> [storage\_secondary\_file\_endpoint](#output\_storage\_secondary\_file\_endpoint) | The endpoint URL for file storage in the secondary location. |
| <a name="output_storage_secondary_file_host"></a> [storage\_secondary\_file\_host](#output\_storage\_secondary\_file\_host) | The hostname with port if applicable for file storage in the secondary location. |
| <a name="output_storage_secondary_location"></a> [storage\_secondary\_location](#output\_storage\_secondary\_location) | The secondary location of the storage account. |
| <a name="output_storage_secondary_queue_endpoint"></a> [storage\_secondary\_queue\_endpoint](#output\_storage\_secondary\_queue\_endpoint) | The endpoint URL for queue storage in the secondary location. |
| <a name="output_storage_secondary_queue_host"></a> [storage\_secondary\_queue\_host](#output\_storage\_secondary\_queue\_host) | The hostname with port if applicable for queue storage in the secondary location. |
| <a name="output_storage_secondary_table_endpoint"></a> [storage\_secondary\_table\_endpoint](#output\_storage\_secondary\_table\_endpoint) | The endpoint URL for table storage in the secondary location. |
| <a name="output_storage_secondary_table_host"></a> [storage\_secondary\_table\_host](#output\_storage\_secondary\_table\_host) | The hostname with port if applicable for table storage in the secondary location. |
| <a name="output_storage_secondary_web_endpoint"></a> [storage\_secondary\_web\_endpoint](#output\_storage\_secondary\_web\_endpoint) | The endpoint URL for web storage in the secondary location |
| <a name="output_storage_secondary_web_host"></a> [storage\_secondary\_web\_host](#output\_storage\_secondary\_web\_host) | The hostname with port if applicable for web storage in the secondary location. |

## Module Usage
```
module "storageacc" {

  source = "../../modules/module_storage-account/storage-account"
  /*depends_on = [
    module.module_create_resource_group
  ]*/
  resource_group_name = module.module_create_resource_group.resource_group_name
  location            = module.module_create_resource_group.resource_group_location

  length  = var.length
  special = var.special
  upper   = var.upper

  storage_account_name             = var.storage_account_name
  account_tier                     = var.account_tier
  replication_type                 = var.replication_type
  min_tls_version                  = var.min_tls_version
  tags                             = var.tags
  account_kind                     = var.account_kind
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  access_tier                      = var.access_tier
  edge_zone                        = var.edge_zone
  enable_https_traffic_only        = var.enable_https_traffic_only
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  shared_access_key_enabled        = var.shared_access_key_enabled
  is_hns_enabled                   = var.is_hns_enabled
  nfsv3_enabled                    = var.nfsv3_enabled
  large_file_share_enabled         = var.large_file_share_enabled

  custom_domain_name = var.custom_domain_name
  use_subdomain      = var.use_subdomain

  key_vault_key_id          = var.key_vault_key_id
  user_assigned_identity_id = var.user_assigned_identity_id

  managed_identity_type = var.managed_identity_type

  enable_static_website         = var.enable_static_website
  static_website_index_document = var.static_website_index_document
  static_website_error_doc      = var.static_website_error_doc

  enable_share_properties = var.enable_share_properties

  shared_properties_allowed_headers = var.shared_properties_allowed_headers
  shared_properties_allowed_methods = var.blob_properties_allowed_methods
  shared_properties_allowed_origins = var.shared_properties_allowed_origins
  shared_properties_exposed_headers = var.shared_properties_exposed_headers
  shared_properties_max_age_in_sec  = var.shared_properties_max_age_in_sec

  retention_policy_days = var.retention_policy_days

  smb_versions                        = var.smb_versions
  smb_authentication_types            = var.smb_authentication_types
  smb_kerberos_ticket_encryption_type = var.smb_kerberos_ticket_encryption_type
  channel_encryption_type             = var.channel_encryption_type

  directory_type = var.directory_type

  storage_sid         = var.storage_sid
  domain_name         = var.domain_name
  domain_sid          = var.domain_sid
  domain_guid         = var.domain_guid
  forest_name         = var.forest_name
  netbios_domain_name = var.netbios_domain_name

  enable_routing              = var.enable_routing
  publish_internet_endpoints  = var.publish_internet_endpoints
  publish_microsoft_endpoints = var.publish_microsoft_endpoints
  routing_choice              = var.routing_choice

  enable_blob_properties        = var.enable_blob_properties
  enable_versioning             = var.enable_versioning
  last_access_time_enabled      = var.last_access_time_enabled
  change_feed_enabled           = var.change_feed_enabled
  change_feed_retention_in_days = var.change_feed_retention_in_days
  default_service_version       = var.default_service_version

  blob_properties_allowed_headers    = var.blob_properties_allowed_headers
  blob_properties_allowed_methods    = var.blob_properties_allowed_methods
  blob_properties_allowed_origins    = var.blob_properties_allowed_origins
  blob_properties_exposed_headers    = var.blob_properties_exposed_headers
  blob_properties_max_age_in_seconds = var.blob_properties_max_age_in_seconds

  blob_soft_delete_retention_days = var.blob_soft_delete_retention_days

  container_soft_delete_retention_days = var.container_soft_delete_retention_days

  queue_properties_allowed_headers    = var.queue_properties_allowed_headers
  queue_properties_allowed_methods    = var.queue_properties_allowed_methods
  queue_properties_allowed_origins    = var.queue_properties_allowed_origins
  queue_properties_exposed_headers    = var.queue_properties_exposed_headers
  queue_properties_max_age_in_seconds = var.queue_properties_max_age_in_seconds

  logging_delete                = var.logging_delete
  logging_read                  = var.logging_read
  logging_version               = var.logging_version
  logging_write                 = var.logging_write
  logging_retention_policy_days = var.logging_retention_policy_days

  minute_metrics_enabled               = var.minute_metrics_enabled
  minute_metrics_version               = var.minute_metrics_version
  minute_metrics_include_apis          = var.minute_metrics_include_apis
  minute_metrics_retention_policy_days = var.minute_metrics_retention_policy_days

  hour_metrics_enabled               = var.hour_metrics_enabled
  hour_metrics_version               = var.hour_metrics_version
  hour_metrics_include_apis          = var.hour_metrics_include_apis
  hour_metrics_retention_policy_days = var.hour_metrics_retention_policy_days

  network_rule_default_action = var.network_rule_default_action
  ip_rules                    = var.ip_rules
  subnet_id                   = var.subnet_id
  bypass                      = var.bypass

  endpoint_resource_id = var.endpoint_resource_id
  endpoint_tenant_id   = var.endpoint_tenant_id

  encryption_scopes = var.encryption_scopes

  enable_advanced_threat_protection = var.enable_advanced_threat_protection

}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "PrivateEndpoint_module" {
  count  = var.create_private-endpoint ? 1 : 0
  source = "../../modules/module_private_endpoint"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_id    = module.storageacc.storage_acc_id
  private_connection_resource_alias = var.private_connection_resource_alias
  subnet_id                         = var.subnet_id
}


module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = module.module_create_resource_group.resource_group_name
  resource_group_location  = module.module_create_resource_group.resource_group_location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.storageacc.storage_acc_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = module.storageacc.storage_acc_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}
```
<!-- END_TF_DOCS -->