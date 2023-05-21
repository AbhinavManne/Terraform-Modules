<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.16.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_PrivateEndpointSql_module"></a> [PrivateEndpointSql\_module](#module\_PrivateEndpointSql\_module) | ../../modules/module_private_endpoint | n/a |
| <a name="module_alert"></a> [alert](#module\_alert) | ../../modules/module_alert | n/a |
| <a name="module_diag_settings"></a> [diag\_settings](#module\_diag\_settings) | ../../modules/module_diagnostics_settings | n/a |
| <a name="module_module_create_resource_group"></a> [module\_create\_resource\_group](#module\_module\_create\_resource\_group) | ../../modules/module_resource-group-creation/resource_group | n/a |
| <a name="module_mssqlserver"></a> [mssqlserver](#module\_mssqlserver) | ../../modules/module_mssql-database/sql-server | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | The name of the Action Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_action_group_rule_name"></a> [action\_group\_rule\_name](#input\_action\_group\_rule\_name) | Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_activity_log_alert_name"></a> [activity\_log\_alert\_name](#input\_activity\_log\_alert\_name) | The name of the activity log alert. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_admin_login"></a> [admin\_login](#input\_admin\_login) | The administrator login name for the new server. | `string` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's Password Policy | `string` | n/a | yes |
| <a name="input_aggregation"></a> [aggregation](#input\_aggregation) | The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. | `string` | n/a | yes |
| <a name="input_auto_pause_delay_in_minutes"></a> [auto\_pause\_delay\_in\_minutes](#input\_auto\_pause\_delay\_in\_minutes) | (Optional) Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases. | `any` | `null` | no |
| <a name="input_azuread_administrator"></a> [azuread\_administrator](#input\_azuread\_administrator) | n/a | <pre>object({<br>    login_username              = string<br>    object_id                   = string<br>    tenant_id                   = string<br>    azuread_authentication_only = bool<br>  })</pre> | `null` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Capacity in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_category_log_alert"></a> [category\_log\_alert](#input\_category\_log\_alert) | The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth | `string` | n/a | yes |
| <a name="input_collation"></a> [collation](#input\_collation) | (Optional) The name of the collation. Applies only if create\_mode is Default. Azure default is SQL\_LATIN1\_GENERAL\_CP1\_CI\_AS. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_connection_policy"></a> [connection\_policy](#input\_connection\_policy) | The connection policy the server will use | `string` | `null` | no |
| <a name="input_create_elasticpool"></a> [create\_elasticpool](#input\_create\_elasticpool) | Created an elastic pool for mssql server | `any` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | (Optional) Specifies how to create the database. Must be either Default to create a new database or PointInTimeRestore to restore from a snapshot. Defaults to Default. | `any` | `null` | no |
| <a name="input_create_private-endpoint"></a> [create\_private-endpoint](#input\_create\_private-endpoint) | Wants to create private endpoint or not | `bool` | `false` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for all networking resources | `bool` | n/a | yes |
| <a name="input_creation_source_database_id"></a> [creation\_source\_database\_id](#input\_creation\_source\_database\_id) | (Optional) The id of the source database to be referred to create the new database. This should only be used for databases with create\_mode values that use another database as reference. Changing this forces a new resource to be created. | `any` | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the database | `any` | n/a | yes |
| <a name="input_diag_name"></a> [diag\_name](#input\_diag\_name) | Specifies the name of the Diagnostic Setting. | `string` | n/a | yes |
| <a name="input_dimension_name"></a> [dimension\_name](#input\_dimension\_name) | One of the dimension names | `string` | n/a | yes |
| <a name="input_dimension_operator"></a> [dimension\_operator](#input\_dimension\_operator) | The dimension operator. Possible values are Include, Exclude and StartsWith. | `string` | n/a | yes |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | n/a | `list` | `[]` | no |
| <a name="input_elastic_pool_id"></a> [elastic\_pool\_id](#input\_elastic\_pool\_id) | (Optional) The id of the elastic database pool. | `any` | `null` | no |
| <a name="input_email_account_admins"></a> [email\_account\_admins](#input\_email\_account\_admins) | email account admins in case of failure | `bool` | `false` | no |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to | `any` | n/a | yes |
| <a name="input_enable_auditing_policy"></a> [enable\_auditing\_policy](#input\_enable\_auditing\_policy) | Manages Extended Audit policy for SQL database | `bool` | n/a | yes |
| <a name="input_enable_failover_group"></a> [enable\_failover\_group](#input\_enable\_failover\_group) | Create a failover group of databases on a collection of Azure SQL servers | `any` | n/a | yes |
| <a name="input_enable_firewall_rules"></a> [enable\_firewall\_rules](#input\_enable\_firewall\_rules) | to enable firewall rule for primary sql server | `bool` | n/a | yes |
| <a name="input_enable_log_monitoring"></a> [enable\_log\_monitoring](#input\_enable\_log\_monitoring) | enable log monitoring | `bool` | n/a | yes |
| <a name="input_enable_role_assignment"></a> [enable\_role\_assignment](#input\_enable\_role\_assignment) | --------------Role Assignment variables---------------------------# | `bool` | `false` | no |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | n/a | `any` | n/a | yes |
| <a name="input_end_ip_address"></a> [end\_ip\_address](#input\_end\_ip\_address) | n/a | `string` | n/a | yes |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | eventhub\_authorization\_rule\_id | `any` | n/a | yes |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | eventhub\_name | `any` | n/a | yes |
| <a name="input_extaudit_diag_logs"></a> [extaudit\_diag\_logs](#input\_extaudit\_diag\_logs) | Database Monitoring Category details for Azure Diagnostic setting | `list` | <pre>[<br>  "SQLSecurityAuditEvents",<br>  "SQLInsights",<br>  "AutomaticTuning",<br>  "QueryStoreRuntimeStatistics",<br>  "QueryStoreWaitStatistics",<br>  "Errors",<br>  "DatabaseWaitStatistics",<br>  "Timeouts",<br>  "Blocks",<br>  "Deadlocks"<br>]</pre> | no |
| <a name="input_failover_group_name"></a> [failover\_group\_name](#input\_failover\_group\_name) | Name for the Storage Account | `any` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | Family type in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_firewall_rule1"></a> [firewall\_rule1](#input\_firewall\_rule1) | Range of IP addresses to allow firewall connections. | `string` | n/a | yes |
| <a name="input_firewall_rule2"></a> [firewall\_rule2](#input\_firewall\_rule2) | Range of IP addresses to allow firewall connections. | `string` | n/a | yes |
| <a name="input_geo_backup_enabled"></a> [geo\_backup\_enabled](#input\_geo\_backup\_enabled) | A boolean that specifies if the Geo Backup Policy is enabled. | `bool` | `false` | no |
| <a name="input_grace_minutes"></a> [grace\_minutes](#input\_grace\_minutes) | grace minutes | `number` | n/a | yes |
| <a name="input_if_database_name"></a> [if\_database\_name](#input\_if\_database\_name) | The name of the database | `bool` | `true` | no |
| <a name="input_if_long_term_retention_policy"></a> [if\_long\_term\_retention\_policy](#input\_if\_long\_term\_retention\_policy) | n/a | <pre>object({<br><br>    ltr_weekly_retention  = string<br>    ltr_monthly_retention = string<br>    ltr_yearly_retention  = string<br>    ltr_week_of_year      = number<br>  })</pre> | <pre>{<br>  "ltr_monthly_retention": "P1M",<br>  "ltr_week_of_year": 52,<br>  "ltr_weekly_retention": "P1W",<br>  "ltr_yearly_retention": "P1Y"<br>}</pre> | no |
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Status of manual connection | `string` | n/a | yes |
| <a name="input_ledger_enabled"></a> [ledger\_enabled](#input\_ledger\_enabled) | A boolean that specifies if this is a ledger database | `bool` | `false` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | License type of Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `any` | n/a | yes |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | log\_analytics\_destination\_type | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID of log anaytics workspace | `any` | n/a | yes |
| <a name="input_log_enabled"></a> [log\_enabled](#input\_log\_enabled) | log\_enabled | `bool` | n/a | yes |
| <a name="input_log_monitoring_enabled"></a> [log\_monitoring\_enabled](#input\_log\_monitoring\_enabled) | (optional) | `bool` | `null` | no |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | log\_retention\_days | `number` | n/a | yes |
| <a name="input_log_retention_policy_enabled"></a> [log\_retention\_policy\_enabled](#input\_log\_retention\_policy\_enabled) | log\_retention\_policy\_enabled | `bool` | n/a | yes |
| <a name="input_managed_identity_ids"></a> [managed\_identity\_ids](#input\_managed\_identity\_ids) | A list of User Managed Identity ID's which should be assigned to the Linux Virtual Machine. | `list(string)` | <pre>[<br>  "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg-docker/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user-nik123"<br>]</pre> | no |
| <a name="input_managed_identity_type"></a> [managed\_identity\_type](#input\_managed\_identity\_type) | The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned` | `string` | `null` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Maximum Capacity in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | Maximum size gb of Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_metric_alert_name"></a> [metric\_alert\_name](#input\_metric\_alert\_name) | The name of the Metric Alert. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | One of the metric names to be monitored. | `string` | n/a | yes |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | One of the metric namespaces to be monitored. | `string` | n/a | yes |
| <a name="input_metric_retention_days"></a> [metric\_retention\_days](#input\_metric\_retention\_days) | log\_retention\_days | `number` | n/a | yes |
| <a name="input_metric_retention_policy_enabled"></a> [metric\_retention\_policy\_enabled](#input\_metric\_retention\_policy\_enabled) | metric\_retention\_policy\_enabled | `bool` | n/a | yes |
| <a name="input_metrics_category"></a> [metrics\_category](#input\_metrics\_category) | metrics\_category | `string` | n/a | yes |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimum Capacity in Azure elastic pool configurations | `string` | `"0.25"` | no |
| <a name="input_min_capacity_db"></a> [min\_capacity\_db](#input\_min\_capacity\_db) | n/a | `any` | `null` | no |
| <a name="input_min_tls_version"></a> [min\_tls\_version](#input\_min\_tls\_version) | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. | `any` | n/a | yes |
| <a name="input_mode"></a> [mode](#input\_mode) | n/a | `string` | `"Automatic"` | no |
| <a name="input_mode_failover"></a> [mode\_failover](#input\_mode\_failover) | The failover policy of the read-write endpoint for the failover group. | `any` | n/a | yes |
| <a name="input_mssql_db_auditing_enabled"></a> [mssql\_db\_auditing\_enabled](#input\_mssql\_db\_auditing\_enabled) | (optional) | `bool` | `true` | no |
| <a name="input_operation_name_log_alert"></a> [operation\_name\_log\_alert](#input\_operation\_name\_log\_alert) | The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> | `string` | n/a | yes |
| <a name="input_operator"></a> [operator](#input\_operator) | The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. | `string` | n/a | yes |
| <a name="input_outbound_network_restriction_enabled"></a> [outbound\_network\_restriction\_enabled](#input\_outbound\_network\_restriction\_enabled) | Whether outbound network traffic is restricted for this server | `bool` | `false` | no |
| <a name="input_primary_access_key"></a> [primary\_access\_key](#input\_primary\_access\_key) | primary access key for storage account | `string` | `""` | no |
| <a name="input_primary_blob_endpoint"></a> [primary\_blob\_endpoint](#input\_primary\_blob\_endpoint) | primary blob endpoint for storage account | `string` | `""` | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | ID of the Principal (User, Group or Service Principal) to assign the Role Definition to | `string` | `null` | no |
| <a name="input_private_connection_resource_alias"></a> [private\_connection\_resource\_alias](#input\_private\_connection\_resource\_alias) | alias name | `string` | n/a | yes |
| <a name="input_private_dns_zone_group"></a> [private\_dns\_zone\_group](#input\_private\_dns\_zone\_group) | n/a | <pre>object({<br>    name                 = string<br>    private_dns_zone_ids = list(string)<br>  })</pre> | `null` | no |
| <a name="input_private_endpoint_name"></a> [private\_endpoint\_name](#input\_private\_endpoint\_name) | pvt endpoint name in Azure | `string` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | service connection name in Azure | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether public network access is allowed for this serve | `bool` | n/a | yes |
| <a name="input_read_replica_count"></a> [read\_replica\_count](#input\_read\_replica\_count) | (Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases. | `any` | `null` | no |
| <a name="input_read_scale"></a> [read\_scale](#input\_read\_scale) | (Optional) Read-only connections will be redirected to a high-available replica. Please see Use read-only replicas to load-balance read-only query workloads. | `any` | `null` | no |
| <a name="input_recover_database_id"></a> [recover\_database\_id](#input\_recover\_database\_id) | The ID of the database to be recovered. | `string` | `null` | no |
| <a name="input_request_message"></a> [request\_message](#input\_request\_message) | request msg | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `any` | n/a | yes |
| <a name="input_restore_dropped_database_id"></a> [restore\_dropped\_database\_id](#input\_restore\_dropped\_database\_id) | The ID of the database to be restored | `string` | `null` | no |
| <a name="input_restore_point_in_time"></a> [restore\_point\_in\_time](#input\_restore\_point\_in\_time) | (Optional) The point in time for the restore. Only applies if create\_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z | `any` | `null` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | The number of days to retain the log | `number` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (optional) | `number` | `null` | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | List of Role Definitions | `string` | `"Contributor"` | no |
| <a name="input_sa_primary_access_key"></a> [sa\_primary\_access\_key](#input\_sa\_primary\_access\_key) | (optional) | `string` | `null` | no |
| <a name="input_sa_primary_blob_endpoint"></a> [sa\_primary\_blob\_endpoint](#input\_sa\_primary\_blob\_endpoint) | (optional) | `string` | `null` | no |
| <a name="input_sample_name"></a> [sample\_name](#input\_sample\_name) | (Optional) Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT. | `any` | `null` | no |
| <a name="input_scope_type"></a> [scope\_type](#input\_scope\_type) | Specifies the type of target scope. Possible values are ResourceGroup and Resource | `string` | n/a | yes |
| <a name="input_secondary_sql_server_location"></a> [secondary\_sql\_server\_location](#input\_secondary\_sql\_server\_location) | location for secondary server | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. | `string` | n/a | yes |
| <a name="input_short_retentiondays"></a> [short\_retentiondays](#input\_short\_retentiondays) | Point in Time Restore Configuration.  Values has to be between 7 and 35 | `number` | `7` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU type in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) Specifies the name of the sku used by the database. Only changing this from tier Hyperscale to another tier will force a new resource to be created. For example, GP\_S\_Gen5\_2,HS\_Gen4\_1,BC\_Gen5\_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. | `any` | `null` | no |
| <a name="input_sql_database_edition"></a> [sql\_database\_edition](#input\_sql\_database\_edition) | The edition of the database to be created. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web | `string` | n/a | yes |
| <a name="input_sql_elasticpool"></a> [sql\_elasticpool](#input\_sql\_elasticpool) | SQL Elasticpool name in Azure | `string` | n/a | yes |
| <a name="input_sql_server_version"></a> [sql\_server\_version](#input\_sql\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server) | `string` | n/a | yes |
| <a name="input_sqlserver_name"></a> [sqlserver\_name](#input\_sqlserver\_name) | SQL server Name | `string` | n/a | yes |
| <a name="input_start_ip_address"></a> [start\_ip\_address](#input\_start\_ip\_address) | n/a | `string` | n/a | yes |
| <a name="input_state"></a> [state](#input\_state) | n/a | `any` | n/a | yes |
| <a name="input_storage_account_access_key_is_secondary"></a> [storage\_account\_access\_key\_is\_secondary](#input\_storage\_account\_access\_key\_is\_secondary) | (optional) | `bool` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | ID of target resource | `any` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specifies the storage account type used to store backups for this database. | `string` | `"Geo"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet id | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | sub resources names in Azure | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag Name | `map(any)` | n/a | yes |
| <a name="input_threat_policy_email_account_admins"></a> [threat\_policy\_email\_account\_admins](#input\_threat\_policy\_email\_account\_admins) | the alert is sent to the account administrators or not. | `string` | `null` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The criteria threshold value that activates the alert | `number` | n/a | yes |
| <a name="input_tier"></a> [tier](#input\_tier) | Tier type in Azure elastic pool configurations | `string` | n/a | yes |
| <a name="input_values"></a> [values](#input\_values) | The list of dimension values. | `list(string)` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->