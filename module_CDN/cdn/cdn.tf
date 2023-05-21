#Reading existing resource group info
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_cdn_profile" "cdn" {
  name                = var.cdn_profile
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.sku
  tags                = var.tags
}

resource "azurerm_cdn_endpoint" "cdne" {
  name                = var.cdn_endpoint
  profile_name        = azurerm_cdn_profile.cdn.name
  location            = local.location
  resource_group_name = local.resource_group_name
  optimization_type   = var.optimization_type


  geo_filter {
    relative_path = var.relative_path
    action        = var.action
    country_codes = var.country_codes
  }


  origin {
    name      = var.origin
    host_name = var.host_name
  }

  global_delivery_rule {
    cache_expiration_action {
      behavior = var.behavior
      duration = var.duration
    }
  }

  delivery_rule {
    name  = var.delivery_rule
    order = var.order
    cache_expiration_action {
      behavior = var.behavior
      duration = var.duration
    }
    url_file_extension_condition {
      operator     = var.operator
      match_values = var.match_values
      transforms   = var.transforms
    }

  }


  querystring_caching_behaviour = var.querystring_caching_behaviour
  is_compression_enabled        = var.is_compression_enabled

  content_types_to_compress = var.content_types_to_compress

}

# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}