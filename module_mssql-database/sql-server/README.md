<!-- BEGIN_TF_DOCS -->
##### Last Updated[DD/MM/YYYY]: 05/08/2022

##  Introduction 

This module helps us to provision mssql server and database along with the resources :

* <u> Extended_auditing_policy </u>: By default, this feature enabled on SQL servers. For database auditing, set the argument ``` mssql_db_auditing_enabled to true.```

* <u> Threat_detection_policy </u> - : By default, this feature not enabled on this module. To enable the threat detection policy for the database, set the argument ``` enable_threat_detection_policy = true.```

* <u> Adding Active Directory Administrator </u>:By default, this feature not enabled on this module. To add the Active Directory Administrator to MSSQL server , set the argument azuread_administrator with a valid Azure AD ``` user login_username and object_id```.These 2 are the required parameters in AAD.

* <u> Configuring the Firewall </u>:By default, no external access to your SQL server/database  will be allowed until you explicitly assign permission by creating a firewall rule. To add the firewall rules to the MSSQL server, set the argument ```enable_firewall_rules = true``` and provide the required IP ranges.

* <u> Using Failover Groups </u> :By default, this feature not enabled on this module. To create SQL geo-replicated auto-failover groups, set the argument``` enable_failover_group = true.``` To create a failover group, set the secondary server location argument secondary_sql_server_location to a valid region.

* <u> Security Alert Policy </u>:By default ,this feature is optional and not enabled in this module.Storage accounts configured with ```shared_access_key_enabled = false``` cannot be used to configure azurerm_mssql_server_security_alert_policy with storage_endpoint.

* <u> Using Private Endpoint </u> :By default, this feature not enabled on this module. To create private link with private endpoints set the variable ```create_private_endpoint to true``` and provide virtual_network_name, private_subnet_address_prefix with a valid values. You can also use the existing private DNS zone to create DNS records. To use this feature, set the existing_private_dns_zone with a valid existing private DNS zone name. 

* <u> Data Encryption </u> : By default, it is mandatory in this module .

* <u> Elastic pool </u> :By default , it is optional in this module,setting ``` create_elasticpool = true ``` will create it.

## File Structure
This particular module is having the following configuration files.

