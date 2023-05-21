<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 23/09/2022
# <u> Introduction </u>
*  This module helps us in provisioning multiple virtual network.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | Details of Virtual Network. | <pre>map(object({<br>    virtual_network_address_space = list(string)<br>    bgp_community                 = string<br>    dns_servers                   = list(string)<br>    edge_zone                     = string<br>    flow_timeout_in_minutes       = string<br>    enable_ddos_protection_plan   = bool<br>    id_of_existing_ddos           = string<br>    virtual_network_tags          = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_name_and_vnet_id"></a> [vnet\_name\_and\_vnet\_id](#output\_vnet\_name\_and\_vnet\_id) | Map of Vnet IDs with respect to Vnet name. |

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
module "vnet" {
  source              = "../../modules/module_virtual_network_for_each"
  location            = module.create_resource_group.resource_group_location
  resource_group_name = module.create_resource_group.resource_group_name
  vnet                = var.vnet
}

module "alert" {
  for_each                 = module.vnet.vnet_name_and_vnet_id
  source                   = "../../modules/module_alert"
  action_group_name        = "${each.key}-${var.action_group_name}"
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = "${each.key}-${var.short_name}"
  action_group_rule_name   = "${each.key}-${var.action_group_rule_name}"
  scope_type               = var.scope_type
  resource_id              = each.value
  activity_log_alert_name  = "${each.key}-${var.activity_log_alert_name}"
  resource_group_id        = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = "${each.key}-${var.metric_alert_name}"
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

module "diag_settings" {
  for_each                        = module.vnet.vnet_name_and_vnet_id
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = "${each.key}-${var.diag_name}"
  target_resource_id              = each.value
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}

```

<!-- END_TF_DOCS -->