#DNS ZONE MODULE

#locals
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#----RESOURCE: DNS ZONE----#
resource "azurerm_dns_zone" "eg_public" {
  name                = var.DNSZone_name
  resource_group_name = local.resource_group_name
  soa_record {
    email         = var.email
    host_name     = var.host_name
    expire_time   = var.expire_time
    minimum_ttl   = var.minimum_ttl
    refresh_time  = var.refresh_time
    retry_time    = var.retry_time
    serial_number = var.serial_number
    ttl           = var.ttl
  }
  tags = var.tags
}

#----RESOURCE: DNS A RECORD----#
resource "azurerm_dns_a_record" "examples" {
  name                = var.DNSrecord_name
  zone_name           = resource.azurerm_dns_zone.eg_public.name
  resource_group_name = local.resource_group_name
  ttl                 = var.dns_a_ttl
  records             = var.dns_a_records
}

#----RESOURCE: PRIVATE DNS ZONE----#
resource "azurerm_private_dns_zone" "example-private" {
  name                = var.private_dns_zone_name
  resource_group_name = local.resource_group_name
}

#---------------------------------------------------------------------------------------------------------#
#FOR ALIAS RECORD : The Azure resource id of the target object. Conflicts with records(Uncomment and run for alias record)
#---------------------------------------------------------------------------------------------------------#
/*
resource "azurerm_public_ip" "example" {
  name                = "mypublicip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Dynamic"
  ip_version          = "IPv4"
}

resource "azurerm_dns_a_record" "examples" {
  name                = var.DNSrecord_name
  zone_name           = resource.azurerm_dns_zone.eg_public.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = var.dns_a_ttl
  target_resource_id  = azurerm_public_ip.example.id
}
*/