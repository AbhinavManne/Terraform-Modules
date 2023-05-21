<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 10/10/2022

## Introduction

This module helps us to provision the firewall NAT Rules within a firewall. These rules are stored in a csv file along with the necessary arguments, Here this csv file is used to provision all the NAT rules.

## File Structure 

This particular module is having the following configuration files.
- firewall-NATrules.tf : This file is having the terraform code to provision the resources as per requirements.
- Variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in firewall-NATrules.tf

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall_nat_rule_collection.nat_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_nat_rule_collection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_csv_file_name"></a> [csv\_file\_name](#input\_csv\_file\_name) | csv file name | `string` | n/a | yes |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Firewall name in Azure | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | RG name in Azure | `string` | n/a | yes |

## Module Usage

```
module "firewall-NATnrules_module" {
  source = "../../modules/module_firewall-NATrules/firewall-natrules"
  depends_on = [
    module.firewall_module
  ]
  resource_group_name = var.resource_group_name
  firewall_name       = var.firewall_name

}
```
<!-- END_TF_DOCS -->