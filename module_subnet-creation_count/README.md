<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 23/09/2022
# <u> Introduction </u>
*  This module helps us in provisioning multiple subnets in multiple virtual networks using Count approch.

## Note
* In count approach, we have to add or delete the subnet only at the last of subnets variable.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.22.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of object in which user have to define the detailes of Subnets. | <pre>list(object({<br>    virtual_network_name                          = string<br>    subnet_name                                   = string<br>    subnet_address_prefixes                       = list(string)<br>    subnet_service_endpoints                      = map(any)<br>    private_endpoint_network_policies_enabled     = bool<br>    private_link_service_network_policies_enabled = bool<br>    service_endpoint_policy_ids                   = list(string)<br>    subnet_delegation                             = map(map(any))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_namr_and_subnet_id"></a> [subnet\_namr\_and\_subnet\_id](#output\_subnet\_namr\_and\_subnet\_id) | Subnet Id with respected Subnet Name(subnet\_name-virtual\_network\_name). |

## Module Usage 
* You can call the specified Subnet module in any script where you want to integrate it.
```
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}
module "subnet" {
  source              = "../../modules/module_subnet-creation_count"
  resource_group_name = module.create_resource_group.resource_group_name
  subnets             = var.subnets
}

```

<!-- END_TF_DOCS -->