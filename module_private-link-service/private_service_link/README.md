<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 20/10/2022
# <u> Introduction </u>
* This module provides the facility to provision private service link. In this module we have included all possible argument for private service link.

## File Structure 
This particular module is having the following configuration files.
- main.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_link_service.ls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_approval_subscription_ids"></a> [auto\_approval\_subscription\_ids](#input\_auto\_approval\_subscription\_ids) | A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service. | `list (string)` | `null` | no |
| <a name="input_enable_proxy_protocol"></a> [enable\_proxy\_protocol](#input\_enable\_proxy\_protocol) | Should the Private Link Service support the Proxy Protocol? Defaults to false. | `bool` | `false` | no |
| <a name="input_fqdns"></a> [fqdns](#input\_fqdns) | List of FQDNs allowed for the Private Link Service. | `list(string)` | `null` | no |
| <a name="input_load_balancer_frontend_ip_configuration_ids"></a> [load\_balancer\_frontend\_ip\_configuration\_ids](#input\_load\_balancer\_frontend\_ip\_configuration\_ids) | A list of Frontend IP Configuration IDs from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running. | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists | `string` | n/a | yes |
| <a name="input_nat_ip_configuration"></a> [nat\_ip\_configuration](#input\_nat\_ip\_configuration) | Specifies the name which should be used for the NAT IP Configuration. | `string` | n/a | yes |
| <a name="input_primary"></a> [primary](#input\_primary) | Is this is the Primary IP Configuration? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Specifies a Private Static IP Address for this IP Configuration. | `string` | `null` | no |
| <a name="input_private_ip_address_version"></a> [private\_ip\_address\_version](#input\_private\_ip\_address\_version) | The version of the IP Protocol which should be used. At this time the only supported value is IPv4. Defaults to IPv4. | `string` | `"IPv4"` | no |
| <a name="input_private_link_service"></a> [private\_link\_service](#input\_private\_link\_service) | Specifies the name of this Private Link Service. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Private Link Service should exist. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the ID of the Subnet which should be used for the Private Link Service. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. Changing this forces a new resource to be created. | `map(string)` | n/a | yes |
| <a name="input_visibility_subscription_ids"></a> [visibility\_subscription\_ids](#input\_visibility\_subscription\_ids) | A list of Subscription UUID/GUID's that will be able to see this Private Link Service. | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_link_service_id"></a> [private\_link\_service\_id](#output\_private\_link\_service\_id) | ID of private link service |
## module
  ```
  module "azurerm_private_link_service" {
  source                                      = "../../modules/module_private-link-service/private_service_link"
  resource_group_name                         = var.resource_group_name
  private_link_service                        = var.private_link_service
  location                                    = var.location
  auto_approval_subscription_ids              = var.auto_approval_subscription_ids
  enable_proxy_protocol                       = var.enable_proxy_protocol
  fqdns                                       = var.fqdns
  visibility_subscription_ids                 = var.visibility_subscription_ids
  load_balancer_frontend_ip_configuration_ids = var.load_balancer_frontend_ip_configuration_ids
  tags                                        = var.tags
  nat_ip_configuration                        = var.nat_ip_configuration
  private_ip_address                          = var.private_ip_address
  private_ip_address_version                  = var.private_ip_address_version
  subnet_id                                   = var.subnet_id
  primary                                     = var.primary
```
<!-- END_TF_DOCS -->