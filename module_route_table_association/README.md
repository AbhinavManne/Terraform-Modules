<!-- BEGIN_TF_DOCS -->
<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 03/10/2022
# <u> Introduction </u>
* This module helps us to associate route table to subnet.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet_route_table_association.rtas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_name_and_rt_id"></a> [subnet\_name\_and\_rt\_id](#input\_subnet\_name\_and\_rt\_id) | Map of Subnet name and NSG ID which we want to subnet. | `map(string)` | n/a | yes |
| <a name="input_subnet_name_and_subnet_id"></a> [subnet\_name\_and\_subnet\_id](#input\_subnet\_name\_and\_subnet\_id) | Map of Subnet name and RT ID which we want to subnet. | `map(string)` | n/a | yes |

## Module Usage 
* You can call the specified Route Table Association module in any script where you want to integrate it.
```
module "rt_association" {
  source = "../../modules/module_route_table_association"
  subnet_name_and_subnet_id = var.subnet_name_and_subnet_id
  subnet_name_and_rt_id = var.subnet_name_and_rt_id
}

```


<!-- END_TF_DOCS -->