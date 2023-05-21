
integration_runtime_custom_name = "runtime123"
location                        = "east us"
data_factory_id                 = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourceGroups/common_rg/providers/Microsoft.DataFactory/factories/dfacto123"

integration_runtime_configuration = {

  cleanup_enabled         = true
  compute_type            = "General"
  core_count              = 8
  time_to_live_min        = 0
  virtual_network_enabled = false

}