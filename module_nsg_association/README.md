<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 30/09/2022
# <u> Introduction </u>
* This module helps us to associate nsg to subnet

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet_network_security_group_association.nsgas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_name_and_nsg_id"></a> [subnet\_name\_and\_nsg\_id](#input\_subnet\_name\_and\_nsg\_id) | Map of Subnet name and NSG ID which we want to subnet. | `map(string)` | n/a | yes |
| <a name="input_subnet_name_and_subnet_id"></a> [subnet\_name\_and\_subnet\_id](#input\_subnet\_name\_and\_subnet\_id) | Map of Subnet Name and respective Subnet ID. | `map(string)` | n/a | yes |

## Module Usage 
* You can call the specified NSG Association module in any script where you want to integrate it.
```
module "nsg_association" {
  source = "../../modules/module_nsg_association"
  subnet_name_and_subnet_id = var.subnet_name_and_subnet_id
  subnet_name_and_nsg_id = var.subnet_name_and_nsg_id
}

```

<!-- END_TF_DOCS -->