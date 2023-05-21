# ----------------------------------------RESOURCE GROUP-----------------------------------------------#

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# -------------------------------------TRAFFIC MANAGER PROFILE-------------------------------------------#

resource "azurerm_traffic_manager_profile" "example" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = azurerm_resource_group.example.name
  traffic_routing_method = var.traffic_routing_method
  traffic_view_enabled   = var.traffic_view_enabled

  dns_config {
    relative_name = var.traffic_manager_profile_name
    ttl           = var.ttl
  }

  monitor_config {
    protocol                     = var.protocol
    port                         = var.port
    path                         = var.path
    interval_in_seconds          = var.interval_in_seconds
    timeout_in_seconds           = var.timeout_in_seconds
    tolerated_number_of_failures = var.tolerated_number_of_failures
  }

  tags = var.tags
}

# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#

resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}