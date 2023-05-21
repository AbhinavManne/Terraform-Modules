<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/10/2022

##  Introduction 
This module provisions following resources- Manages an External Endpoint

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.27.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_traffic_manager_external_endpoint.manager_external_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_external_endpoint) | resource |
| [azurerm_traffic_manager_profile.manager_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_header"></a> [custom\_header](#input\_custom\_header) | One or more custom\_header blocks | <pre>list(object({<br>           <br>        name = string<br>        value = string<br>    }))</pre> | Null | No |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | enable value | `bool` | n/a | yes |
| <a name="input_endpoint_location"></a> [endpoint\_location](#input\_endpoint\_location) | location of the endpoint | `string` | true | No |
| <a name="input_external_endpoint_name"></a> [external\_endpoint\_name](#input\_external\_endpoint\_name) | Name of the endpoint | `string` | n/a | yes |
| <a name="input_geo_mappings"></a> [geo\_mappings](#input\_geo\_mappings) | A list of Geographic Regions used to distribute traffic, such as WORLD, UK or DE | `list(string)` | Null | No |
| <a name="input_interval_in_seconds"></a> [interval\_in\_seconds](#input\_interval\_in\_seconds) | The interval used to check the endpoint health from a Traffic Manager probing agent. You can specify two values here: 30 (normal probing) and 10 (fast probing). The default value is 30 | `number` | 30 | No |
| <a name="input_max_return"></a> [max\_return](#input\_max\_return) | Possible values range from 1 to 8 | `number` | values range from 1 to 8 | No |
| <a name="input_path"></a> [path](#input\_path) | The path used by the monitoring checks. Required when protocol is set to HTTP or HTTPS - cannot be set when protocol is set to TCP. | `string` | Null | No |
| <a name="input_port"></a> [port](#input\_port) | Port number used by the monitoring checks | `number` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | valid values are between 1 and 1000 | `number` | values are between 1 and 1000 | No |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | name of the traffic manager profile | `string` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The protocol used by the monitoring checks, supported values are HTTP, HTTPS and TCP | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | One or more subnet blocks | <pre>list(object({<br><br>        first = string<br>        last  = string<br>        scope = number<br>    }))</pre> | n/a | No |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for traffic manager profile | `map(string)` | n/a | yes |
| <a name="input_target"></a> [target](#input\_target) | The FQDN DNS name of the target | `string` | n/a | yes |
| <a name="input_timeout_in_seconds"></a> [timeout\_in\_seconds](#input\_timeout\_in\_seconds) | If interval\_in\_seconds is set to 30, then timeout\_in\_seconds can be between 5 and 10. The default value is 10. If interval\_in\_seconds is set to 10, then valid values are between 5 and 9 and timeout\_in\_seconds is required | `number` | n/a | No |
| <a name="input_tolerated_number_of_failures"></a> [tolerated\_number\_of\_failures](#input\_tolerated\_number\_of\_failures) | Valid values are between 0 and 9. The default value is 3. | `number` | 3 | No |
| <a name="input_traffic_routing_method"></a> [traffic\_routing\_method](#input\_traffic\_routing\_method) | Specifies the algorithm used to route traffic, possible values are:Geographic,MultiValue, MultiValue, Performance, Priority, Subnet, Weighted | `string` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | The TTL value of the Profile used by Local DNS resolvers and clients. | `number` | n/a | yes |
| <a name="input_weight"></a> [weight](#input\_weight) | valid values are between 1 and 1000. | `number` | values are between 1 and 1000 | No |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_profile_id"></a> [profile\_id](#output\_profile\_id) | n/a |
| <a name="output_traffic_manager_external_endpoint_id"></a> [traffic\_manager\_external\_endpoint\_id](#output\_traffic\_manager\_external\_endpoint\_id) | n/a |
| <a name="output_traffic_manager_external_endpoint_name"></a> [traffic\_manager\_external\_endpoint\_name](#output\_traffic\_manager\_external\_endpoint\_name) | n/a |
<!-- END_TF_DOCS -->