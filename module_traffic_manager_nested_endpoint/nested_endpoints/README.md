<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/10/2022

##  Introduction 
This module provisions following resources- Manages a Nested Endpoint within a Traffic Manager Profile.

## File Structure 
This particular module is having the following configuration files.
- traffic_manager_nested_endpoint.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in traffic_manager_nested_endpoint.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_nested_endpoint) | resource |
| [azurerm_traffic_manager_profile.nested](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |
| [azurerm_traffic_manager_profile.parent](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_header"></a> [custom\_header](#input\_custom\_header) | One or more custom_header blocks | <pre>list(object({<br> <br> name = string<br>value = string<br>    }))</pre> | null  | No |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the endpoint enabled | `bool` | Defaults to true | No |
| <a name="input_endpoint_location"></a> [endpoint\_location](#input\_endpoint\_location) | location of the endpoint | `string` | null | No |
| <a name="input_geo_mappings"></a> [geo\_mappings](#input\_geo\_mappings) | A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE | `list(string)` | null | No |
| <a name="input_interval_in_seconds"></a> [interval\_in\_seconds](#input\_interval\_in\_seconds) |  You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30 | `number` | default value = 30 |  No |
| <a name="input_max_return"></a> [max\_return](#input\_max\_return) | Possible values range from 1 to 8 | `number` | values range from 1 to 8 | No |
| <a name="input_minimum_child_endpoints"></a> [minimum\_child\_endpoints](#input\_minimum\_child\_endpoints) | This argument specifies the minimum number of endpoints and his value must be larger than 0 | `number` | value must be larger than 0. | yes |
| <a name="input_minimum_required_child_endpoints_ipv4"></a> [minimum\_required\_child\_endpoints\_ipv4](#input\_minimum\_required\_child\_endpoints\_ipv4) | value | `number` | null | No |
| <a name="input_minimum_required_child_endpoints_ipv6"></a> [minimum\_required\_child\_endpoints\_ipv6](#input\_minimum\_required\_child\_endpoints\_ipv6) | value | `number` | null | No |
| <a name="input_name"></a> [name](#input\_name) | name of the nested endpoint | `string` | n/a | yes |
| <a name="input_nested_max_return"></a> [nested\_max\_return](#input\_nested\_max\_return) | Possible values range from 1 to 8 | `number` | values range from 1 to 8 | no |
| <a name="input_nested_path"></a> [nested\_path](#input\_nested\_path) | The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP. | `string` | null | No |
| <a name="input_nested_port"></a> [nested\_port](#input\_nested\_port) | Port number used by the monitoring checks | `number` | n/a | yes |
| <a name="input_nested_profile_name"></a> [nested\_profile\_name](#input\_nested\_profile\_name) | name of the nested profile name | `string` | n/a | yes |
| <a name="input_nested_protocol"></a> [nested\_protocol](#input\_nested\_protocol) | The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP | `string` | n/a | yes |
| <a name="input_nested_traffic_routing_method"></a> [nested\_traffic\_routing\_method](#input\_nested\_traffic\_routing\_method) | Specifies the algorithm used to route traffic, possible values are:Geographic,MultiValue, MultiValue, Performance, Priority, Subnet, Weighted | `string` | n/a | yes |
| <a name="input_nested_ttl"></a> [nested\_ttl](#input\_nested\_ttl) | The TTL value of the Profile used by Local DNS resolvers and clients. | `number` | n/a | yes |
| <a name="input_parent_profile_name"></a> [parent\_profile\_name](#input\_parent\_profile\_name) | name of the parent profile name | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP. | `string` | null | No |
| <a name="input_port"></a> [port](#input\_port) | Port number used by the monitoring checks | `number` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Supports values between 1 and 1000 | `number` | values between 1 and 1000 | No |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | name of the resource group | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | <pre>list(object({<br><br>        first = string<br>        last  = string<br>        scope = number<br>    }))</pre> | null | No |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for traffic manager profile | `map(string)` | n/a | yes |
| <a name="input_timeout_in_seconds"></a> [timeout\_in\_seconds](#input\_timeout\_in\_seconds) | . If interval\_in\_seconds is set to 30, then timeout\_in\_seconds can be between 5 and 10. The default value is 10. If interval\_in\_seconds is set to 10, then valid values are between 5 and 9 and timeout\_in\_seconds is required | `number` | n/a | No |
| <a name="input_tolerated_number_of_failures"></a> [tolerated\_number\_of\_failures](#input\_tolerated\_number\_of\_failures) | Valid values are between 0 and 9. The default value is 3. | `number` | default value is 3 | No |
| <a name="input_traffic_routing_method"></a> [traffic\_routing\_method](#input\_traffic\_routing\_method) | Specifies the algorithm used to route traffic, possible values are:Geographic,MultiValue, MultiValue, Performance, Priority, Subnet, Weighted | `string` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL value of the Profile used by Local DNS resolvers and clients. | `number` | n/a | yes |
| <a name="input_weight"></a> [weight](#input\_weight) | Profiles using the Weighted traffic routing method. Valid values are between 1 and 1000 | `number` | Valid values are between 1 and 1000  | No |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nested_endpoint_id"></a> [nested\_endpoint\_id](#output\_nested\_endpoint\_id) | n/a |
| <a name="output_nested_id"></a> [nested\_id](#output\_nested\_id) | n/a |
| <a name="output_parent_id"></a> [parent\_id](#output\_parent\_id) | n/a |
<!-- END_TF_DOCS -->