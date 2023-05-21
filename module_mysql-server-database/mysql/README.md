<!-- BEGIN_TF_DOCS -->
#### last updated : 07-09-2022

## Introduction
This module helps us to provision the :
MySQL Servers
MySQL Database
MySQL Configuration
MySQL Firewall Rules
MySQL Active Directory Administrator
MySQL Customer Managed Key
MySQL Virtual Network Rule

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.21.1 |


## Resources

| Name | Type |
|------|------|
| [azurerm_mysql_active_directory_administrator.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_active_directory_administrator) | resource |
| [azurerm_mysql_configuration.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_configuration) | resource |
| [azurerm_mysql_database.mysql_database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database) | resource |
| [azurerm_mysql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_firewall_rule) | resource |
| [azurerm_mysql_server.mysql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server) | resource |
| [azurerm_mysql_server_key.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server_key) | resource |
| [azurerm_mysql_virtual_network_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_virtual_network_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_admin_login_name"></a> [ad\_admin\_login\_name](#input\_ad\_admin\_login\_name) | The login name of the principal to set as the server administrator | `any` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the admin\_username user | `string` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The Administrator login for the MySQL Server. Required when create\_mode is Default | `string` | `null` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable/Disable auto-growing of the storage | `bool` | `true` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `null` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default` | `string` | `"Default"` | no |
| <a name="input_creation_source_server_id"></a> [creation\_source\_server\_id](#input\_creation\_source\_server\_id) | For creation modes other than Default, the source server ID to use. | `string` | `null` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>map(object({<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | n/a | yes |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off | `bool` | `false` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | Specifies the type of Managed Service Identity that should be configured on this MySQL Server. The only possible value is SystemAssigned. | `string` | `"SystemAssigned"` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Whether or not infrastructure is encrypted for this server | `bool` | `false` | no |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The URL to a Key Vault Key | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_mysql_configuration"></a> [mysql\_configuration](#input\_mysql\_configuration) | Sets a MySQL Configuration value on a MySQL Server | `map(string)` | `null` | no |
| <a name="input_mysql_database"></a> [mysql\_database](#input\_mysql\_database) | MYSQL database | `map(any)` | `null` | no |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | version of mysql | `string` | n/a | yes |
| <a name="input_mysqlserver_name"></a> [mysqlserver\_name](#input\_mysqlserver\_name) | MySQL server Name | `string` | n/a | yes |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The ID of the principal to set as the server administrator. For a managed identity this should be the Client ID of the identity. | `string` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | n/a | yes |
| <a name="input_restore_point_in_time"></a> [restore\_point\_in\_time](#input\_restore\_point\_in\_time) | When create\_mode is PointInTimeRestore, specifies the point in time to restore from creation\_source\_server\_id. | `string` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku name | `string` | n/a | yes |
| <a name="input_ssl_enforcement_enabled"></a> [ssl\_enforcement\_enabled](#input\_ssl\_enforcement\_enabled) | Specifies if SSL should be enforced on connections | `bool` | `false` | no |
| <a name="input_ssl_minimal_tls_version_enforced"></a> [ssl\_minimal\_tls\_version\_enforced](#input\_ssl\_minimal\_tls\_version\_enforced) | The minimum TLS version to support on the sever. | `string` | `"TLS1_2"` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | stoarge for mysql | `number` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | id of subnet | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Tenant ID | `string` | `null` | no |
| <a name="input_threat_detection_policy"></a> [threat\_detection\_policy](#input\_threat\_detection\_policy) | Threat detection policy configuration, known in the API as Server Security Alerts Policy. | <pre>object({<br>      enabled                    = bool<br>      disabled_alerts            = list(string)<br>      email_account_admins       = bool<br>      email_addresses            = list(string)<br>      retention_days             = number<br>      storage_account_access_key = string<br>      storage_endpoint           = string<br>})</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mysql_database_id"></a> [mysql\_database\_id](#output\_mysql\_database\_id) | The resource ID of the MySQL Database |
| <a name="output_mysql_server_fqdn"></a> [mysql\_server\_fqdn](#output\_mysql\_server\_fqdn) | The FQDN of the MySQL Server |
| <a name="output_mysql_server_id"></a> [mysql\_server\_id](#output\_mysql\_server\_id) | The resource ID of the MySQL Server |

## Module Usage 

```
module "mysql" {
  source                            = "../../modules/module_mysql-server-database/mysql"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  mysqlserver_name                  = var.mysqlserver_name
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  mysql_version                     = var.mysql_version
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  mysql_configuration               = var.mysql_configuration
  key_vault_key_id                  = var.key_vault_key_id
  threat_detection_policy           = var.threat_detection_policy
  ad_admin_login_name               = var.ad_admin_login_name
  firewall_rules                    = var.firewall_rules
  subnet_id                         = var.subnet_id
  restore_point_in_time             = var.restore_point_in_time
  creation_source_server_id         = var.creation_source_server_id

  tags = var.tags
}

```
<!-- END_TF_DOCS -->