#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

#deploy our log analyitics performance counters arm template
resource "random_string" "unique" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_template_deployment" "deploy_log_analyitics_linux_performance_counters" {
  name                = "linux-perf-counter-${random_string.unique.result}"
  resource_group_name = data.azurerm_resource_group.example.name
  template_body       = file("${path.module}/performance_counter.json")

  parameters = {
    "workspaceName" = "${var.log_workspace_name}"
    "location"      = "${data.azurerm_resource_group.example.location}"
  }

  deployment_mode = var.deployment_mode
}


