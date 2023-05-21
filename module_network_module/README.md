<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 26/08/2022
# <u> Introduction </u>
*  This module helps us in provisioning various networking resources like Virrtual Network, Subnet, Firewall Subnet, Gateway Subnet, DDoS Protection Plan, Network Security Group Association and Route Table Association. 

* In the module, **ddos_protection_plan** for virtual network is optional, we have the three options for ddod_protection_plan :
<br> 1. Don't want to enable DDoS Protection Plan.
<br> 2. Wants to use an existing DDoS Protection Plan.
<br> 3. Wants to create a DDoS Protection Plan from this module and use it for the virtual network.

* Firewall Subnet and Gateway Subnet is optional, we can create these subnet by providing the value for  **firewall_subnet_address_prefix** and **gateway_subnet_address_prefix** respectively otherwise we can set those as null.

* We can create general subnet by this module. We just need to provide **subnet_prefixes** is the form of list.

* We can associate the NSG and Route Table with the virtual network by providing the map value **map_of_subnet_name_and_nsg_id** and **map_of_subnet_name_and_route_table_id** repectively, otherwise we can set those as null.

* Azure Firewall is optional in the module. We can enable it by providing **firewall_subnet_address_prefix**. It is recommeded to enable Azure Firewall as per security standard.

## File Structure 
This particular module is having the following configuration files.
- network_tables.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in network_module.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=2.46.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_firewall.firewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall) | resource |
| [azurerm_network_ddos_protection_plan.ddos_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.fw-snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.gw_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsgas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.route_table_as](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created. | `list(string)` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Allocation method for IP | `string` | n/a | yes |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | The BGP community attribute in format <as-number>:<community-value> | `string` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of IP addresses of DNS servers | `list(string)` | n/a | yes |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created. | `string` | `null` | no |
| <a name="input_enable_ddos_protection_plan1"></a> [enable\_ddos\_protection\_plan1](#input\_enable\_ddos\_protection\_plan1) | Enable/disable DDoS Protection Plan on Virtual Network. | `bool` | `true` | no |
| <a name="input_enable_flow_timeout_in_minutes"></a> [enable\_flow\_timeout\_in\_minutes](#input\_enable\_flow\_timeout\_in\_minutes) | Want to enable or disable the flow\_timeout\_in\_minutes | `bool` | `false` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Name of the firewall | `string` | n/a | yes |
| <a name="input_firewall_service_endpoints"></a> [firewall\_service\_endpoints](#input\_firewall\_service\_endpoints) | The list of Service endpoints to associate with the firewall subnet. | `list(string)` | <pre>[<br>  "Microsoft.AzureActiveDirectory",<br>  "Microsoft.AzureCosmosDB",<br>  "Microsoft.EventHub",<br>  "Microsoft.KeyVault",<br>  "Microsoft.ServiceBus",<br>  "Microsoft.Sql",<br>  "Microsoft.Storage"<br>]</pre> | no |
| <a name="input_firewall_sku_name"></a> [firewall\_sku\_name](#input\_firewall\_sku\_name) | sku\_name for firewall | `string` | n/a | yes |
| <a name="input_firewall_sku_tier"></a> [firewall\_sku\_tier](#input\_firewall\_sku\_tier) | sku\_tier for forewall | `string` | n/a | yes |
| <a name="input_firewall_subnet_address_prefix"></a> [firewall\_subnet\_address\_prefix](#input\_firewall\_subnet\_address\_prefix) | The address prefix to use for the subnet. | `list(string)` | <pre>[<br>  "10.0.4.0/24"<br>]</pre> | no |
| <a name="input_flow_timeout_in_minutes"></a> [flow\_timeout\_in\_minutes](#input\_flow\_timeout\_in\_minutes) | The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes. | `number` | `10` | no |
| <a name="input_gateway_service_endpoints"></a> [gateway\_service\_endpoints](#input\_gateway\_service\_endpoints) | The list of Service endpoints to associate with the gateway subnet. | `list(string)` | `[]` | no |
| <a name="input_gateway_subnet_address_prefix"></a> [gateway\_subnet\_address\_prefix](#input\_gateway\_subnet\_address\_prefix) | The address prefix to use for the gateway subnet | `list(string)` | `[]` | no |
| <a name="input_id_of_existing_ddos"></a> [id\_of\_existing\_ddos](#input\_id\_of\_existing\_ddos) | The Resource ID of DDoS Protection Plan. | `string` | n/a | yes |
| <a name="input_ip_config"></a> [ip\_config](#input\_ip\_config) | ip configuration | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_map_of_subnet_name_and_nsg_id"></a> [map\_of\_subnet\_name\_and\_nsg\_id](#input\_map\_of\_subnet\_name\_and\_nsg\_id) | A map of the subnet name as key and nsg id as respected value. | `map(string)` | n/a | yes |
| <a name="input_map_of_subnet_name_and_route_table_id"></a> [map\_of\_subnet\_name\_and\_route\_table\_id](#input\_map\_of\_subnet\_name\_and\_route\_table\_id) | A map of the subnet name as key and route table id as respected value. | `map(string)` | n/a | yes |
| <a name="input_network_ddos_protection_plan"></a> [network\_ddos\_protection\_plan](#input\_network\_ddos\_protection\_plan) | Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_endpoint_network_policies_enabled"></a> [private\_endpoint\_network\_policies\_enabled](#input\_private\_endpoint\_network\_policies\_enabled) | Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true. | `bool` | `true` | no |
| <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled) | Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true. | `bool` | `true` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Public ip name | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_service_endpoint_policy_ids"></a> [service\_endpoint\_policy\_ids](#input\_service\_endpoint\_policy\_ids) | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU for IP | `string` | n/a | yes |
| <a name="input_subnet_delegation"></a> [subnet\_delegation](#input\_subnet\_delegation) | A map of subnet name to delegation block on the subnet | `map(map(any))` | n/a | yes |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | A list of public subnets inside the vNet. | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | n/a | yes |
| <a name="input_threat_intel_mode"></a> [threat\_intel\_mode](#input\_threat\_intel\_mode) | threat intel mode | `string` | n/a | yes |
| <a name="input_virtual_network"></a> [virtual\_network](#input\_virtual\_network) | The name of the virtual network. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_filewall_id"></a> [filewall\_id](#output\_filewall\_id) | The ID of the Azure Firewall. |
| <a name="output_firewall_subnet_id"></a> [firewall\_subnet\_id](#output\_firewall\_subnet\_id) | The firewall subnet ID. |
| <a name="output_general_subnets_ids"></a> [general\_subnets\_ids](#output\_general\_subnets\_ids) | List of general subnet ID |
| <a name="output_virtual_network_id"></a> [virtual\_network\_id](#output\_virtual\_network\_id) | The virtual NetworkConfiguration ID. |

## Module Usage 
* You can call the specified Virtual Network module in any script where you want to integrate it.
```
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "virtual_network" {
  source                       = "../../modules/module_virtual-network-creation"
  resource_group_name          = module.create_resource_group.resource_group_name
  location                     = module.create_resource_group.resource_group_location
  virtual_network              = var.virtual_network
  address_space                = var.address_space
  dns_servers                  = var.dns_servers
  
  bgp_community = var.bgp_community
  edge_zone = var.edge_zone
  enable_flow_timeout_in_minutes = var.enable_flow_timeout_in_minutes
  flow_timeout_in_minutes = var.flow_timeout_in_minutes
  
  tags                         = var.tags
  enable_ddos_protection_plan1 = var.enable_ddos_protection_plan1
  id_of_existing_ddos = var.id_of_existing_ddos
  
  network_ddos_protection_plan = var.network_ddos_protection_plan

  firewall_subnet_address_prefix = var.firewall_subnet_address_prefix
  firewall_service_endpoints     = var.firewall_service_endpoints

  gateway_subnet_address_prefix = var.gateway_subnet_address_prefix
  gateway_service_endpoints     = var.gateway_service_endpoints

  subnet_names                                          = var.subnet_names
  subnet_prefixes                                       = var.subnet_prefixes
  subnet_service_endpoints                              = var.subnet_service_endpoints
  private_endpoint_network_policies_enabled = var.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoint_policy_ids = var.service_endpoint_policy_ids
  subnet_delegation = var.subnet_delegation

  map_of_subnet_name_and_nsg_id = var.map_of_subnet_name_and_nsg_id
  map_of_subnet_name_and_route_table_id = var.map_of_subnet_name_and_route_table_id

  public_ip_name    = var.public_ip_name
  allocation_method = var.allocation_method
  sku               = var.sku
  firewall_name     = var.firewall_name
  threat_intel_mode = var.threat_intel_mode
  firewall_sku_name = var.firewall_sku_name
  firewall_sku_tier = var.firewall_sku_tier
  ip_config         = var.ip_config
}

module "alert" {
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.virtual_network.virtual_network_id
  activity_log_alert_name = var.activity_log_alert_name
  resource_group_id       = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert      = var.category_log_alert
  metric_alert_name       = var.metric_alert_name
  storage_account_id      = var.storage_account_id
  metric_namespace        = var.metric_namespace
  metric_name             = var.metric_name
  aggregation             = var.aggregation
  operator                = var.operator
  threshold               = var.threshold
  dimension_name          = var.dimension_name
  dimension_operator      = var.dimension_operator
  values                  = var.values
}

module "diag_settings" {
  source                         = "../../modules/module_diagnostics_settings"
  enable_log_monitoring          = var.enable_log_monitoring
  diag_name                      = var.diag_name
  target_resource_id             = module.virtual_network.virtual_network_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_enabled                    = var.log_enabled
  log_retention_policy_enabled   = var.log_retention_policy_enabled
  log_retention_days             = var.log_retention_days
  metric_retention_policy_enabled= var.metric_retention_policy_enabled
  metric_retention_days          = var.metric_retention_days
}


```
<!-- END_TF_DOCS -->