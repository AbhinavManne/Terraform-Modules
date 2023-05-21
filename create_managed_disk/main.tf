module "managed_disk" {
  source                        = "../../modules/module_managed_disk"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  enable_disk_access            = var.enable_disk_access
  disk_access                   = var.disk_access
  disk_encryption_set_id        = var.disk_encryption_set_id
  managed_disk                  = var.managed_disk
  network_access_policy         = var.network_access_policy
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  virtual_machine_id            = var.virtual_machine_id
  data_disk_attachment          = var.data_disk_attachment
}

module "PrivateEndpoint_module" {
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  subnet_id                         = var.subnet_id
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name           //"${each.key}-${var.private_endpoint_name}"
  private_service_connection_name   = var.private_service_connection_name //"${each.key}-${var.private_service_connection_name}"
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
  private_connection_resource_id    = module.managed_disk.disk_access_id
}

