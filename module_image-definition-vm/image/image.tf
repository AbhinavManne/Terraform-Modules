#------------------------------------------------------Resource Group---------------------------------------------------------
data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

#------------------------------------------------------Virtual Machine---------------------------------------------------------
data "azurerm_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
}

#------------------------------------------------------------Disk--------------------------------------------------------------
data "azurerm_managed_disk" "existing" {
  name                = var.managed_disk
  resource_group_name = var.rg_name
}

#------------------------------------------------------Image---------------------------------------------------------
//Creates a custom image in the resource group
resource "azurerm_image" "customimage" {
  name                      = var.image_name
  location                  = var.img_location
  resource_group_name       = data.azurerm_resource_group.rg.name
  source_virtual_machine_id = data.azurerm_virtual_machine.vm.id
  tags  = var.tags
  os_disk {
    os_type         = var.os_type
    os_state        = var.os_state
    size_gb         = data.azurerm_managed_disk.existing.disk_size_gb
    managed_disk_id = data.azurerm_managed_disk.existing.id
  }
}