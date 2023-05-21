<!-- BEGIN_TF_DOCS -->
Last Updated[DD/MM/YYYY]: 14/10/2022
# <u> Introduction </u>
* This module provides the facility to provision network watcher flow log. In this module we have included all possible argument for network watcher flow log.

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
| [azurerm_network_watcher_flow_log.nw_flow_log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location where the Network Watcher Flow Log resides. | `string` | `null` | no |
| <a name="input_nw_flow_log"></a> [nw\_flow\_log](#input\_nw\_flow\_log) | One or more Custom rules in azure. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input.<br>    Below listed parameters in the object are optional.<br><li>***traffic\_analytics***<br><li>***version***<br><li>***interval\_in\_minutes***<br><li>***log\_analytics\_workspace\_id***<br><li>***log\_analytics\_workspace\_region***<br><li>***log\_analytics\_workspace\_resource\_id***<br><li>***tags***<br><li>***location*** <br> | <pre>map(object({<br>    network_watcher_name                = string<br>    network_security_group_id           = string<br>    storage_account_id                  = string<br>    tags                                = map(string)<br>    version                             = number<br>    retention_policy_enabled            = bool<br>    retention_policy_days               = number<br>    traffic_analytics_enabled           = bool<br>    log_analytics_workspace_id          = string<br>    log_analytics_workspace_region      = string<br>    log_analytics_workspace_resource_id = string<br>    interval_in_minutes                 = number<br>    network_watcher_flow_logs_enabled   = bool<br>    log_analytics_workspace             = string<br><br>  }))</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Network Watcher was deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nw_flow_log_id"></a> [nw\_flow\_log\_id](#output\_nw\_flow\_log\_id) | flow log |
| <a name="output_nw_flow_log_name"></a> [nw\_flow\_log\_name](#output\_nw\_flow\_log\_name) | flow log |
| <a name="output_nw_flow_log_name_and_nw_flow_log_id"></a> [nw\_flow\_log\_name\_and\_nw\_flow\_log\_id](#output\_nw\_flow\_log\_name\_and\_nw\_flow\_log\_id) | flow log |

# module usage
```
variable "nw_flow_log" {
  type = map(object({
    network_watcher_name                = string
    network_security_group_id           = string
    storage_account_id                  = string
    network_watcher_flow_logs_enabled   = bool
    retention_policy_enabled            = bool
    retention_policy_days               = number
    ## optional arguments
    location                            = var.location
    traffic_analytics_enabled           = bool
    log_analytics_workspace_id          = string
    log_analytics_workspace_region      = string
    log_analytics_workspace_resource_id = string
    interval_in_minutes                 = number
    log_analytics_workspace             = string
    tags                                = map(string)
    version                             = number

  }))

  ```
<!-- END_TF_DOCS -->