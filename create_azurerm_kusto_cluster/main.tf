module "kusto_cluster" {
  source = "../../modules/module_azurerm_kusto_cluster"

  kusto_cluster                         = var.kusto_cluster
  location                              = var.location
  resource_group_name                   = var.resource_group_name
  sku_name                              = var.sku_name
  allowed_ip_ranges                     = var.allowed_ip_ranges
  double_encryption_enabled             = var.double_encryption_enabled
  identity_ids                          = var.identity_ids
  identity_type                         = var.identity_type
  auto_stop_enabled                     = var.auto_stop_enabled
  disk_encryption_enabled               = var.disk_encryption_enabled
  streaming_ingestion_enabled           = var.streaming_ingestion_enabled
  public_ip_type                        = var.public_ip_type
  public_network_access_enabled         = var.public_network_access_enabled
  outbound_network_access_restricted    = var.outbound_network_access_restricted
  purge_enabled                         = var.purge_enabled
  virtual_network_configuration         = var.virtual_network_configuration
  subnet_id                             = var.subnet_id
  engine_public_ip_id                   = var.engine_public_ip_id
  data_management_public_ip_id          = var.data_management_public_ip_id
  language_extensions                   = var.language_extensions
  optimized_auto_scale                  = var.optimized_auto_scale
  minimum_instances                     = var.minimum_instances
  maximum_instances                     = var.maximum_instances
  trusted_external_tenants              = var.trusted_external_tenants
  zones                                 = var.zones
  engine                                = var.engine
  capacity                              = var.capacity
  tags                                  = var.tags
  
  
}


