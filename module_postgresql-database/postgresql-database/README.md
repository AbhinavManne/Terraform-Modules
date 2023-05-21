<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 30/08/2022

## Introduction

Azure Database for PostgreSQL Single Server is a fully managed database service with minimal requirements for customizations of database. The single server platform is designed to handle most of the database management functions such as patching, backups, high availability, security with minimal user configuration and control.

This module helps us to provision postgresql database along with the following resources:

* PostgreSQL Database
* PostgreSQL Configuration
* PostgreSQL Firewall Rules
* PostgreSQL Active Directory Administrator
* PostgreSQL Server Key
* PostgreSQL Virtual Network Rule

## File Structure 

This particular module is having the following configuration files.
- main.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in main.tf
- Outputs.tf : This file will be having the resource output details generated.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.19.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_active_directory_administrator.ad_administrator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_active_directory_administrator) | resource |
| [azurerm_postgresql_configuration.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_configuration) | resource |
| [azurerm_postgresql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_firewall_rule) | resource |
| [azurerm_postgresql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server) | resource |
| [azurerm_postgresql_server_key.mysql_server_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server_key) | resource |
| [azurerm_postgresql_virtual_network_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_virtual_network_rule) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_admin_login_name"></a> [ad\_admin\_login\_name](#input\_ad\_admin\_login\_name) | The login name of the principal to set as the server administrator | `any` | n/a | No |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the admin\_username user | `string` | n/a | No |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The administrator login name for the new SQL Server | `any` | n/a | No |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable/Disable auto-growing of the storage | `any` | n/a | No |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days. | `any` | n/a | No |
| <a name="input_charset"></a> [charset](#input\_charset) | Specifies the Charset for the Database, which needs to be a valid Charset | `any` | n/a | yes |
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies the Collation for the Database, which needs to be a valid Collation. | `any` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default` | `any` | n/a | No |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | Specifies an array of alerts that are disabled. Allowed values are: Sql\_Injection, Sql\_Injection\_Vulnerability, Access\_Anomaly, Data\_Exfiltration, Unsafe\_Action. | `list(any)` | n/a | No |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to. | `list(any)` | n/a | No |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | Threat detection policy configuration, known in the API as Server Security Alerts Policy | `any` | n/a | yes |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Range of IP addresses to allow firewall connections. | <pre>map(object({<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | n/a | yes |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off | `any` | n/a | No |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Whether or not infrastructure is encrypted for this server | `any` | n/a | No |
| <a name="input_key_vault_key_id"></a> [key\_vault\_key\_id](#input\_key\_vault\_key\_id) | The URL to a Key Vault Key | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | n/a | yes |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | n/a | `any` | n/a | No |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | type of identity | `string` | `null` | no |
| <a name="input_postgresql_configuration"></a> [postgresql\_configuration](#input\_postgresql\_configuration) | Sets a MySQL Configuration value on a MySQL Server | `map(string)` | n/a | yes |
| <a name="input_postgresql_version"></a> [postgresql\_version](#input\_postgresql\_version) | version of mysql | `any` | n/a | yes |
| <a name="input_postgresqlserver_name"></a> [postgresqlserver\_name](#input\_postgresqlserver\_name) | MySQL server Name | `any` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this server | `any` | n/a | No |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | sku name | `any` | n/a | yes |
| <a name="input_ssl_enforcement_enabled"></a> [ssl\_enforcement\_enabled](#input\_ssl\_enforcement\_enabled) | Specifies if SSL should be enforced on connections | `any` | n/a | yes |
| <a name="input_ssl_minimal_tls_version_enforced"></a> [ssl\_minimal\_tls\_version\_enforced](#input\_ssl\_minimal\_tls\_version\_enforced) | The minimum TLS version to support on the sever. | `any` | n/a | No |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | access key of the storage account | `string` | `null` | no |
| <a name="input_storage_endpoint"></a> [storage\_endpoint](#input\_storage\_endpoint) | storage endpoint | `string` | `null` | no |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | stoarge for mysql | `any` | n/a | No |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgresql_database_id"></a> [postgresql\_database\_id](#output\_postgresql\_database\_id) | The resource ID of the MySQL Database |
| <a name="output_postgresql_server_fqdn"></a> [postgresql\_server\_fqdn](#output\_postgresql\_server\_fqdn) | The FQDN of the MySQL Server |
| <a name="output_postgresql_server_id"></a> [postgresql\_server\_id](#output\_postgresql\_server\_id) | The resource ID of the MySQL Server |

## Module Usage
```
module "postgresql" {
  source                            = "../../modules/module_postgresql-database/postgresql-database"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  postgresqlserver_name             = var.postgresqlserver_name
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  postgresql_version                = var.postgresql_version
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  create_mode                       = var.create_mode
  tags                              = var.tags

  managed_identity_type = var.managed_identity_type

  enable_threat_detection_policy = var.enable_threat_detection_policy
  disabled_alerts                = var.disabled_alerts
  email_addresses_for_alerts     = var.email_addresses_for_alerts
  log_retention_days             = var.log_retention_days
  storage_account_access_key     = var.storage_account_access_key
  storage_endpoint               = var.storage_endpoint

  charset   = var.charset
  collation = var.collation

  postgresql_configuration = var.postgresql_configuration

  firewall_rules = var.firewall_rules

  ad_admin_login_name = var.ad_admin_login_name

  key_vault_key_id = var.key_vault_key_id

  subnet_id = var.subnet_id
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "PrivateEndpoint_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_id    = module.postgresql.postgresql_server_id
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
  resource_id              = module.postgresql.postgresql_server_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
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

module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.postgresql.postgresql_server_id
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

