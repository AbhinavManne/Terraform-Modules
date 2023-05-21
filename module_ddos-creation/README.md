<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 01/10/2022
# <u> Introduction </u>
* This module helps us in provisioning multiple DDos Protection Plan.
* If user wants to create multiple DDos Protection Plan, they can use for_each while calling the module(Check in create_enable_ddos folder).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_ddos_protection_plan.ddos](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ddos_plan_name"></a> [ddos\_plan\_name](#input\_ddos\_plan\_name) | Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ddos_id"></a> [ddos\_id](#output\_ddos\_id) | DDos Plan id |
| <a name="output_ddos_name"></a> [ddos\_name](#output\_ddos\_name) | DDos Plan value |

## Module Usage 
* You can call the specified DDos Protection Plan module in any script where you want to integrate it.
```
 module "ddos_module" {
  for_each = var.ddos
  source = "../../modules/module_ddos-creation"
  ddos_plan_name = each.key
  location = lookup(each.value, "location")
  resource_group_name = lookup(each.value, "resource_group_name")
  tags = lookup(each.value, "tags")
}

locals {
  ddos_name_and_ddos_id = {
    for index, d in module.ddos_module :
    d.ddos_name => d.ddos_id
  }
}

```


<!-- END_TF_DOCS -->