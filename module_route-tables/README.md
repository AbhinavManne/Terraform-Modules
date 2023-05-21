<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 26/08/2022
# <u> Introduction </u>
* Azure automatically routes traffic between Azure subnets, virtual networks, and on-premises networks. If you want to change any of Azure's default routing, you do so by creating a route table.

## File Structure 
This particular module is having the following configuration files.
- route_tables.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in route_tables.tf
- output.tf : This file is having all the resource output details generated.
- routes.csv : To set the Route Rule we are using the CSV file, we can define required Route Table arguments in row and column format in CSV file.

## Note

* In CSV file **next_hop_in_ip_address** argument contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the **next_hop_type** is **VirtualAppliance**.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>2.46 |

## Resources

| Name | Type |
|------|------|
| [azurerm_route_table.rt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_csv_file_name_for_Route_Table"></a> [csv\_file\_name\_for\_Route\_Table](#input\_csv\_file\_name\_for\_Route\_Table) | Name of the CSV file where Route Table details defined. | `string` | n/a | yes |
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of Route Table | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group in which Route Table present | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_rt_id"></a> [all\_rt\_id](#output\_all\_rt\_id) | Output of all route table Id in the form of list |

## Module Usage 
* You can call the specified Network Security Module module in any script where you want to integrate it.
```
 
#Reference to resource group creation module
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "route_table" {

  source                        = "../../modules/module_route-tables"
  csv_file_name_for_Route_Table = "../../modules/module_route-tables/routes.csv"
  location                      = module.create_resource_group.resource_group_location
  resource_group_name           = module.create_resource_group.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags
}

module "alert" {
  depends_on = [
    module.route_table
  ]
  count = length(module.route_table.rt_ids)
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.route_table.rt_ids[count.index]
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

```

<!-- END_TF_DOCS -->