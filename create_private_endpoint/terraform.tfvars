resource_group_name   = "rg"
create_resource_group = false
location              = "east us"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "private endpoint"
}


private_connection_resource_alias = null
private_endpoint_name           = "endpoint-stor12"
private_service_connection_name = "privateserviceconnection-sql"
subresource_names               = ["Blob"]
is_manual_connection            = false
request_message                 = "PL"
subnet_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet-priv-01/subnets/default"

private_dns_zone_group =  {
    name = "privatelink.blob.core.windows.net"
    private_dns_zone_ids = [
      "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
    ]
  }
private_connection_resource_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/storr345"