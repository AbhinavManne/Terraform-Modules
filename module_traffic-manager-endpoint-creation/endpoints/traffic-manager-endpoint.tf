
#-----------------------------------------------RESOURCE GROUP----------------------------------------------------#

resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

#------------------------------------------------PUBLIC IP-------------------------------------------------------#

resource "azurerm_public_ip" "example" {
  name                = var.public_ip1_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  allocation_method   = var.public_ip1_allocation_method
  domain_name_label   = var.domain_name_label
}

resource "azurerm_public_ip" "example1" {
  name                = var.public_ip2_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  allocation_method   = var.public_ip2_allocation_method
  domain_name_label   = var.domain_name_label1
}

#----------------------------------------------TRAFFIC MANAGER----------------------------------------------------#

resource "azurerm_traffic_manager_profile" "example" {
  name                   = var.traffic_manager_profile_name
  resource_group_name    = azurerm_resource_group.test.name
  traffic_routing_method = var.traffic_routing_method
  traffic_view_enabled   = var.traffic_view_enabled

  dns_config {
    relative_name = var.dns_config_name
    ttl           = 100
  }

  monitor_config {
    protocol                     = "http"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags = var.tags
}

#------------------------------------------------END POINTS-------------------------------------------------------#

resource "azurerm_traffic_manager_azure_endpoint" "example" {
  name               = var.azure_end_point1_name
  profile_id         = azurerm_traffic_manager_profile.example.id
  weight             = 100
  target_resource_id = azurerm_public_ip.example.id
}

resource "azurerm_traffic_manager_azure_endpoint" "example1" {
  name               = var.azure_end_point2_name
  profile_id         = azurerm_traffic_manager_profile.example.id
  weight             = 100
  target_resource_id = azurerm_public_ip.example1.id
}

#----------------------------------------------STORAGE ACCOUNT-----------------------------------------------------#

resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}


