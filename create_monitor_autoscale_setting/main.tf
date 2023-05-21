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