1. main.tf : This file is having the terraform code to provision the resources as per requirements.
2. variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in log-analytics.tf
3. output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.16.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_PrivateEndpointSql_module"></a> [PrivateEndpointSql\_module](#module\_PrivateEndpointSql\_module) | ../../module_private_endpoint | n/a |
| <a name="module_alert"></a> [alert](#module\_alert) | ../../module_alert | n/a |
| <a name="module_diag_settings"></a> [diag\_settings](#module\_diag\_settings) | ../../module_diagnostics_settings | n/a |
| <a name="module_module_create_resource_group"></a> [module\_create\_resource\_group](#module\_module\_create\_resource\_group) | ../../module_resource-group-creation/resource_group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_database.database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database_extended_auditing_policy.mssqldb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database_extended_auditing_policy) | resource |
| [azurerm_mssql_elasticpool.sqlelastic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_elasticpool) | resource |
| [azurerm_mssql_failover_group.failover_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_failover_group) | resource |
| [azurerm_mssql_firewall_rule.fw01](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_firewall_rule.fw02](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_server_extended_auditing_policy.extended_auditing_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_security_alert_policy.alert_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_security_alert_policy) | resource |
| [azurerm_mssql_server_transparent_data_encryption.data_encryption](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_transparent_data_encryption) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | The name of the Action Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_action_group_rule_name"></a> [action\_group\_rule\_name](#input\_action\_group\_rule\_name) | Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_activity_log_alert_name"></a> [activity\_log\_alert\_name](#input\_activity\_log\_alert\_name) | The name of the activity log alert. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_admin_login"></a> [admin\_login](#input\_admin\_login) | The administrator login name for the new server. | `string` | `null` | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's Password Policy | `string` | `null` | no |
| <a name="input_aggregation"></a> [aggregation](#input\_aggregation) | The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. | `string` | n/a | yes |
| <a name="input_auto_pause_delay_in_minutes"></a> [auto\_pause\_delay\_in\_minutes](#input\_auto\_pause\_delay\_in\_minutes) | (Optional) Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases. | `number` | `null` | no |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | block for azure ad admin | <pre>object({<br>    login_username              = string<br>    object_id                   = string<br>    tenant_id                   = string<br>    azuread_authentication_only = bool<br>  })</pre> | `null` | no |
| <a name="input_backup_interval_in_hours"></a> [backup\_interval\_in\_hours](#input\_backup\_interval\_in\_hours) | the hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24 | `number` | `12` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Capacity in Azure elastic pool configurations | `number` | `4` | no |
| <a name="input_category_log_alert"></a> [category\_log\_alert](#input\_category\_log\_alert) | The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth | `string` | `"Security"` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | (Optional) The name of the collation. Applies only if create\_mode is Default. Azure default is SQL\_LATIN1\_GENERAL\_CP1\_CI\_AS. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_connection_policy"></a> [connection\_policy](#input\_connection\_policy) | The connection policy the server will use | `string` | `null` | no |
| <a name="input_create_alert"></a> [create\_alert](#input\_create\_alert) | wants to create alert or not | `bool` | `false` | no |
| <a name="input_create_alert-policy"></a> [create\_alert-policy](#input\_create\_alert-policy) | To create alert policy | `bool` | `true` | no |
| <a name="input_create_diagnostic_settings"></a> [create\_diagnostic\_settings](#input\_create\_diagnostic\_settings) | wants to create diagnostic or not | `bool` | `true` | no |
| <a name="input_create_elasticpool"></a> [create\_elasticpool](#input\_create\_elasticpool) | Created an elastic pool for mssql server | `bool` | `false` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | (Optional) Specifies how to create the database. Must be either Default to create a new database or PointInTimeRestore to restore from a snapshot. Defaults to Default. | `string` | `null` | no |
| <a name="input_create_private-endpoint"></a> [create\_private-endpoint](#input\_create\_private-endpoint) | Wants to create private endpoint or not | `bool` | `false` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | n/a | yes |
| <a name="input_creation_source_database_id"></a> [creation\_source\_database\_id](#input\_creation\_source\_database\_id) | (Optional) The id of the source database to be referred to create the new database. This should only be used for databases with create\_mode values that use another database as reference. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the database | `string` | n/a | yes |
| <a name="input_diag_name"></a> [diag\_name](#input\_diag\_name) | Specifies the name of the Diagnostic Setting. | `string` | n/a | yes |
| <a name="input_dimension_name"></a> [dimension\_name](#input\_dimension\_name) | One of the dimension names | `string` | n/a | yes |
| <a name="input_dimension_operator"></a> [dimension\_operator](#input\_dimension\_operator) | The dimension operator. Possible values are Include, Exclude and StartsWith. | `string` | n/a | yes |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | Specifies a list of alerts which should be disabled | `list(string)` | `[]` | no |
| <a name="input_elastic_pool_id"></a> [elastic\_pool\_id](#input\_elastic\_pool\_id) | (Optional) The id of the elastic database pool. | `any` | `null` | no |
| <a name="input_email_account_admins"></a> [email\_account\_admins](#input\_email\_account\_admins) | email account admins in case of failure | `bool` | `false` | no |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to | `list(any)` | `[]` | no |
| <a name="input_enable_auditing_policy"></a> [enable\_auditing\_policy](#input\_enable\_auditing\_policy) | Manages Extended Audit policy for SQL database | `bool` | `true` | no |
| <a name="input_enable_failover_group"></a> [enable\_failover\_group](#input\_enable\_failover\_group) | Create a failover group of databases on a collection of Azure SQL servers | `bool` | `false` | no |
| <a name="input_enable_firewall_rules"></a> [enable\_firewall\_rules](#input\_enable\_firewall\_rules) | to enable firewall rule for primary sql server. | `bool` | `false` | no |
| <a name="input_enable_log_monitoring"></a> [enable\_log\_monitoring](#input\_enable\_log\_monitoring) | enable log monitoring | `bool` | `false` | no |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | threat detection policy in db | `bool` | `true` | no |
| <a name="input_end_ip_address"></a> [end\_ip\_address](#input\_end\_ip\_address) | The ending IP address to allow through the firewall for this rule. | `string` | n/a | yes |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | eventhub\_authorization\_rule\_id | `any` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | eventhub\_name | `any` | `null` | no |
| <a name="input_extaudit_diag_logs"></a> [extaudit\_diag\_logs](#input\_extaudit\_diag\_logs) | Database Monitoring Category details for Azure Diagnostic setting | `list(string)` | <pre>[<br>  "SQLSecurityAuditEvents",<br>  "SQLInsights",<br>  "AutomaticTuning",<br>  "QueryStoreRuntimeStatistics",<br>  "QueryStoreWaitStatistics",<br>  "Errors",<br>  "DatabaseWaitStatistics",<br>  "Timeouts",<br>  "Blocks",<br>  "Deadlocks"<br>]</pre> | no |
| <a name="input_failover_group_name"></a> [failover\_group\_name](#input\_failover\_group\_name) | Name for the Storage Account | `string` | `"failovr45"` | no |
| <a name="input_family"></a> [family](#input\_family) | Family type in Azure elastic pool configurations | `string` | `"Gen5"` | no |
| <a name="input_firewall_rule1"></a> [firewall\_rule1](#input\_firewall\_rule1) | Range of IP addresses to allow firewall connections. | `string` | n/a | yes |
| <a name="input_firewall_rule2"></a> [firewall\_rule2](#input\_firewall\_rule2) | Range of IP addresses to allow firewall connections. | `string` | n/a | yes |
| <a name="input_geo_backup_enabled"></a> [geo\_backup\_enabled](#input\_geo\_backup\_enabled) | A boolean that specifies if the Geo Backup Policy is enabled. | `bool` | `false` | no |
| <a name="input_grace_minutes"></a> [grace\_minutes](#input\_grace\_minutes) | grace minutes | `number` | `1` | no |
| <a name="input_if_database_name"></a> [if\_database\_name](#input\_if\_database\_name) | The name of the database | `bool` | `true` | no |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Status of manual connection | `string` | n/a | yes |
| <a name="input_ledger_enabled"></a> [ledger\_enabled](#input\_ledger\_enabled) | A boolean that specifies if this is a ledger database | `bool` | `false` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | License type of Azure elastic pool configurations | `string` | `"LicenseIncluded"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | log\_analytics\_destination\_type | `string` | `"Dedicated"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID of log anaytics workspace | `any` | `null` | no |
| <a name="input_log_enabled"></a> [log\_enabled](#input\_log\_enabled) | log\_enabled | `bool` | `false` | no |
| <a name="input_log_monitoring_enabled"></a> [log\_monitoring\_enabled](#input\_log\_monitoring\_enabled) | (optional)log monitoring for auditing policy | `bool` | `null` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | log\_retention\_days | `number` | `1` | no |
| <a name="input_log_retention_policy_enabled"></a> [log\_retention\_policy\_enabled](#input\_log\_retention\_policy\_enabled) | log\_retention\_policy\_enabled | `bool` | `false` | no |
| <a name="input_long_term_retention_policy"></a> [long\_term\_retention\_policy](#input\_long\_term\_retention\_policy) | block for long term retention policy | <pre>object({<br><br>    ltr_weekly_retention  = string<br>    ltr_monthly_retention = string<br>    ltr_yearly_retention  = string<br>    week_of_year          = string<br>  })</pre> | <pre>{<br>  "ltr_monthly_retention": "P1M",<br>  "ltr_weekly_retention": "P1W",<br>  "ltr_yearly_retention": "P1Y",<br>  "week_of_year": "52"<br>}</pre> | no |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | A list of User Managed Identity ID's . | `list(string)` | `[]` | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `string` | n/a | yes |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Maximum Capacity in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | Maximum size gb of Azure elastic pool configurations | `number` | `756` | no |
| <a name="input_metric_alert_name"></a> [metric\_alert\_name](#input\_metric\_alert\_name) | The name of the Metric Alert. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | One of the metric names to be monitored. | `string` | n/a | yes |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | One of the metric namespaces to be monitored. | `string` | n/a | yes |
| <a name="input_metric_retention_days"></a> [metric\_retention\_days](#input\_metric\_retention\_days) | log\_retention\_days | `number` | `1` | no |
| <a name="input_metric_retention_policy_enabled"></a> [metric\_retention\_policy\_enabled](#input\_metric\_retention\_policy\_enabled) | metric\_retention\_policy\_enabled | `bool` | `false` | no |
| <a name="input_metrics_category"></a> [metrics\_category](#input\_metrics\_category) | metrics\_category | `string` | `"AllMetrics"` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimum Capacity in Azure elastic pool configurations | `string` | `"0.25"` | no |
| <a name="input_min_capacity_db"></a> [min\_capacity\_db](#input\_min\_capacity\_db) | The minimum capacity all databases are guaranteed. | `any` | `null` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. | `string` | `"1.2"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | n/a | `string` | `"Automatic"` | no |
| <a name="input_mode_failover"></a> [mode\_failover](#input\_mode\_failover) | The failover policy of the read-write endpoint for the failover group. | `string` | `"Enabled"` | no |
| <a name="input_mssql_db_auditing_enabled"></a> [mssql\_db\_auditing\_enabled](#input\_mssql\_db\_auditing\_enabled) | (optional) | `bool` | `true` | no |
| <a name="input_operation_name_log_alert"></a> [operation\_name\_log\_alert](#input\_operation\_name\_log\_alert) | The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> | `string` | n/a | yes |
| <a name="input_operator"></a> [operator](#input\_operator) | The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. | `string` | n/a | yes |
| <a name="input_outbound_network_restriction_enabled"></a> [outbound\_network\_restriction\_enabled](#input\_outbound\_network\_restriction\_enabled) | Whether outbound network traffic is restricted for this server | `bool` | `false` | no |
| <a name="input_primary_access_key"></a> [primary\_access\_key](#input\_primary\_access\_key) | primary access key for storage account | `string` | `""` | no |
| <a name="input_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#input\_primary\_blob\_endpoint) | primary blob endpoint for storage account | `string` | `""` | no |
| <a name="input_private_connection_resource_alias"></a> [private\_connection\_resource\_alias](#input\_private\_connection\_resource\_alias) | alias name | `string` | `null` | no |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | ID of resource to be associated | `any` | `null` | no |
| <a name="input_private_dns_zone_group"></a> [private\_dns\_zone\_group](#input\_private\_dns\_zone\_group) | block for dns zone group | <pre>object({<br>    name                 = string<br>    private_dns_zone_ids = list(string)<br>  })</pre> | <pre>{<br>  "name": "xyz",<br>  "private_dns_zone_ids": [<br>    "null"<br>  ]<br>}</pre> | no |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | pvt endpoint name in Azure | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | service connection name in Azure | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this server | `bool` | `false` | no |
| <a name="input_read_replica_count"></a> [read\_replica\_count](#input\_read\_replica\_count) | (Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases. | `any` | `null` | no |
| <a name="input_read_scale"></a> [read\_scale](#input\_read\_scale) | (Optional) Read-only connections will be redirected to a high-available replica. Please see Use read-only replicas to load-balance read-only query workloads. | `any` | `null` | no |
| <a name="input_recover_database_id"></a> [recover\_database\_id](#input\_recover\_database\_id) | The ID of the database to be recovered. | `string` | `null` | no |
| <a name="input_request_message"></a> [request\_message](#input\_request\_message) | request msg | `string` | `"PL"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_restore_dropped_database_id"></a> [restore\_dropped\_database\_id](#input\_restore\_dropped\_database\_id) | The ID of the database to be restored | `string` | `null` | no |
| <a name="input_restore_point_in_time"></a> [restore\_point\_in\_time](#input\_restore\_point\_in\_time) | (Optional) The point in time for the restore. Only applies if create\_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z | `any` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | The number of days to retain the log | `number` | `1` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (optional) | `number` | `null` | no |
| <a name="input_sa_primary_access_key"></a> [sa\_primary\_access\_key](#input\_sa\_primary\_access\_key) | (optional)primary access key for storage blob | `string` | `null` | no |
| <a name="input_sa_primary_blob_endpoint"></a> [sa\_primary\_blob\_endpoint](#input\_sa\_primary\_blob\_endpoint) | (optional) storage endpoint for storage blob | `string` | `null` | no |
| <a name="input_sample_name"></a> [sample\_name](#input\_sample\_name) | (Optional) Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT. | `any` | `null` | no |
| <a name="input_scope_type"></a> [scope\_type](#input\_scope\_type) | Specifies the type of target scope. Possible values are ResourceGroup and Resource | `string` | `"null"` | no |
| <a name="input_secondary_sql_server_location"></a> [secondary\_sql\_server\_location](#input\_secondary\_sql\_server\_location) | location for secondary server | `string` | `"south india"` | no |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. | `string` | n/a | yes |
| <a name="input_short_retentiondays"></a> [short\_retentiondays](#input\_short\_retentiondays) | Point in Time Restore Configuration.  Values has to be between 7 and 35 | `number` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU type in Azure elastic pool configurations | `string` | `"GP_Gen5"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) Specifies the name of the sku used by the database. Only changing this from tier Hyperscale to another tier will force a new resource to be created. For example, GP\_S\_Gen5\_2,HS\_Gen4\_1,BC\_Gen5\_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. | `any` | `null` | no |
| <a name="input_sql_database_edition"></a> [sql\_database\_edition](#input\_sql\_database\_edition) | The edition of the database to be created. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web | `string` | `"Standard"` | no |
| <a name="input_sql_elasticpool"></a> [sql\_elasticpool](#input\_sql\_elasticpool) | SQL Elasticpool name in Azure | `string` | n/a | yes |
| <a name="input_sql_server_version"></a> [sql\_server\_version](#input\_sql\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server) | `string` | n/a | yes |
| <a name="input_sqlserver_name"></a> [sqlserver\_name](#input\_sqlserver\_name) | SQL server Name | `string` | n/a | yes |
| <a name="input_start_ip_address"></a> [start\_ip\_address](#input\_start\_ip\_address) | start ip of firewall | `string` | n/a | yes |
| <a name="input_state"></a> [state](#input\_state) | Specifies the state of the policy, whether it is enabled or disabled | `string` | n/a | yes |
| <a name="input_storage_account_access_key_is_secondary"></a> [storage\_account\_access\_key\_is\_secondary](#input\_storage\_account\_access\_key\_is\_secondary) | (optional) secondary acces key for storage blob | `bool` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | ID of target resource | `any` | `null` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specifies the storage account type used to store backups for this database. | `string` | `"Geo"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of subnet | `any` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | sub resources names in Azure | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag Name | `map(any)` | n/a | yes |
| <a name="input_threat_policy_email_account_admins"></a> [threat\_policy\_email\_account\_admins](#input\_threat\_policy\_email\_account\_admins) | the alert is sent to the account administrators or not. | `string` | `null` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The criteria threshold value that activates the alert | `number` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Tier type in Azure elastic pool configurations | `string` | `"GeneralPurpose"` | no |
| <a name="input_values"></a> [values](#input\_values) | The list of dimension values. | `list(string)` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_sql_server_id"></a> [primary\_sql\_server\_id](#output\_primary\_sql\_server\_id) | The primary Microsoft SQL Server ID |
| <a name="output_primarysql_server_name"></a> [primarysql\_server\_name](#output\_primarysql\_server\_name) | The name of the storage account |
| <a name="output_sql_database_id"></a> [sql\_database\_id](#output\_sql\_database\_id) | The SQL Database ID |

## Module Usage
```
module "mssqlserver" {
  source                                  = "../../modules/module_mssql-database/sql-server"
  resource_group_name                     = var.resource_group_name
  location                                = var.location
  create_resource_group                   = var.create_resource_group
  sqlserver_name                          = var.sqlserver_name
  admin_login                             = var.admin_login
  admin_password                          = var.admin_password
  enable_auditing_policy                  = var.enable_auditing_policy
  enable_threat_detection_policy          = var.enable_threat_detection_policy
  min_tls_version                         = var.min_tls_version
  sql_server_version                      = var.sql_server_version
  retention_days                          = var.retention_days
  database_name                           = var.database_name
  failover_group_name                     = var.failover_group_name
  sql_database_edition                    = var.sql_database_edition
  email_addresses_for_alerts              = var.email_addresses_for_alerts
  firewall_rule1                          = var.firewall_rule1
  firewall_rule2                          = var.firewall_rule2
  start_ip_address                        = var.start_ip_address
  end_ip_address                          = var.end_ip_address
  create_elasticpool                      = var.create_elasticpool
  enable_firewall_rules                   = var.enable_firewall_rules
  enable_failover_group                   = var.enable_failover_group
  mode                                    = var.mode
  mode_failover                           = var.mode_failover
  public_network_access_enabled           = var.public_network_access_enabled
  state                                   = var.state
  email_account_admins                    = var.email_account_admins
  secondary_sql_server_location           = var.secondary_sql_server_location
  grace_minutes                           = var.grace_minutes
  tags                                    = var.tags
  primary_blob_endpoint                   = var.primary_blob_endpoint
  primary_access_key                      = var.primary_access_key
  sql_elasticpool                         = var.sql_elasticpool
  license_type                            = var.license_type
  max_size_gb                             = var.max_size_gb
  sku                                     = var.sku
  tier                                    = var.tier
  family                                  = var.family
  capacity                                = var.capacity
  min_capacity                            = var.min_capacity
  max_capacity                            = var.max_capacity
  connection_policy                       = var.connection_policy
  retention_in_days                       = var.retention_in_days
  mssql_db_auditing_enabled               = var.mssql_db_auditing_enabled
  log_monitoring_enabled                  = var.log_monitoring_enabled
  sa_primary_access_key                   = var.sa_primary_access_key
  storage_account_access_key_is_secondary = var.storage_account_access_key_is_secondary
  sa_primary_blob_endpoint                = var.sa_primary_blob_endpoint
  min_capacity_db                         = var.min_capacity_db
  threat_policy_email_account_admins      = var.threat_policy_email_account_admins
  disabled_alerts                         = var.disabled_alerts
  long_term_retention_policy              = var.long_term_retention_policy
  short_retentiondays                     = var.short_retentiondays
  zone_redundant                          = var.zone_redundant
  sku_name                                = var.sku_name
  sample_name                             = var.sample_name
  read_scale                              = var.read_scale
  read_replica_count                      = var.read_replica_count
  restore_point_in_time                   = var.restore_point_in_time
  elastic_pool_id                         = var.elastic_pool_id
  collation                               = var.collation
  creation_source_database_id             = var.creation_source_database_id
  create_mode                             = var.create_mode
  auto_pause_delay_in_minutes             = var.auto_pause_delay_in_minutes
  azuread_administrator                   = var.azuread_administrator
  managed_identity_ids                    = var.managed_identity_ids
  managed_identity_type                   = var.managed_identity_type
  storage_account_type                    = var.storage_account_type
  ledger_enabled                          = var.ledger_enabled
  recover_database_id                     = var.recover_database_id
  restore_dropped_database_id             = var.restore_dropped_database_id
  geo_backup_enabled                      = var.geo_backup_enabled
  //private endpoint
  create_private-endpoint           = var.create_private-endpoint
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.mssqlserver.primary_sql_server_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  //diag 
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  extaudit_diag_logs              = var.extaudit_diag_logs
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metrics_category                = var.metrics_category
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
  //alert
  action_group_name        = var.action_group_name
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  activity_log_alert_name  = var.activity_log_alert_name
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
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