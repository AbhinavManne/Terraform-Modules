<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 26/08/2022
# <u> Introduction </u>
* You can use an Azure network security group to filter network traffic to and from Azure resources in an Azure virtual network. A network security group contains security rules that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources. For each rule, you can specify source and destination, port, and protocol.

## File Structure 
This particular module is having the following configuration files.
- network_security_group.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in network_security_group
- output.tf : This file is having all the resource output details generated.
- nsg_rules.csv : To set the Network Security Rule we are using the CSV file, we can define required NSG arguments in row and column format in CSV file.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>2.46 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_csv_file_name_for_NSG"></a> [csv\_file\_name\_for\_NSG](#input\_csv\_file\_name\_for\_NSG) | Name of the CSV file where Network Security Rule details defined. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_ids"></a> [nsg\_ids](#output\_nsg\_ids) | Ids for all Network Security Group in the form of list |

## Module Usage 
* You can call the specified Network Security Module module in any script where you want to integrate it.
```
#Reference to resource group creation module
module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "network_security_group" {

  source                = "../../modules/module_network-security-group"
  location              = module.module_create_resource_group.resource_group_location
  resource_group_name   = module.module_create_resource_group.resource_group_name
  csv_file_name_for_NSG = "../../modules/module_network-security-group/nsg_rules.csv"
  tags                  = var.tags
}

module "alert" {
  count = length(module.network_security_group.nsg_ids)
  source                   = "../../modules/module_alert"
  action_group_name        = "${var.action_group_name}-${count.index}"
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = "${var.short_name}-${count.index}"
  action_group_rule_name   = "${var.action_group_rule_name}-${count.index}"
  scope_type               = var.scope_type
  resource_id              = module.network_security_group.all_nsg_id[count.index]
  activity_log_alert_name  = "${var.activity_log_alert_name}-${count.index}"
  resource_group_id        = module.module_create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = "${var.metric_alert_name}-${count.index}"
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
  count = length(module.network_security_group.nsg_ids)
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = "${var.diag_name}-${count.index}"
  target_resource_id              = module.network_security_group.all_nsg_id[count.index]
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