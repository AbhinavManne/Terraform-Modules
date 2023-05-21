<!-- BEGIN_TF_DOCS -->
# <u> Introduction </u>
An Azure storage account contains all of your Azure Storage data objects, including blobs, file shares, queues, tables, and disks. The storage account provides a unique namespace for your Azure Storage data that's accessible from anywhere in the world over HTTP or HTTPS. Data in your storage account is durable and highly available, secure, and massively scalable.

Azure Blob Storage helps you create data lakes for your analytics needs and provides storage to build powerful cloud-native and mobile apps.

## <u> Resources supported are </u>:
* Storage Account
* Storage Container
* Storage Advanced Threat Protection
* Network Policies

## <u> Requirements </u>

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.10.0 |


# <u> Build and Test </u>

### Generic modules for all scenarios :-
   * Tagging 
        tags = {
            Contact_name     = "ABC"
            cost_centre      = "999"
            application_name = "Storage Account Container"
               }
   * Logging and Monitoring
        * Alert Rules
        * Diagnostic Settings
        * Action groups/rules 

   * RBAC
      * We can assign role at resource group level/resource level.


 # <u>Pre-requisites:</u>

In order to run this script successfully, below resources should be created prior to using this script :
 *  *** Resource Group *** The resource group collects metadata from each individual resource to facilitate more granular management than at the subscription level.


## <u> Modules </u>
Below are the modules used in this script.

