module "PrivateEndpointSql_module" {
  source = "../../modules/module_private_endpoint"

  depends_on = [
    module.module_create_resource_group
  ]
  resource_group_name = module.module_create_resource_group.resource_group_name
  location = module.module_create_resource_group.resource_group_location
  subnet_id = var.subnet_id
  tags                = var.tags
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  subresource_names               = var.subresource_names
  is_manual_connection            = var.is_manual_connection
  request_message                 = var.request_message
  private_dns_zone_group = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id = var.private_connection_resource_id
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}
