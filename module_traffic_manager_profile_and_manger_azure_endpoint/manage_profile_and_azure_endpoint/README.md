<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/10/2022

##  Introduction 
This module provisions following resources- Traffic Manager Profile and Azure Endpoint

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_traffic_manager_azure_endpoint.manager_azure_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_azure_endpoint) | resource |
| [azurerm_traffic_manager_profile.traffic_manager_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_end_point_name"></a> [azure\_end\_point\_name](#input\_azure\_end\_point\_name) | value | `string` | n/a | yes |
| <a name="input_azure_end_point_weight"></a> [azure\_end\_point\_weight](#input\_azure\_end\_point\_weight) | value | `number` | Valid values are between 1 and 1000 | No |
| <a name="input_custom_header"></a> [custom\_header](#input\_custom\_header) | one or more custom\_header blocks | <pre>list(object({<br>           <br>        name = string<br>        value = string<br>    }))</pre> | Null | No |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Is the endpoint enabled? Defaults to true | `bool` | true | No |
| <a name="input_endpoint_custom_header"></a> [endpoint\_custom\_header](#input\_endpoint\_custom\_header) | one or more custom\_header blocks | <pre>list(object({<br>           <br>        name    = string<br>        value   = string<br>    }))</pre> | Null | No |
| <a name="input_expected_status_code_ranges"></a> [expected\_status\_code\_ranges](#input\_expected\_status\_code\_ranges) | A list of status code ranges in the format of 100-101 | `list(string)` | n/a | No |
| <a name="input_geo_mappings"></a> [geo\_mappings](#input\_geo\_mappings) | A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE | `list(string)` | Null | No |
| <a name="input_interval_in_seconds"></a> [interval\_in\_seconds](#input\_interval\_in\_seconds) | The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30 | `number` | 30 | No |
| <a name="input_max_return"></a> [max\_return](#input\_max\_return) | The amount of endpoints to return for DNS queries to this Profile. Possible values range from 1 to 8 | `number` |values range from 1 to 8 | No |
| <a name="input_path"></a> [path](#input\_path) | Path used by the monitoring checks | `string` | Null | No |
| <a name="input_port"></a> [port](#input\_port) | Port number used by the monitoring checks | `number` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of this Endpoint, this must be specified for Profiles using the Priority traffic routing method. Supports values between 1 and 1000, with no Endpoints sharing the same value. If omitted the value will be computed in order of creation | `number` | n/a | yes |
| <a name="input_profile_status"></a> [profile\_status](#input\_profile\_status) | The status of the profile, can be set to either Enabled or Disabled. Defaults to Enabled | `string` | Enabled | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Protocol used by the monitoring checks | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | One or more subnet blocks | <pre>list(object({<br><br>        first = string<br>        last  = string<br>        scope = number<br>    }))</pre> | null | No |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for traffic manager profile | `map(string)` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | ID of the public ip calling from other module | `string` | n/a | yes |
| <a name="input_timeout_in_seconds"></a> [timeout\_in\_seconds](#input\_timeout\_in\_seconds) |  If interval\_in\_seconds is set to 30, then timeout\_in\_seconds can be between 5 and 10. The default value is 10. If interval\_in\_seconds is set to 10, then valid values are between 5 and 9 and timeout\_in\_seconds is required | `number` | n/a | No |
| <a name="input_tolerated_number_of_failures"></a> [tolerated\_number\_of\_failures](#input\_tolerated\_number\_of\_failures) | Valid values are between 0 and 9. The default value is 3. | `number` | 3 | No |
| <a name="input_traffic_manager_profile_name"></a> [traffic\_manager\_profile\_name](#input\_traffic\_manager\_profile\_name) | Name of the Traffic Manager profile | `string` | n/a | yes |
| <a name="input_traffic_routing_method"></a> [traffic\_routing\_method](#input\_traffic\_routing\_method) | Specifies the algorithm used to route traffic, possible values are: Geographic, MultiValue, Performance, Priority, Subnet, Weighted | `string` | n/a | yes |
| <a name="input_traffic_view_enabled"></a> [traffic\_view\_enabled](#input\_traffic\_view\_enabled) | Indicates whether Traffic View is enabled for the Traffic Manager profile | `bool` | Null | No |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL value of the Profile used by Local DNS resolvers and clients. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_end_point_id"></a> [azure\_end\_point\_id](#output\_azure\_end\_point\_id) | n/a |
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |
<!-- END_TF_DOCS -->