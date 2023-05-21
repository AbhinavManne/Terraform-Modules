#------------------------------------------------Resource Group--------------------------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)

}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1 #Keep the bool value false to use data source else to use resource block use "true"
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#---------------------------------------------------- Image ------------------------------------------------------
data "azurerm_image" "existing" {
  name                = var.image_name                             
  resource_group_name = local.resource_group_name
}

#---------------------------------------------------Shared Image---------------------------------------------------
resource "azurerm_shared_image" "existing" {
  name                = var.shared_image_name                         
  gallery_name        = azurerm_shared_image_gallery.example.name
  resource_group_name = local.resource_group_name
  location            = local.location
  os_type             = var.os_type                                   
  hyper_v_generation  = var.hyper_v_generation                      

  identifier {
    publisher = var.publisher                                        
    offer     = var.offer                                             
    sku       = var.sku                                               
  }
}

#------------------------------------------------ Shared image Gallery ----------------------------------------------
resource "azurerm_shared_image_gallery" "example" {
  name                = var.shared_image_gallery_name                
  resource_group_name = local.resource_group_name
  location            = local.location
}

#------------------------------------------------ Shared image Version ----------------------------------------------
resource "azurerm_shared_image_version" "example" {
  name                = var.shared_image_version_name                
  gallery_name        = azurerm_shared_image.existing.gallery_name
  image_name          = azurerm_shared_image.existing.name
  resource_group_name = local.resource_group_name
  location            = local.location
  managed_image_id    = data.azurerm_image.existing.id
  tags                = var.tags

  target_region {
    name                   = local.location
    regional_replica_count = var.regional_replica_count               
    storage_account_type   = var.storage_account_type                 
  }
}