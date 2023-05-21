locals {
  create_private_dns_zone_group = var.private_dns_zone_group != null ? true : false
}

####--------------------------------------------------------------------------------------#####
#  subnet id is mandatory for creating private endpoint 
#---------------------------------------------------------------------------------------
resource "azurerm_private_endpoint" "endpoint" {

  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  tags                = var.tags

  private_service_connection {
    // either specify private_connection_resource_id or private_connection_resource_alias
    name                              = var.private_service_connection_name
    private_connection_resource_id    = var.private_connection_resource_id != null ? var.private_connection_resource_id : null //optional
    is_manual_connection              = var.is_manual_connection
    subresource_names                 = var.subresource_names
    request_message                   = var.is_manual_connection == true ? var.request_message : null
    private_connection_resource_alias = var.private_connection_resource_alias != null ? var.private_connection_resource_alias : null //optional
  }

  dynamic "private_dns_zone_group" {

    for_each = local.create_private_dns_zone_group ? [1] : []
    content {
      name                 = lookup(var.private_dns_zone_group, "name", null)
      private_dns_zone_ids = lookup(var.private_dns_zone_group, "private_dns_zone_ids", null)
    }
  }
}



