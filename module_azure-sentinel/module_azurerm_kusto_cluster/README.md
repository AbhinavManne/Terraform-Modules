<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 20/10/2022
# <u> Introduction </u>
* This module provides the facility to provision Azure data explorer. In this module we have included all possible argument for Azure data explorer.
## File Structure 
This particular module is having the following configuration files.
- kusto_cluster.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_kusto_attached_database_configuration.kusto_attached_database_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_attached_database_configuration) | resource |
| [azurerm_kusto_cluster.kusto_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster) | resource |
| [azurerm_kusto_cluster_customer_managed_key.kusto_cluster_customer_managed_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster_customer_managed_key) | resource |
| [azurerm_kusto_cluster_managed_private_endpoint.kusto_cluster_managed_private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster_managed_private_endpoint) | resource |
| [azurerm_kusto_cluster_principal_assignment.Kusto_cluster_Principal_Assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_cluster_principal_assignment) | resource |
| [azurerm_kusto_database.kusto_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database) | resource |
| [azurerm_kusto_database_principal_assignment.kusto_database_principal_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kusto_database_principal_assignment) | resource |
| [azurerm_client_config.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Kusto_cluster_Principal_Assignment"></a> [Kusto\_cluster\_Principal\_Assignment](#input\_Kusto\_cluster\_Principal\_Assignment) | The name of the Kusto cluster principal assignment. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_allowed_fqdns"></a> [allowed\_fqdns](#input\_allowed\_fqdns) | List of allowed FQDNs(Fully Qualified Domain Name) for egress from Cluster. | `list(string)` | `null` | no |
| <a name="input_allowed_ip_ranges"></a> [allowed\_ip\_ranges](#input\_allowed\_ip\_ranges) | The list of ips in the format of CIDR allowed to connect to the cluster. | `list(string)` | `null` | no |
| <a name="input_auto_stop_enabled"></a> [auto\_stop\_enabled](#input\_auto\_stop\_enabled) | Specifies if the cluster could be automatically stopped (due to lack of data or no activity for many days). | `bool` | `false` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Specifies the node count for the cluster. Boundaries depend on the SKU name. | `number` | n/a | yes |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The resource id of the cluster where the databases you would like to attach reside. | `string` | n/a | yes |
| <a name="input_data_management_public_ip_id"></a> [data\_management\_public\_ip\_id](#input\_data\_management\_public\_ip\_id) | Data management's service public IP address resource id. | `string` | `null` | no |
| <a name="input_disk_encryption_enabled"></a> [disk\_encryption\_enabled](#input\_disk\_encryption\_enabled) | Specifies if the cluster's disks are encrypted. | `bool` | `false` | no |
| <a name="input_double_encryption_enabled"></a> [double\_encryption\_enabled](#input\_double\_encryption\_enabled) | Is the cluster's double encryption enabled? | `bool` | `false` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The engine type that will be used in the backend. Possible values are V2 and V3 | `string` | `"V2"` | no |
| <a name="input_engine_public_ip_id"></a> [engine\_public\_ip\_id](#input\_engine\_public\_ip\_id) | Engine service's public IP address resource id. | `string` | `null` | no |
| <a name="input_external_tables_to_exclude"></a> [external\_tables\_to\_exclude](#input\_external\_tables\_to\_exclude) | List of external tables exclude from the follower database. | `list(string)` | `null` | no |
| <a name="input_external_tables_to_include"></a> [external\_tables\_to\_include](#input\_external\_tables\_to\_include) | List of external tables to include in the follower database. | `list(string)` | `null` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The group id in which the managed private endpoint is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_hot_cache_period"></a> [hot\_cache\_period](#input\_hot\_cache\_period) | The time the data that should be kept in cache for fast queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan | `string` | `null` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kusto Cluster. | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Specifies the type of Managed Service Identity that is configured on this Kusto Cluster. Possible values are: SystemAssigned, UserAssigned and SystemAssigned,UserAssigned | `string` | `"SystemAssigned"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The name of Key Vault Key | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_key_version"></a> [key\_version](#input\_key\_version) | The version of Key Vault Key. | `number` | n/a | yes |
| <a name="input_kusto_attached_database_configuration"></a> [kusto\_attached\_database\_configuration](#input\_kusto\_attached\_database\_configuration) | The name of the Kusto Attached Database Configuration to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_kusto_cluster"></a> [kusto\_cluster](#input\_kusto\_cluster) | Name of of Data Explorer | `string` | n/a | yes |
| <a name="input_kusto_cluster_managed_private_endpoint"></a> [kusto\_cluster\_managed\_private\_endpoint](#input\_kusto\_cluster\_managed\_private\_endpoint) | The name of the Managed Private Endpoints to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_kusto_database"></a> [kusto\_database](#input\_kusto\_database) | The name of the Kusto Database to create. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_kusto_database_principal_assignment"></a> [kusto\_database\_principal\_assignment](#input\_kusto\_database\_principal\_assignment) | name of kusto database principal assignment | `string` | n/a | yes |
| <a name="input_language_extensions"></a> [language\_extensions](#input\_language\_extensions) | A list of language\_extensions to enable. Valid values are: PYTHON and R. | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location for the Data Explorer | `string` | n/a | yes |
| <a name="input_materialized_views_to_exclude"></a> [materialized\_views\_to\_exclude](#input\_materialized\_views\_to\_exclude) | List of materialized views exclude from the follower database. | `list(string)` | `null` | no |
| <a name="input_materialized_views_to_include"></a> [materialized\_views\_to\_include](#input\_materialized\_views\_to\_include) | List of materialized views to include in the follower database. | `list(string)` | `null` | no |
| <a name="input_maximum_instances"></a> [maximum\_instances](#input\_maximum\_instances) | The maximum number of allowed instances. Must between 0 and 1000. | `number` | `5` | no |
| <a name="input_minimum_instances"></a> [minimum\_instances](#input\_minimum\_instances) | The minimum number of allowed instances. Must between 0 and 1000. | `number` | `1` | no |
| <a name="input_optimized_auto_scale"></a> [optimized\_auto\_scale](#input\_optimized\_auto\_scale) | Whether to enable optimized auto scale | `bool` | `false` | no |
| <a name="input_outbound_network_access_restricted"></a> [outbound\_network\_access\_restricted](#input\_outbound\_network\_access\_restricted) | Whether to restrict outbound network access | `bool` | `false` | no |
| <a name="input_principal_type"></a> [principal\_type](#input\_principal\_type) | The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_link_resource_id"></a> [private\_link\_resource\_id](#input\_private\_link\_resource\_id) | The ARM resource ID of the resource for which the managed private endpoint is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_link_resource_region"></a> [private\_link\_resource\_region](#input\_private\_link\_resource\_region) | The region of the resource to which the managed private endpoint is created. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_public_ip_type"></a> [public\_ip\_type](#input\_public\_ip\_type) | Indicates what public IP type to create - IPv4 (default), or DualStack (both IPv4 and IPv6). | `string` | `"IPv4"` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Is the public network access enabled? | `bool` | `false` | no |
| <a name="input_purge_enabled"></a> [purge\_enabled](#input\_purge\_enabled) | Specifies if the purge operations are enabled | `bool` | `false` | no |
| <a name="input_request_message"></a> [request\_message](#input\_request\_message) | The user request message. | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group for the Data Explorer | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_role1"></a> [role1](#input\_role1) | The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The name of the SKU | `string` | n/a | yes |
| <a name="input_soft_delete_period"></a> [soft\_delete\_period](#input\_soft\_delete\_period) | The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan | `string` | `null` | no |
| <a name="input_streaming_ingestion_enabled"></a> [streaming\_ingestion\_enabled](#input\_streaming\_ingestion\_enabled) | Specifies if the streaming ingest is enabled. | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet resource id | `string` | `null` | no |
| <a name="input_tables_to_exclude"></a> [tables\_to\_exclude](#input\_tables\_to\_exclude) | List of tables to exclude from the follower database. | `list(string)` | `null` | no |
| <a name="input_tables_to_include"></a> [tables\_to\_include](#input\_tables\_to\_include) | List of tables to include in the follower database. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources | `map(any)` | n/a | yes |
| <a name="input_trusted_external_tenants"></a> [trusted\_external\_tenants](#input\_trusted\_external\_tenants) | Specifies a list of tenant IDs that are trusted by the cluster. Default setting trusts all other tenants. Use trusted\_external\_tenants = ['*'] to explicitly allow all other tenants, trusted\_external\_tenants = ['MyTenantOnly'] for only your tenant or trusted\_external\_tenants = [<tenantId1>, <tenantIdx>] to allow specific other tenants. | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_user_identity"></a> [user\_identity](#input\_user\_identity) | The user assigned identity that has access to the Key Vault Key. If not specified, system assigned identity will be used. | `string` | `null` | no |
| <a name="input_virtual_network_configuration"></a> [virtual\_network\_configuration](#input\_virtual\_network\_configuration) | Whether to enable virtual network configuration | `bool` | `false` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Kusto Cluster should be located. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Kusto_cluster_Principal_Assignment_id"></a> [Kusto\_cluster\_Principal\_Assignment\_id](#output\_Kusto\_cluster\_Principal\_Assignment\_id) | ID of the created Kusto\_cluster\_Principal\_Assignment |
| <a name="output_kusto_attached_database_configuration_id"></a> [kusto\_attached\_database\_configuration\_id](#output\_kusto\_attached\_database\_configuration\_id) | ID of the created kusto\_attached\_database\_configuration |
| <a name="output_kusto_cluster_customer_managed_key_id"></a> [kusto\_cluster\_customer\_managed\_key\_id](#output\_kusto\_cluster\_customer\_managed\_key\_id) | ID of the created kusto\_cluster\_customer\_managed\_key |
| <a name="output_kusto_cluster_id"></a> [kusto\_cluster\_id](#output\_kusto\_cluster\_id) | ID of the created Data Explorer |
| <a name="output_kusto_cluster_managed_private_endpoint_id"></a> [kusto\_cluster\_managed\_private\_endpoint\_id](#output\_kusto\_cluster\_managed\_private\_endpoint\_id) | ID of the created kusto\_cluster\_managed\_private\_endpoint |
| <a name="output_kusto_database_id"></a> [kusto\_database\_id](#output\_kusto\_database\_id) | ID of the created kusto database |
| <a name="output_kusto_database_principal_assignment_id"></a> [kusto\_database\_principal\_assignment\_id](#output\_kusto\_database\_principal\_assignment\_id) | ID of the created kusto\_database\_principal\_assignment |
## module usage

```
module "kusto_cluster" {
  source = "../../modules/module_azurerm_kusto_cluster"

  kusto_cluster                         = var.kusto_cluster
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  sku_name                              = var.sku_name
  allowed_ip_ranges                     = var.allowed_ip_ranges
  double_encryption_enabled             = var.double_encryption_enabled
  identity_ids                          = var.identity_ids
  identity_type                         = var.identity_type
  auto_stop_enabled                     = var.auto_stop_enabled
  disk_encryption_enabled               = var.disk_encryption_enabled
  streaming_ingestion_enabled           = var.streaming_ingestion_enabled
  public_ip_type                        = var.public_ip_type
  public_network_access_enabled         = var.public_network_access_enabled
  outbound_network_access_restricted    = var.outbound_network_access_restricted
  purge_enabled                         = var.purge_enabled
  virtual_network_configuration         = var.virtual_network_configuration
  subnet_id                             = var.subnet_id
  engine_public_ip_id                   = var.engine_public_ip_id
  data_management_public_ip_id          = var.data_management_public_ip_id
  language_extensions                   = var.language_extensions
  optimized_auto_scale                  = var.optimized_auto_scale
  minimum_instances                     = var.minimum_instances
  maximum_instances                     = var.maximum_instances
  trusted_external_tenants              = var.trusted_external_tenants
  zones                                 = var.zones
  engine                                = var.engine
  capacity                              = var.capacity
  tags                                  = var.tags
  kusto_database                        = var.kusto_database
  hot_cache_period                      = var.hot_cache_period
  soft_delete_period                    = var.soft_delete_period
  kusto_attached_database_configuration = var.kusto_attached_database_configuration
  cluster_resource_id                   = data.azurerm_kusto_cluster_id.cluster_resource_id
  external_tables_to_exclude             = var.external_tables_to_exclude
  external_tables_to_include             = var.external_tables_to_include
  materialized_views_to_exclude          = var.materialized_views_to_exclude
  materialized_views_to_include          = var.materialized_views_to_include
  tables_to_exclude                      = var.tables_to_exclude
  tables_to_include                      = var.tables_to_include
  cluster_id                             = var.cluster_id
  key_vault_id                           = var.key_vault_id
  key_name                               = var.key_name
  key_version                            = var.key_version
  user_identity                          = var.user_identity
  kusto_cluster_managed_private_endpoint = var.kusto_cluster_managed_private_endpoint

  private_link_resource_id           = var.private_link_resource_id
  private_link_resource_region       = var.private_link_resource_region
  group_id                           = var.group_id
  request_message                    = var.request_message
  Kusto_cluster_Principal_Assignment = var.Kusto_cluster_Principal_Assignment



  #tenant_id                          = var.tenant_id
  #principal_id                       = var.principal_id
  principal_type                      = var.principal_type
  role                                = var.role
  kusto_database_principal_assignment = var.kusto_database_principal_assignment
  role1                               = var.role1
}


```
<!-- END_TF_DOCS -->