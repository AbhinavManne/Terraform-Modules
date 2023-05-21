data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

resource "azurerm_container_group" "container_group" {
  name                = var.container_group
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label
  os_type             = var.os_type

  container {
    name   = var.container_name
    image  = var.image_name
    cpu    = var.cpu_core_number
    memory = var.memory_size

    ports {
      port     = var.port_number
      protocol = var.protocol
    }

  }

identity {
  type="SystemAssigned"
}
  tags = var.tags
}