<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 17/11/2022
# <u> Introduction </u>
* This module provides the facility to provision databricks workspace CMK. In this module we have included all possible argument for databricks workspace cmk.

## File Structure 
This particular module is having the following configuration files.
- databricks.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in network_watcher.tf
- output.tf : This file is having all the resource output details generated.



## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.30.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace_customer_managed_key.dwcmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace_customer_managed_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | keyvault\_id | `string` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | workspace\_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_databricks_workspace_customer_managed_key_id"></a> [databricks\_workspace\_customer\_managed\_key\_id](#output\_databricks\_workspace\_customer\_managed\_key\_id) | n/a |

## Module Usage
```
module "databricks_workspace" {
  source                           = "../../modules/module_azure_databricks_cmk"
  keyvault_id = var.keyvault_id
 # tenant_id    = var.tenant_id
  

  #key_permissions = var.key_permissions
  workspace_id     = var.workspace_id
  
}
```
<!-- END_TF_DOCS -->