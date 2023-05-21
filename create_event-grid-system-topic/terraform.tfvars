create_resource_group       = false
resource_group_name         = "Azure_CIL_Common"
location                    = "east us"
eventgrid_system_topic_name = "demo-egst"
source_arm_resource_id      = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourcegroups/Azure_CIL_Common/providers/Microsoft.Storage/storageAccounts/storaccmoh"
topic_type                  = "Microsoft.Storage.StorageAccounts"
tags = {
  "Contact_person" : "abc"
  "cost_center" : 999
  "Application Name" : "Event_Grid_system_topic"
}
managed_identity_type                          = "SystemAssigned"
eventgrid_system_topic_event_subscription_name = "demoegstes"
event_delivery_schema                          = "EventGridSchema"
eventhub_endpoint_id                           = null
hybrid_connection_endpoint_id                  = null
service_bus_queue_endpoint_id                  = null
service_bus_topic_endpoint_id                  = null
included_event_types                           = null
labels                                         = ["abc", "xyz"]
advanced_filtering_on_arrays_enabled           = false
queue_name                                     = "demoqueue"
storage_account_id                             = "/subscriptions/dcd2c118-9f88-4a53-8b1b-fbc235ad0bef/resourcegroups/Azure_CIL_Common/providers/Microsoft.Storage/storageAccounts/storaccmoh"
queue_message_time_to_live_in_seconds          = 60
url                                            = null
enable_subject_filter                          = true
subject_begins_with                            = "abc"
subject_ends_with                              = "n"
case_sensitive                                 = true
delivery_identity_type                         = "SystemAssigned"
delivery_property = [{
  header_name  = "demoheader"
  secret       = false
  source_field = null
  type         = "Static"
  value        = "abc"
}]
dead_letter_identity_type                      = "SystemAssigned"
storage_blob_container_name                    = "democontainer"
max_delivery_attempts                          = 2
event_time_to_live                             = 1440