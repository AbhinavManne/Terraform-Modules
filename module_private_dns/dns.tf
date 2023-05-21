#----RESOURCE: PRIVATE DNS ZONE----#
#Creating a private DNS zone
resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.private_dns_name
  resource_group_name = var.resource_group_name
  dynamic "soa_record" {
    for_each = var.soa_record != null ? [1] : []
    content {
      email        = lookup(var.soa_record, "email")
      expire_time  = lookup(var.soa_record, "expire_time", null)
      minimum_ttl  = lookup(var.soa_record, "minimum_ttl", null)
      refresh_time = lookup(var.soa_record, "refresh_time", null)
      retry_time   = lookup(var.soa_record, "retry_time", null)
      ttl          = lookup(var.soa_record, "ttl", null)
    }
  }
  tags = var.tags
}

#----RESOURCE: PRIVATE DNS A RECORD----#
#Creating DNS A Records within Azure Private DNS
resource "azurerm_private_dns_a_record" "a_records" {
  count               = var.a_records != null ? 1 : 0
  name                = lookup(var.a_records, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.a_records, "ttl")
  records             = lookup(var.a_records, "records")
  tags                = var.tags
}

#----RESOURCE: PRIVATE DNS A RECORD----#
#Creating DNS AAAA Records within Azure Private DNS
resource "azurerm_private_dns_aaaa_record" "aaaa_records" {
  count               = var.aaaa_records != null ? 1 : 0
  name                = lookup(var.aaaa_records, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.aaaa_records, "ttl")
  records             = lookup(var.aaaa_records, "records")
  tags                = var.tags
}

#----RESOURCE: PRIVATE DNS CNAME RECORD----#
#Creating DNS CNAME Records within Azure Private DNS
resource "azurerm_private_dns_cname_record" "cname_records" {
  count               = var.cname_records != null ? 1 : 0
  name                = lookup(var.cname_records, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.cname_records, "ttl")
  record              = lookup(var.cname_records, "records")
  tags                = var.tags
}

#----RESOURCE: PRIVATE DNS MX RECORD----#
#Creating DNS MX Records within Azure Private DNS
resource "azurerm_private_dns_mx_record" "mx_record" {
  count               = var.mx_record != null ? 1 : 0
  name                = lookup(var.mx_record, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.mx_record, "ttl")

  dynamic "record" {
    for_each = { for record in local.mxrecordList : record.preference => record }
    content {
      preference = record.value.preference
      exchange   = record.value.exchange
    }
  }
  tags = var.tags
}

#----RESOURCE: PRIVATE DNS PTR RECORD----#
#Creating DNS PTR Records within Azure Private DNS
resource "azurerm_private_dns_ptr_record" "ptr_record" {
  count               = var.ptr_record != null ? 1 : 0
  name                = lookup(var.ptr_record, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.ptr_record, "ttl")
  records             = lookup(var.ptr_record, "records")
  tags                = var.tags
}

#----RESOURCE: PRIVATE DNS SRV RECORD----#
#Creating DNS SRV Records within Azure Private DNS
resource "azurerm_private_dns_srv_record" "srv_records" {
  count               = var.srv_records != null ? 1 : 0
  name                = lookup(var.srv_records, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.srv_records, "ttl")

  dynamic "record" {
    for_each = { for record in local.srvrecordList : record.priority => record }
    content {
      priority = record.value.priority
      weight   = record.value.weight
      port     = record.value.port
      target   = record.value.target
    }
  }
  tags = var.tags
}

#----RESOURCE: PRIVATE DNS ZONE----#
#Creating DNS TXT Records within Azure Private DNS
resource "azurerm_private_dns_txt_record" "txt_record" {
  count               = var.txt_record != null ? 1 : 0
  name                = lookup(var.txt_record, "name")
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(var.txt_record, "ttl")

  dynamic "record" {
    for_each = { for record in local.txtrecordList : record.Value => record }
    content {
      value = record.value.Value
    }
  }
  tags = var.tags
}

#----RESOURCE: DNS ZONE VNET LINK----#
#Creating a virtual network link for a private DNS zone
resource "azurerm_private_dns_zone_virtual_network_link" "pdns_vnetlink" {
  count                 = var.add_pdns_vnet_link ? 1 : 0
  name                  = var.private_dns_zone_vnet_link_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = var.registration_enabled
  tags                  = var.tags
}
