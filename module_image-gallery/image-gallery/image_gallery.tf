
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)

}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1   #Keep the bool value false to use data source else to use resource block use "true"
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#--------------------------------------------------Image Gallery--------------------------------------------------
resource "azurerm_shared_image_gallery" "example" {
  name                = var.gallery_name
  resource_group_name = local.resource_group_name
  location            = local.location
  tags                = var.tags
}

#---------------------------------------------------Shared Image--------------------------------------------------
resource "azurerm_shared_image" "example" {
  name                = var.shared_image_name             
  gallery_name        = azurerm_shared_image_gallery.example.name
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = var.os_type                       

  identifier {
    publisher = var.publisher                             
    offer     = var.offer                                  
    sku       = var.sku                              
  }
}
