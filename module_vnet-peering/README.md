<!-- BEGIN_TF_DOCS -->
#### last updated on : 23/09/2022

## Introduction
 
 This module helps to create virtual network peering across same region, different region within the same subscription.

* VNet peering - connecting VNets within the same Azure region
* Global VNet peering - connecting VNets across Azure regions

<u> Incase of Cross Subscription peering - connecting VNets across different subscriptions </u> :

 * We need to create multiple versions of the provider with alias them and then alias them on the resources.
 
 ```
  Provider details :
   provider "azurerm" {   // for subscription-1
     alias = "src"
     }
   provider "azurerm" {   // for subscription-2
     alias = "dst"
     }

```
<u> For eg : We can add the alias provider in resources like this </u>
  ```
  resource "azurerm_virtual_network_peering" "az_vnet_peering_source" {
    provider = azurerm.src
    name     = format("%s-%s-vnp", var.virtual_network_src_name, var.virtual_network_dest_name, )

  ```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.23.0 |



## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.vnet_peering_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet_peering_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_peerings"></a> [peerings](#input\_peerings) | n/a | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_peer-2"></a> [peer-2](#output\_peer-2) | n/a |
| <a name="output_peer_1"></a> [peer\_1](#output\_peer\_1) | n/a |


## Module Usage

```
#Reference to vnet peering module
module "vnet_peering_module" {
  source                 = "../../modules/module_vnet-peering"
  peerings               = var.peerings
}

```
<!-- END_TF_DOCS -->