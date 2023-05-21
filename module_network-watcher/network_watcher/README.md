<!-- BEGIN_TF_DOCS -->
 Last Updated[DD/MM/YYYY]: 10/10/2022
# <u> Introduction </u>
* This module provides the facility to provision network network_watcher. In this module we have included all possible argument for network_watcher.

## File Structure 
This particular module is having the following configuration files.
- network_watcher.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in network_watcher.tf
- output.tf : This file is having all the resource output details generated.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules
```  
module "network_watcher_module" {
  source              = "../../modules/module_network_watcher/network_watcher"
  network_watcher     = var.network_watcher
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.location

}
```


## Resources

| Name | Type |
|------|------|
| [azurerm_network_watcher.network_watcher](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_watcher"></a> [network\_watcher](#input\_network\_watcher) | The name of the Network Watcher. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Network Watcher was deployed. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
<!-- END_TF_DOCS -->