<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/10/2022
##  Introduction 
This module helps us to provision Mariadb Database along with the following resources-
* Mariadb Server
* Mariadb Configuration
* Mariadb Firewall Rule
* Maria db Virtual Network Rule

## File Structure 
This particular module is having the following configuration files.
- maria_db.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in maria_db.tf
- output.tf : This file will be having the resource output details generated.

## Pre-requisites
* To run Mariadb Module, following values should be provided-</br>
  - Resource Group Name, Location
  - Subnet ID 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.28.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_mariadb_configuration.mariadb_configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_configuration) | resource |
| [azurerm_mariadb_database.mariadb_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_database) | resource |
| [azurerm_mariadb_firewall_rule.mariadb_fr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_firewall_rule) | resource |
| [azurerm_mariadb_server.mariadb_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_server) | resource |
| [azurerm_mariadb_virtual_network_rule.mariadb_vnetrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_virtual_network_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_mariadb_configuration_settings"></a> [mariadb\_configuration\_settings](#input\_mariadb\_configuration\_settings) | (Required) MariaDB Server Configuration details | `map(any)` | n/a | yes |
| <a name="input_mariadb_database_settings"></a> [mariadb\_database\_settings](#input\_mariadb\_database\_settings) | (Required) MariaDB Database details | `map(any)` | n/a | yes |
| <a name="input_mariadb_firewall_rules"></a> [mariadb\_firewall\_rules](#input\_mariadb\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>map(object({<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | n/a | yes |
| <a name="input_mariadb_server_administrator_login"></a> [mariadb\_server\_administrator\_login](#input\_mariadb\_server\_administrator\_login) | The Administrator Login for the MariaDB Server | `string` | n/a | yes |
| <a name="input_mariadb_server_administrator_login_password"></a> [mariadb\_server\_administrator\_login\_password](#input\_mariadb\_server\_administrator\_login\_password) | The Password associated with the administrator\_login for the MariaDB Server | `string` | n/a | yes |
| <a name="input_mariadb_server_auto_grow_enabled"></a> [mariadb\_server\_auto\_grow\_enabled](#input\_mariadb\_server\_auto\_grow\_enabled) | Enable/Disable auto-growing of the storage | `bool` | `true` | no |
| <a name="input_mariadb_server_backup_retention_days"></a> [mariadb\_server\_backup\_retention\_days](#input\_mariadb\_server\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days | `number` | `7` | no |
| <a name="input_mariadb_server_create_mode"></a> [mariadb\_server\_create\_mode](#input\_mariadb\_server\_create\_mode) | The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default. | `string` | `"Default"` | no |
| <a name="input_mariadb_server_creation_source_server_id"></a> [mariadb\_server\_creation\_source\_server\_id](#input\_mariadb\_server\_creation\_source\_server\_id) | For creation modes other than Default, the source server ID to use. | `string` | `null` | no |
| <a name="input_mariadb_server_geo_redundant_backup_enabled"></a> [mariadb\_server\_geo\_redundant\_backup\_enabled](#input\_mariadb\_server\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off. It will not work with Basic tier. Works with GP\_Gen5\_2 #GP: General Purpose | `bool` | `false` | no |
| <a name="input_mariadb_server_name"></a> [mariadb\_server\_name](#input\_mariadb\_server\_name) | Name of the MariaDB Server | `string` | n/a | yes |
| <a name="input_mariadb_server_public_network_access_enabled"></a> [mariadb\_server\_public\_network\_access\_enabled](#input\_mariadb\_server\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server | `bool` | `true` | no |
| <a name="input_mariadb_server_restore_point_in_time"></a> [mariadb\_server\_restore\_point\_in\_time](#input\_mariadb\_server\_restore\_point\_in\_time) | When create\_mode is PointInTimeRestore, specifies the point in time to restore from creation\_source\_server\_id. | `string` | `null` | no |
| <a name="input_mariadb_server_sku_name"></a> [mariadb\_server\_sku\_name](#input\_mariadb\_server\_sku\_name) | Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B\_Gen4\_1, GP\_Gen5\_8). | `string` | n/a | yes |
| <a name="input_mariadb_server_ssl_enforcement_enabled"></a> [mariadb\_server\_ssl\_enforcement\_enabled](#input\_mariadb\_server\_ssl\_enforcement\_enabled) | Specifies if SSL should be enforced on connections | `bool` | n/a | yes |
| <a name="input_mariadb_server_storage_mb"></a> [mariadb\_server\_storage\_mb](#input\_mariadb\_server\_storage\_mb) | Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs. | `number` | n/a | yes |
| <a name="input_mariadb_server_version"></a> [mariadb\_server\_version](#input\_mariadb\_server\_version) | Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. | `string` | n/a | yes |
| <a name="input_mariadb_virtual_network_rule"></a> [mariadb\_virtual\_network\_rule](#input\_mariadb\_virtual\_network\_rule) | Name of the MariaDB Virtual Network Rule | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mariadb_configuration_id"></a> [mariadb\_configuration\_id](#output\_mariadb\_configuration\_id) | The ID of the MariaDB Configuration. |
| <a name="output_mariadb_firewall_id"></a> [mariadb\_firewall\_id](#output\_mariadb\_firewall\_id) | The ID of the MariaDB Firewall Rule. |
| <a name="output_mariadb_id"></a> [mariadb\_id](#output\_mariadb\_id) | ID of the Maria DB |
| <a name="output_mariadb_server_id"></a> [mariadb\_server\_id](#output\_mariadb\_server\_id) | ID of the MariaDB Server |
| <a name="output_mariadb_vnetrule_id"></a> [mariadb\_vnetrule\_id](#output\_mariadb\_vnetrule\_id) | The ID of the MariaDB Virtual Network Rule. |

## Module Usage
```
#kEYVAULT SECRET DATA SOURCE FOR ADMIN LOGIN AND PASSWORD
data "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  key_vault_id = var.keyvault_id
}

#Reference to MariaDB Server Database module
module "maria_db" {
  source              = "../../modules/module_mariadb-server-database/maria_db_module"
  resource_group_name = var.resource_group_name
  location            = var.location
  //MARIA DB SERVER
  mariadb_server_name                          = var.mariadb_server_name
  mariadb_server_sku_name                      = var.mariadb_server_sku_name
  mariadb_server_version                       = var.mariadb_server_version
  mariadb_server_administrator_login           = data.azurerm_key_vault_secret.secret.name//var.mariadb_server_administrator_login
  mariadb_server_administrator_login_password  = data.azurerm_key_vault_secret.secret.value//var.mariadb_server_administrator_login_password
  mariadb_server_auto_grow_enabled             = var.mariadb_server_auto_grow_enabled
  mariadb_server_backup_retention_days         = var.mariadb_server_backup_retention_days
  mariadb_server_create_mode                   = var.mariadb_server_create_mode
  mariadb_server_creation_source_server_id     = var.mariadb_server_creation_source_server_id
  mariadb_server_geo_redundant_backup_enabled  = var.mariadb_server_geo_redundant_backup_enabled
  mariadb_server_public_network_access_enabled = var.mariadb_server_public_network_access_enabled
  mariadb_server_restore_point_in_time         = var.mariadb_server_restore_point_in_time
  mariadb_server_ssl_enforcement_enabled       = var.mariadb_server_ssl_enforcement_enabled
  mariadb_server_storage_mb                    = var.mariadb_server_storage_mb
  tags                                         = var.tags
  //MARIA DB 
  mariadb_database_settings = var.mariadb_database_settings
  //MARIA DB CONFIGURATIONS
  mariadb_configuration_settings = var.mariadb_configuration_settings
  //MARIA DB FIREWALL
  mariadb_firewall_rules = var.mariadb_firewall_rules
  //MARIA DB VNET RULE
  mariadb_virtual_network_rule = var.mariadb_virtual_network_rule
  subnet_id                    = var.subnet_id
}

#Reference to module that provisions private endpoint
// By default this module is optional
module "PrivateEndpointSql_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.maria_db.mariadb_server_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}

#Reference to module that provisions alerts resources
module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.maria_db.mariadb_server_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = var.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

#Reference to module that provisions diagnostic resources
module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.maria_db.mariadb_server_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}
```

## Points to be noted
* You need subnet ID for Mariadb Vnet Rule resource. Make sure to add  ["Microsoft.Sql"] service endpoint while creating subnet.
* To enable private endpoint, give subresource name ["mariadbServer"].
* In azure mariadb firewall rule resource, the Azure feature "Allow access to Azure services" can be enabled by setting start_ip_address and end_ip_address to 0.0.0.0
* In Mariadb server resource, storage_mb argument - Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs.


## Mariadb Database : MSDOC
* Please refer this link to explore more about Mariadb Database: [Mariadb_Database](https://docs.microsoft.com/en-us/azure/mariadb/overview)

## Mariadb Database : Terraform
* Please refer this link to understand more about Mariadb Database configurations through terraform: [Mariadb_Database_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mariadb_server)

<!-- END_TF_DOCS -->