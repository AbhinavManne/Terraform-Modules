#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

data "azurerm_virtual_machine" "example" {
  name                = var.virtual_machine_name
  resource_group_name = data.azurerm_resource_group.example.name
}

#To monitor CPU usage we will create a new schedule rule alert:
resource "azurerm_monitor_metric_alert" "cpu" {
  name                = "monitor-cpu-test-${var.environment}"
  resource_group_name = data.azurerm_resource_group.example.name
  scopes              = [data.azurerm_virtual_machine.example.id]
  description         = "Action will be triggered when Average CPU is greater than 85"

  severity = 1

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 85
  }

  action {
    action_group_id = var.resource_id
  }
}