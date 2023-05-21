locals{
 proximity_placement_group_id = var.enable_proximity_placement_group ? azurerm_proximity_placement_group.appgrp.0.id : null
}

resource "azurerm_availability_set" "avail_set" {
  name                         = var.availability_set
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  managed                      = var.managed
  #--- The ID of the Proximity Placement Group to which this Virtual Machine should be assigned   -----#
  proximity_placement_group_id = var.enable_proximity_placement_group ? azurerm_proximity_placement_group.appgrp.0.id : null
  tags                         = var.tags
}

resource "azurerm_proximity_placement_group" "appgrp" {
  count               = var.enable_proximity_placement_group ? 1 : 0
  name                = var.proximity_placement_group_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

}