Each module we will be having the following files.
- Main.tf : This file is having terraform code to create all the resources as per Landing zone requirements
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in main.tf
- Output.tf : (optional) This file will be having all the resource output details generated

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diag_monitoring"></a> [diag\_monitoring](#module\_diag\_monitoring) | ../../modules/module_storage-account/logging_and_monitoring | n/a |
| <a name="module_module_resource-role-assignment"></a> [module\_resource-role-assignment](#module\_module\_resource-role-assignment) | ../../modules/module_storage-account/rbac | n/a |
| <a name="module_storage"></a> [storage](#module\_storage) | ../../modules/module_storage-account/storage-account | n/a |

```
module "storage" {

  source = "../../modules/module_storage-container/storage-container"

  storage_account_name                 = var.storage_account_name
  location                             = var.location
  resource_group                       = var.resource_group
  tags                                 = var.tags
  account_tier                         = var.account_tier
  access_tier                          = var.access_tier
  replication_type                     = var.replication_type
  enable_large_file_share              = var.enable_large_file_share
  enable_hns                           = var.enable_hns
  enable_https_traffic_only            = var.enable_https_traffic_only
  min_tls_version                      = var.min_tls_version
  allow_blob_public_access             = var.allow_blob_public_access
  access_list                          = var.access_list
  service_endpoints                    = var.service_endpoints
  traffic_bypass                       = var.traffic_bypass
  blob_cors                            = var.blob_cors
  enable_static_website                = var.enable_static_website
  index_path                           = var.index_path
  custom_404_path                      = var.custom_404_path
  encryption_scopes                    = var.encryption_scopes
  nfsv3_enabled                        = var.nfsv3_enabled
  default_network_rule                 = var.default_network_rule
  shared_access_key_enabled            = var.shared_access_key_enabled
  create_resource_group                = var.create_resource_group
  skuname                              = var.skuname
  blob_soft_delete_retention_days      = var.blob_soft_delete_retention_days
  last_access_time_enabled             = var.last_access_time_enabled
  change_feed_enabled                  = var.change_feed_enabled
  network_rules                        = var.network_rules
  containers_list                      = var.containers_list
  enable_versioning                    = var.enable_versioning
  container_soft_delete_retention_days = var.container_soft_delete_retention_days

}

#---------module for logging and monitoring--------#
module "diag_monitoring" {
  source                  = "../../modules/module_storage-container/logging_and_monitoring"
  resource_group_name     = module.storage.resource_group
  resource_group_id       = module.storage.resource_group_id
  resource_group_location = module.storage.resource_group_location
  storage_account_id      = module.storage.storage_id
}

// --------Module for RBAC ----------------------//
module "module_resource-role-assignment" {
  source                  = "../../modules/module_storage-container/rbac"
  resource_group_name     = module.storage.resource_group
  resource_group_id       = module.storage.resource_group_id
  resource_group_location = module.storage.resource_group_location
  scope                   = module.storage.storage_id
  role_definition_name    = var.role_definition_name
}

```


## <u> Inputs </u>

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_list"></a> [access\_list](#input\_access\_list) | Map of CIDRs Storage Account access. | `map(string)` | `{}` | no |
| <a name="input_access_tier"></a> [access\_tier](#input\_access\_tier) | Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts | `string` | `"Hot"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Defines the Tier to use for this storage account (Standard or Premium). | `string` | `null` | no |
| <a name="input_allow_blob_public_access"></a> [allow\_blob\_public\_access](#input\_allow\_blob\_public\_access) | Allow or disallow public access to all blobs or containers in the storage account. | `bool` | `false` | no |
| <a name="input_blob_cors"></a> [blob\_cors](#input\_blob\_cors) | blob service cors rules:  https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#cors_rule | <pre>map(object({<br>    allowed_headers    = list(string)<br>    allowed_methods    = list(string)<br>    allowed_origins    = list(string)<br>    exposed_headers    = list(string)<br>    max_age_in_seconds = number<br>  }))</pre> | `null` | no |
| <a name="input_blob_soft_delete_retention_days"></a> [blob\_soft\_delete\_retention\_days](#input\_blob\_soft\_delete\_retention\_days) | Retention days for deleted blob. Valid value is between 1 and 365 (set to 0 to disable). | `number` | `7` | no |
| <a name="input_change_feed_enabled"></a> [change\_feed\_enabled](#input\_change\_feed\_enabled) | Is the blob service properties for change feed events enabled? | `bool` | `false` | no |
| <a name="input_container_soft_delete_retention_days"></a> [container\_soft\_delete\_retention\_days](#input\_container\_soft\_delete\_retention\_days) | Specifies the number of days that the blob should be retained, between `1` and `365` days. Defaults to `7` | `number` | `7` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | resource group creation | `string` | n/a | yes |
| <a name="input_custom_404_path"></a> [custom\_404\_path](#input\_custom\_404\_path) | path from your repo root to your custom 404 page | `string` | `null` | no |
| <a name="input_default_network_rule"></a> [default\_network\_rule](#input\_default\_network\_rule) | Specifies the default action of allow or deny when no other network rules match | `string` | `"Deny"` | no |
| <a name="input_enable_advanced_threat_protection"></a> [enable\_advanced\_threat\_protection](#input\_enable\_advanced\_threat\_protection) | threat protection | `string` | `true` | no |
| <a name="input_enable_hns"></a> [enable\_hns](#input\_enable\_hns) | Enable Hierarchical Namespace (can be used with Azure Data Lake Storage Gen 2). | `bool` | `false` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Forces HTTPS if enabled. | `bool` | `true` | no |
| <a name="input_enable_large_file_share"></a> [enable\_large\_file\_share](#input\_enable\_large\_file\_share) | Enable Large File Share. | `bool` | `false` | no |
| <a name="input_enable_static_website"></a> [enable\_static\_website](#input\_enable\_static\_website) | Controls if static website to be enabled on the storage account. Possible values are `true` or `false` | `bool` | `false` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | Is versioning enabled? Default to `false` | `bool` | `false` | no |
| <a name="input_encryption_scopes"></a> [encryption\_scopes](#input\_encryption\_scopes) | Encryption scopes, keys are scope names. more info https://docs.microsoft.com/en-us/azure/storage/common/infrastructure-encryption-enable?tabs=portal | <pre>map(object({<br>    enable_infrastructure_encryption = bool<br>  }))</pre> | `{}` | no |
| <a name="input_index_path"></a> [index\_path](#input\_index\_path) | path from your repo root to index.html | `string` | `null` | no |
| <a name="input_last_access_time_enabled"></a> [last\_access\_time\_enabled](#input\_last\_access\_time\_enabled) | Is the last access time based tracking enabled? Default to `false` | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location to MySQL server resource | `string` | n/a | yes |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The minimum supported TLS version for the storage account. | `string` | `"TLS1_2"` | no |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | Network rules restricing access to the storage account. | `object({ bypass = list(string), ip_rules = list(string), subnet_ids = list(string) })` | `null` | no |
| <a name="input_nfsv3_enabled"></a> [nfsv3\_enabled](#input\_nfsv3\_enabled) | Is NFSv3 protocol enabled? Changing this forces a new resource to be created | `bool` | `false` | no |
| <a name="input_replication_type"></a> [replication\_type](#input\_replication\_type) | Storage account replication type - i.e. LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | name of the resource group to create the resource | `string` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | List of Role Definitions | `list(string)` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Creates a virtual network rule in the subnet\_id (values are virtual network subnet ids). | `map(string)` | `{}` | no |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key | `bool` | `false` | no |
| <a name="input_skuname"></a> [skuname](#input\_skuname) | skuname for storage account | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to be applied to resources | `map(string)` | n/a | yes |
| <a name="input_template_deployment_name"></a> [template\_deployment\_name](#input\_template\_deployment\_name) | Name of deployment template | `string` | n/a | yes |
| <a name="input_traffic_bypass"></a> [traffic\_bypass](#input\_traffic\_bypass) | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None. | `list(string)` | <pre>[<br>  "None"<br>]</pre> | no |


## <u> Outputs </u>

| Name | Description |
|------|-------------|
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_primary_blob_connection_string"></a> [primary\_blob\_connection\_string](#output\_primary\_blob\_connection\_string) | The connection string associated with the primary blob location. |
| <a name="output_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#output\_primary\_blob\_endpoint) | The endpoint URL for blob storage in the primary location. |
| <a name="output_primary_blob_host"></a> [primary\_blob\_host](#output\_primary\_blob\_host) | The endpoint host for blob storage in the primary location. |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | The connection string associated with the primary location. |
| <a name="output_primary_dfs_endpoint"></a> [primary\_dfs\_endpoint](#output\_primary\_dfs\_endpoint) | The endpoint URL for DFS storage in the primary location. |
| <a name="output_primary_file_endpoint"></a> [primary\_file\_endpoint](#output\_primary\_file\_endpoint) | The endpoint URL for file storage in the primary location. |
| <a name="output_primary_queue_endpoint"></a> [primary\_queue\_endpoint](#output\_primary\_queue\_endpoint) | The endpoint URL for queue storage in the primary location. |
| <a name="output_primary_table_endpoint"></a> [primary\_table\_endpoint](#output\_primary\_table\_endpoint) | The endpoint URL for table storage in the primary location. |
| <a name="output_primary_web_endpoint"></a> [primary\_web\_endpoint](#output\_primary\_web\_endpoint) | The endpoint URL for web storage in the primary location. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The name of the resource group in which resources are created |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | n/a |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | The location of the resource group in which resources are created |
| <a name="output_sa"></a> [sa](#output\_sa) | The Storage Account object. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key for the storage account. |
| <a name="output_secondary_blob_connection_string"></a> [secondary\_blob\_connection\_string](#output\_secondary\_blob\_connection\_string) | The connection string associated with the secondary blob location. |
| <a name="output_secondary_blob_endpoint"></a> [secondary\_blob\_endpoint](#output\_secondary\_blob\_endpoint) | The endpoint URL for blob storage in the secondary location. |
| <a name="output_secondary_blob_host"></a> [secondary\_blob\_host](#output\_secondary\_blob\_host) | The endpoint host for blob storage in the secondary location. |
| <a name="output_secondary_connection_string"></a> [secondary\_connection\_string](#output\_secondary\_connection\_string) | The connection string associated with the secondary location. |
| <a name="output_secondary_dfs_endpoint"></a> [secondary\_dfs\_endpoint](#output\_secondary\_dfs\_endpoint) | The endpoint URL for DFS storage in the secondary location. |
| <a name="output_secondary_file_endpoint"></a> [secondary\_file\_endpoint](#output\_secondary\_file\_endpoint) | The endpoint URL for file storage in the secondary location. |
| <a name="output_secondary_queue_endpoint"></a> [secondary\_queue\_endpoint](#output\_secondary\_queue\_endpoint) | The endpoint URL for queue storage in the secondary location. |
| <a name="output_secondary_table_endpoint"></a> [secondary\_table\_endpoint](#output\_secondary\_table\_endpoint) | The endpoint URL for table storage in the secondary location. |
| <a name="output_secondary_web_endpoint"></a> [secondary\_web\_endpoint](#output\_secondary\_web\_endpoint) | The endpoint URL for web storage in the secondary location. |
| <a name="output_storage_id"></a> [storage\_id](#output\_storage\_id) | The ID of the Storage Account. |
| <a name="output_storage_name"></a> [storage\_name](#output\_storage\_name) | The name of the Storage Account. |
<!-- END_TF_DOCS -->

## <u> Commands to execute the terraform script: </u>
  * init         : Prepare your working directory for other commands
  * validate     : Check whether the configuration is valid
  * plan         : Show changes required by the current configuration
  * apply        : Create or update infrastructure
  * destroy      : Destroy previously-created infrastructure


## <u> Vulnerabilities discovered using tfsec:</u>

  * When using Queue Services for a storage account, logging should be enabled : Not Fixed

  This issue has been reported by the Terraform Github community and relates to the version of provider we no longer support.
  [Issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/4401)




## <u> Reference Documents:</u>
- [Terraform](https://registry.terraform.io/)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Microsoft docs](https://docs.microsoft.com/en-us/azure/storage/)
- [Azure Repos](https://dev.azure.com/eycloudtools/AzureLandingZone/_git/AzureLandingZone)

<!-- END_TF_DOCS -->