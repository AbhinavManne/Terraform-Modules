module "azure_eventgrid_domain" {
  source                                    = "../../modules/module_event-grid-domain/event-grid-domain"
  eventgrid_name                            = var.eventgrid_name
  location                                  = module.module_create_resource_group.resource_group_location
  resource_group_name                       = module.module_create_resource_group.resource_group_name
  input_schema                              = var.input_schema
  public_network_access_enabled             = var.public_network_access_enabled
  local_auth_enabled                        = var.local_auth_enabled
  auto_create_topic_with_first_subscription = var.auto_create_topic_with_first_subscription
  auto_delete_topic_with_last_subscription  = var.auto_delete_topic_with_last_subscription
  tags                                      = var.tags
  managed_identity_type                     = var.managed_identity_type
  managed_identity_ids                      = var.managed_identity_ids
  enable_input_mapping_fields               = var.enable_input_mapping_fields
  input_mapping_fields_id                   = var.input_mapping_fields_id
  input_mapping_fields_topic                = var.input_mapping_fields_topic
  input_mapping_fields_event_type           = var.input_mapping_default_values_event_type
  input_mapping_fields_time                 = var.input_mapping_fields_time
  input_mapping_fields_data_version         = var.input_mapping_fields_data_version
  input_mapping_fields_subject              = var.input_mapping_fields_subject
  enable_input_mapping_default_values       = var.enable_input_mapping_default_values
  input_mapping_default_values_event_type   = var.input_mapping_default_values_event_type
  input_mapping_default_values_data_version = var.input_mapping_default_values_data_version
  input_mapping_default_values_data_subject = var.input_mapping_default_values_data_subject
  inbound_ip_rule                           = var.inbound_ip_rule
  eventgrid_domain_topic_name               = var.eventgrid_domain_topic_name
}

module "module_create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}