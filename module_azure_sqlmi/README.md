<!-- BEGIN_TF_DOCS -->
##### last updated on :21-10-2022

## Introduction

This module helps us to provision mssql managed instance along with database, failover group, active directory administrator and vulnerability assessment. Apart from managed instance resource by default all the other resources are optional.

* For mssqlmi instance we need to create the network security group with security rules and associate it with subnet also associate the subnet with route table manually before provisioning the mssqlmi instance.

* For secondary mssql instance also we need to create a separate NSG and route table and associate it with a new subnet.



## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.21.1 |


## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_managed_database.db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_database) | resource |
| [azurerm_mssql_managed_instance.secondary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance) | resource |
| [azurerm_mssql_managed_instance.sqlmi](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance) | resource |
| [azurerm_mssql_managed_instance_active_directory_administrator.aad](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance_active_directory_administrator) | resource |
| [azurerm_mssql_managed_instance_failover_group.fgroup](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance_failover_group) | resource |
| [azurerm_mssql_managed_instance_vulnerability_assessment.vulnerability](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_instance_vulnerability_assessment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | he password associated with the administrator\_login user | `string` | n/a | yes |
| <a name="input_azuread_authentication_only"></a> [azuread\_authentication\_only](#input\_azuread\_authentication\_only) | When true, only permit logins from AAD users and administrators. When false, also allow local database users. | `bool` | `false` | no |
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies how the SQL Managed Instance will be collated | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| <a name="input_create_aad"></a> [create\_aad](#input\_create\_aad) | wants to create aad or not | `bool` | `false` | no |
| <a name="input_create_managed_db"></a> [create\_managed\_db](#input\_create\_managed\_db) | wants to create database or not | `bool` | `false` | no |
| <a name="input_create_vulnerability_assessment"></a> [create\_vulnerability\_assessment](#input\_create\_vulnerability\_assessment) | wants to create vulnerability assessment | `bool` | `false` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | name of db | `string` | n/a | yes |
| <a name="input_dns_zone_partner_id"></a> [dns\_zone\_partner\_id](#input\_dns\_zone\_partner\_id) | The ID of the SQL Managed Instance which will share the DNS zone. | `string` | `null` | no |
| <a name="input_failover_group_name"></a> [failover\_group\_name](#input\_failover\_group\_name) | name of failover group | `map(any)` | n/a | yes |
| <a name="input_grace_minutes"></a> [grace\_minutes](#input\_grace\_minutes) | The grace period in minutes before failover with data loss is attempted. | `string` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | identity block | `string` | `null` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | What type of license the Managed Instance will use | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `"East US"` | no |
| <a name="input_login_username"></a> [login\_username](#input\_login\_username) | The login name of the principal to set as the Managed Instance Administrator | `string` | n/a | yes |
| <a name="input_maintenance_configuration_name"></a> [maintenance\_configuration\_name](#input\_maintenance\_configuration\_name) | The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance. | `string` | `"SQL_Default"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The Minimum TLS Version | `string` | `"1.2"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | The failover mode | `string` | n/a | yes |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The Object ID of the principal to set as the Managed Instance Administrator | `string` | n/a | yes |
| <a name="input_primary_sqlmi"></a> [primary\_sqlmi](#input\_primary\_sqlmi) | The name of the SQL Managed Instance. This needs to be globally unique within Azure. | `string` | n/a | yes |
| <a name="input_proxy_override"></a> [proxy\_override](#input\_proxy\_override) | Specifies how the SQL Managed Instance will be accessed | `string` | `"Default"` | no |
| <a name="input_public_data_endpoint_enabled"></a> [public\_data\_endpoint\_enabled](#input\_public\_data\_endpoint\_enabled) | Is the public data endpoint enabled? | `bool` | `false` | no |
| <a name="input_recurring_scans"></a> [recurring\_scans](#input\_recurring\_scans) | The recurring scans settings | `map(any)` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to be imported. | `string` | `"rg"` | no |
| <a name="input_secondary_sqlmi"></a> [secondary\_sqlmi](#input\_secondary\_sqlmi) | The Secondary (Failover) SQL MI instance details | `map(any)` | `null` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for the SQL Managed Instance. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | Specifies the identifier key of the storage account for vulnerability assessment scan results. | `string` | `null` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | Specifies the storage account type used to store backups for this database | `string` | `"GRS"` | no |
| <a name="input_storage_container_path"></a> [storage\_container\_path](#input\_storage\_container\_path) | A blob storage container path to hold the scan results | `string` | n/a | yes |
| <a name="input_storage_container_sas_key"></a> [storage\_container\_sas\_key](#input\_storage\_container\_sas\_key) | A shared access signature (SAS Key) that has write access to the blob container specified in storage\_container\_path parameter. If storage\_account\_access\_key isn't specified, storage\_container\_sas\_key is required. | `string` | n/a | yes |
| <a name="input_storage_size_in_gb"></a> [storage\_size\_in\_gb](#input\_storage\_size\_in\_gb) | Maximum storage space for your instance | `number` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (required)The subnet resource id that the SQL Managed Instance will be associated with. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory Tenant ID | `string` | n/a | yes |
| <a name="input_timezone_id"></a> [timezone\_id](#input\_timezone\_id) | The TimeZone ID that the SQL Managed Instance will be operating in. | `string` | `"UTC"` | no |
| <a name="input_vcores"></a> [vcores](#input\_vcores) | Number of cores that should be assigned to your instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqlmi_db"></a> [sqlmi\_db](#output\_sqlmi\_db) | n/a |
| <a name="output_sqlmi_instance_id"></a> [sqlmi\_instance\_id](#output\_sqlmi\_instance\_id) | n/a |
| <a name="output_sqlmi_secondary_instance_id"></a> [sqlmi\_secondary\_instance\_id](#output\_sqlmi\_secondary\_instance\_id) | n/a |

## Module Usage

```
module "sqlmi" {

  source = "../../modules/module_azure_sqlmi/module_sqlmi"

  resource_group_name            = var.resource_group_name
  location                       = var.location
  primary_sqlmi                  = var.primary_sqlmi
  administrator_login            = var.administrator_login
  administrator_login_password   = var.administrator_login_password
  license_type                   = var.license_type
  sku_name                       = var.sku_name
  vcores                         = var.vcores
  storage_size_in_gb             = var.storage_size_in_gb
  public_data_endpoint_enabled   = var.public_data_endpoint_enabled
  collation                      = var.collation
  minimum_tls_version            = var.minimum_tls_version
  proxy_override                 = var.proxy_override
  timezone_id                    = var.timezone_id
  dns_zone_partner_id            = var.dns_zone_partner_id
  storage_account_type           = var.storage_account_type
  identity_type                  = var.identity_type
  subnet_id                      = var.subnet_id
  maintenance_configuration_name = var.maintenance_configuration_name
  database_name                  = var.database_name
  mode                           = var.mode
  grace_minutes                  = var.grace_minutes
  create_aad                     = var.create_aad
  failover_group_name            = var.failover_group_name
  login_username                 = var.login_username
  tenant_id                      = var.tenant_id
  object_id                      = var.object_id
  storage_container_path         = var.storage_container_path
  storage_container_sas_key      = var.storage_container_sas_key
  secondary_sqlmi                = var.secondary_sqlmi
  tags                           = var.tags

}
```
<!-- END_TF_DOCS -->