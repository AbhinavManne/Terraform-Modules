
#Reference to azure container registry creation module
module "container_registry" {
  source                      = "../../modules/module_azure-container-registry/container-registry"
  resource_group_name         = var.resource_group_name
  location                    = var.location
  container_registry_config   = var.container_registry_config
  georeplications             = var.georeplications
  tags                        = var.tags
  network_rule_set            = var.network_rule_set
  scope_map                   = var.scope_map
  container_registry_webhooks = var.container_registry_webhooks
  encryption                  = var.encryption
  retention_policy            = var.retention_policy
  enable_content_trust        = var.enable_content_trust
  agent_pool                  = var.agent_pool
  identity_type               = var.identity_type
  identity_ids                = var.identity_ids
}


module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

//----------------------------------------------------------------------------------//
// By default this module is optional
module "PrivateEndpointSql_module" {
  count               = var.create_private-endpoint ? 1 : 0
  source              = "../../modules/module_private_endpoint"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = var.private_connection_resource_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}

