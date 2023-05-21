create_resource_group                     = false
eventgrid_name                            = "myeg"
location                                  = "east us"
resource_group_name                       = "Azure_CIL_Common"
input_schema                              = "CloudEventSchemaV1_0"
public_network_access_enabled             = true
local_auth_enabled                        = true
auto_create_topic_with_first_subscription = true
auto_delete_topic_with_last_subscription  = true
tags = {
  "Contact_person" : "abc"
  "cost_center" : 999
  "Application Name" : "Event_Grid_Domain"
}
managed_identity_type               = "SystemAssigned"
managed_identity_ids                = null
enable_input_mapping_fields         = null
enable_input_mapping_default_values = null
inbound_ip_rule = [{
  action  = "Allow"
  ip_mask = "10.0.0.1/16"
}]
eventgrid_domain_topic_name = "my-eventgrid-domain-topic"                          