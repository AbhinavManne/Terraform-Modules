<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 07/10/2022
##  Introduction 
This module helps us to define roles that can later be assigned with the help of role assignment module on individual resources, resource groups, subscriptions and management group levels.

## File Structure 
This particular module is having the following configuration files.
- role_definition.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in role_definition.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_role_definition.rdef](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rdef_assignable_scopes"></a> [rdef\_assignable\_scopes](#input\_rdef\_assignable\_scopes) | One or more assignable scopes for this Role Definition, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. | `list(string)` | n/a | no |
| <a name="input_rdef_permissions"></a> [rdef\_permissions](#input\_rdef\_permissions) | Wants to enable permissions block? | `bool` | n/a | yes |
| <a name="input_rdef_permissions_actions"></a> [rdef\_permissions\_actions](#input\_rdef\_permissions\_actions) | One or more Allowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. | `list(string)` | n/a | no |
| <a name="input_rdef_permissions_data_actions"></a> [rdef\_permissions\_data\_actions](#input\_rdef\_permissions\_data\_actions) | One or more Allowed Data Actions, such as *, Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read | `list(string)` | n/a | n0 |
| <a name="input_rdef_permissions_not_actions"></a> [rdef\_permissions\_not\_actions](#input\_rdef\_permissions\_not\_actions) | One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read | `list(string)` | n/a | no |
| <a name="input_rdef_permissions_not_data_actions"></a> [rdef\_permissions\_not\_data\_actions](#input\_rdef\_permissions\_not\_data\_actions) | One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read | `list(string)` | n/a | no |
| <a name="input_role_definition_description"></a> [role\_definition\_description](#input\_role\_definition\_description) | A description of the Role Definition. | `string` | n/a | no |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | The name of the Role Definition. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope at which the Role Definition applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable\_scopes. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_definition_id"></a> [role\_definition\_id](#output\_role\_definition\_id) | Role definition resource ID |

## Module Usage
```
module "role_definition" {
  source                            = "../../module/module_role_definition"
  role_definition_name              = var.role_definition_name
  scope                             = var.scope
  role_definition_description       = var.role_definition_description
  rdef_permissions                  = var.rdef_permissions
  rdef_permissions_actions          = var.rdef_permissions_actions
  rdef_permissions_data_actions     = var.rdef_permissions_data_actions
  rdef_permissions_not_actions      = var.rdef_permissions_not_actions
  rdef_permissions_not_data_actions = var.rdef_permissions_not_data_actions
  rdef_assignable_scopes            = var.rdef_assignable_scopes
}
```

## Role Definition : Terraform
* Please refer this link to understand more about Role Definition configurations through terraform: [Role_Definition_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition)

## Role Definition : MSDOC
* Please refer this MSDOC link to understand more about Role Definition: [Role_Definition_MSDOC](https://learn.microsoft.com/en-us/azure/role-based-access-control/role-definitions)

<!-- END_TF_DOCS -->