<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 07/10/2022
##  Introduction 
This module helps us to add role assignment, access to Azure resources is granted by creating a role assignment.

## File Structure 
This particular module is having the following configuration files.
- role_assignment.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in role_assignment.tf
- output.tf : This file will be having the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.rbac](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delegated_managed_identity_resource_id"></a> [delegated\_managed\_identity\_resource\_id](#input\_delegated\_managed\_identity\_resource\_id) | The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_ra_role_definition_name"></a> [ra\_role\_definition\_name](#input\_ra\_role\_definition\_name) | The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role\_definition\_id. | `string` | n/a | no |
| <a name="input_rbac_condition"></a> [rbac\_condition](#input\_rbac\_condition) | The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_rbac_condition_version"></a> [rbac\_condition\_version](#input\_rbac\_condition\_version) | The version of the condition. Possible values are 1.0 or 2.0. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_role_assignment_description"></a> [role\_assignment\_description](#input\_role\_assignment\_description) | The description for this Role Assignment. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_role_assignment_name"></a> [role\_assignment\_name](#input\_role\_assignment\_name) | A unique UUID/GUID for this Role Assignment - one will be generated if not specified. Changing this forces a new resource to be created. | `string` | n/a | no |
| <a name="input_role_assignment_scope"></a> [role\_assignment\_scope](#input\_role\_assignment\_scope) | The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_role_definition_id"></a> [role\_definition\_id](#input\_role\_definition\_id) | The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role\_definition\_name. | `string` | n/a | no |
| <a name="input_skip_service_principal_aad_check"></a> [skip\_service\_principal\_aad\_check](#input\_skip\_service\_principal\_aad\_check) | If the principal\_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal\_id is a Service Principal identity. If it is not a Service Principal identity it will cause the role assignment to fail. Defaults to false. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_assignment_id"></a> [role\_assignment\_id](#output\_role\_assignment\_id) | The Role Assignment ID |

## Module Usage
```
data "azurerm_subscription" "primary" {
}

data "azurerm_client_config" "example" {
}

# data "azurerm_management_group" "example" {
# }

data "azurerm_resource_group" "rg" {
  name = "cil-testing-001"
}

module "role_assignment" {
  source                                 = "../../module/module_role_assignment"
  role_assignment_name                   = var.role_assignment_name
  role_assignment_scope                  = data.azurerm_resource_group.rg.id
  role_definition_id                     = module.role_definition.role_definition_id
  ra_role_definition_name                = var.ra_role_definition_name
  principal_id                           = data.azurerm_client_config.example.object_id //var.principal_id
  rbac_condition                         = var.rbac_condition
  rbac_condition_version                 = var.rbac_condition_version
  delegated_managed_identity_resource_id = var.delegated_managed_identity_resource_id
  role_assignment_description            = var.role_assignment_description
  skip_service_principal_aad_check       = var.skip_service_principal_aad_check
}

module "role_definition" {
  source                            = "../../module/module_role_definition"
  role_definition_name              = var.role_definition_name
  scope                             = data.azurerm_resource_group.rg.id
  role_definition_description       = var.role_definition_description
  rdef_permissions                  = var.rdef_permissions
  rdef_permissions_actions          = var.rdef_permissions_actions
  rdef_permissions_data_actions     = var.rdef_permissions_data_actions
  rdef_permissions_not_actions      = var.rdef_permissions_not_actions
  rdef_permissions_not_data_actions = var.rdef_permissions_not_data_actions
  rdef_assignable_scopes            = [data.azurerm_resource_group.rg.id] //The value for scope is automatically included in this list if no other values supplied.
}

```

## Role Assignment : Terraform
* Please refer this link to understand more about Role Assignment configurations through terraform: [Role_Assignment_Terraform_Registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)

## Role Assignment : MSDOC
* Please refer this MSDOC link to understand more about Role Assignment: [Role_Assignment_MSDOC](https://learn.microsoft.com/en-US/Azure/role-based-access-control/role-assignments)

<!-- END_TF_DOCS -->