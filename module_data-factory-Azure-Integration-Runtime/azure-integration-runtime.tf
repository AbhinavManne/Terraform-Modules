resource "azurerm_data_factory_integration_runtime_azure" "integration_runtime" {

  data_factory_id = var.data_factory_id
  name            = var.integration_runtime_custom_name
  location        = var.location
  description     = var.integration_runtime_description != null ? var.integration_runtime_description : null

  cleanup_enabled         = lookup(var.integration_runtime_configuration, "cleanup_enabled", true)
  compute_type            = lookup(var.integration_runtime_configuration, "compute_type", "General")
  core_count              = lookup(var.integration_runtime_configuration, "core_count", 8)
  time_to_live_min        = lookup(var.integration_runtime_configuration, "time_to_live_min", 0)
  virtual_network_enabled = lookup(var.integration_runtime_configuration, "virtual_network_enabled", false)
}