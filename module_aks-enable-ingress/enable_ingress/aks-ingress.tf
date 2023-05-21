
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
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
}

#Reading existing application gateway info
data "azurerm_application_gateway" "example" {
  name                = var.application_gateway_name
  resource_group_name = local.resource_group_name
}
resource "random_pet" "prefix" {}

#Creating a kubernetes cluster and enables application gateway ingress controller
resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = local.location
  resource_group_name = local.resource_group_name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = var.default_node_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = var.enabled
  }

  addon_profile {
    ingress_application_gateway {
      enabled    = var.enabled
      gateway_id = data.azurerm_application_gateway.example.id
    }
  }

  tags = {
    environment = "Demo"
  }
}


#-----------------------------------------RESOURCE: LOG ANALYTICS WORKSPACE--------------------------------#
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.log_sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_log_analytics_solution" "main" {
  solution_name         = "ContainerInsights"
  location              = local.location
  resource_group_name   = local.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.example.id
  workspace_name        = azurerm_log_analytics_workspace.example.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

#-----------------------------------------RESOURCE: SECURITY CENTER RESOURCES------------------------------#

resource "azurerm_security_center_workspace" "main" {
  #If getting an error stating that this resource is already in state then please comment out this workspace resource and run again. 
  scope        = azurerm_kubernetes_cluster.default.id
  workspace_id = azurerm_log_analytics_workspace.example.id
}

resource "azurerm_security_center_subscription_pricing" "main" {
  tier          = var.security_center_subscription_pricing_tier
  resource_type = var.security_resource_type
}

resource "azurerm_security_center_contact" "main" {
  email               = var.security_center_email
  phone               = var.security_center_phone
  alert_notifications = var.security_center_alert_notifications
  alerts_to_admins    = var.security_center_alerts_to_admins
}

resource "azurerm_security_center_setting" "main" {
  setting_name = var.security_center_setting_name
  enabled      = var.enable_security_center_setting
}

resource "azurerm_security_center_auto_provisioning" "main" {
  auto_provision = var.enable_security_center_auto_provisioning
}
