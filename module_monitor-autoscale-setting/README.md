<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 18/11/2022
# <u> Introduction </u>
* This module provides the facility to provision Autoscale setting policies for Virtual machine Scale Set. In this module we have included all possible argument for autoscale setting policy.

## File Structure 
This particular module is having the following configuration files.
- autoscale.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in autoscale.tf
- output.tf : This file is having all the resource output details generated.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.31.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_autoscale_setting.autoscale_setting_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_default"></a> [capacity\_default](#input\_capacity\_default) | The number of instances that are available for scaling if metrics are not available for evaluation. The default is only used if the current instance count is lower than the default. Valid values are between 0 and 1000. | `string` | n/a | yes |
| <a name="input_capacity_maximum"></a> [capacity\_maximum](#input\_capacity\_maximum) | The maximum number of instances for this resource. Valid values are between 0 and 1000. | `string` | n/a | yes |
| <a name="input_capacity_minimum"></a> [capacity\_minimum](#input\_capacity\_minimum) | The minimum number of instances for this resource. Valid values are between 0 and 1000. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Specifies whether automatic scaling is enabled for the target resource. Defaults to true. | `bool` | `true` | no |
| <a name="input_fixed_date"></a> [fixed\_date](#input\_fixed\_date) | A fixed\_date block defined. This cannot be specified if a recurrence block is specified.  It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. Here, Optional Arguments are: <br><li>***timezone***<br>| <pre>object({<br>    end      = string<br>    start    = string<br>    timezone = string<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the AutoScale Setting should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_monitor_autoscale_setting_name"></a> [monitor\_autoscale\_setting\_name](#input\_monitor\_autoscale\_setting\_name) | The name of the AutoScale Setting. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_notification"></a> [notification](#input\_notification) | Specifies a notification block. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. Here, Optional Arguments are:<br><li>***webhook***<br><li>***send_to_subscription_administrator***<br><li>***send_to_subscription_co_administrator***<br><li>***custom_emails*** | <pre>object({<br>    send_to_subscription_administrator    = bool<br>    send_to_subscription_co_administrator = bool<br>    custom_emails                         = list(string)<br>    webhook = map(object({<br>      service_uri = string<br>      properties  = map(string)<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | Specifies the name of the profile. | `string` | n/a | yes |
| <a name="input_recurrence"></a> [recurrence](#input\_recurrence) | A recurrence block as defined below. This cannot be specified if a fixed\_date block is specified. | <pre>object({<br>    timezone = string<br>    minutes  = list(number)<br>    hours    = list(number)<br>    days     = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in the AutoScale Setting should be created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | One or more (up to 10) rule blocks can be defined. It is mandatory to pass all the parameters in the object. However, if you do not wish to pass custom values to the following optional parameter, please pass 'null' as input. Here, Optional Arguments are: <br><li>***metric_namespace***<li>***dimensions***<br><li>***divide_by_instance_count*** | <pre>map(object({<br>    metric_name        = string<br>    metric_resource_id = string<br>    operator           = string<br>    statistic          = string<br>    time_aggregation   = string<br>    time_grain         = string<br>    time_window        = string<br>    threshold          = number<br>    metric_namespace   = string<br>    dimensions = map(object({<br>      name     = string<br>      operator = string<br>      values   = list(string)<br>    }))<br>    divide_by_instance_count = bool<br>    cooldown                 = string<br>    direction                = string<br>    type                     = string<br>    value                    = string<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | Specifies the resource ID of the resource that the autoscale setting should be added to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_autoscale_setting_id"></a> [autoscale\_setting\_id](#output\_autoscale\_setting\_id) | Id of Autoscale Setting Policy |

## Module Usage 
* You can call the specified autoscale setting module in any script where you want to integrate it.

```
#Reference to monitor diagnostic settings creation module
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}
data "azurerm_virtual_machine_scale_set" "example" {
  name                = var.virtual_machine_scale_set_name
  resource_group_name = var.resource_group_name
}


module "module_create_monitor_autoscale_setting" {
  source                         = "../../modules/module_monitor-autoscale-setting"
  resource_group_name            = data.azurerm_resource_group.example.name
  location                       = data.azurerm_resource_group.example.location
  profile_name                   = var.profile_name
  monitor_autoscale_setting_name = var.monitor_autoscale_setting_name
  target_resource_id             = data.azurerm_virtual_machine_scale_set.example.id
  capacity_default               = var.capacity_default
  capacity_maximum               = var.capacity_maximum
  capacity_minimum               = var.capacity_minimum
  rules                          = var.rules
  fixed_date                     = var.fixed_date
  recurrence                     = var.recurrence
  enabled                        = var.enabled
  notification                   = var.notification
  tags                           = var.tags
}


```


<!-- END_TF_DOCS -->