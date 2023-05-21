resource "azurerm_kusto_cluster" "kusto_cluster" {
  name                               = var.kusto_cluster
  location                           = var.location
  resource_group_name                = var.resource_group_name
  allowed_fqdns                      = var.allowed_fqdns
  allowed_ip_ranges                  = var.allowed_ip_ranges
  double_encryption_enabled          = var.double_encryption_enabled
  auto_stop_enabled                  = var.auto_stop_enabled
  disk_encryption_enabled            = var.disk_encryption_enabled
  streaming_ingestion_enabled        = var.streaming_ingestion_enabled
  public_network_access_enabled      = var.public_network_access_enabled
  public_ip_type                     = var.public_ip_type
  outbound_network_access_restricted = var.outbound_network_access_restricted
  purge_enabled                      = var.purge_enabled
  engine                             = var.engine
  zones                              = var.zones
  trusted_external_tenants           = var.trusted_external_tenants
  language_extensions                = var.language_extensions
  tags                               = var.tags
  

  sku {
    name     = var.sku_name
    capacity = var.capacity
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  dynamic "virtual_network_configuration" {
    for_each = var.virtual_network_configuration ? [1] : []
    content {
      subnet_id                    = var.subnet_id
      engine_public_ip_id          = var.engine_public_ip_id
      data_management_public_ip_id = var.data_management_public_ip_id
    }
  }

  dynamic "optimized_auto_scale" {
    for_each = var.optimized_auto_scale ? [1] : []
    content {
      minimum_instances = var.minimum_instances
      maximum_instances = var.maximum_instances
    }
  }


}



