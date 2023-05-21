output "vnet_id" {

  value = azurerm_virtual_network.vnet.id

}

output "subnet_id" {

  value = azurerm_subnet.gatewaysubnet.id

}


output "vnet_name" {

  value = azurerm_virtual_network.vnet.name

}

output "resource_group" {

  value = local.resource_group_name

}


output "resource_group_id" {

  value = data.azurerm_resource_group.rgrp.0.id

}



output "resource_group_location" {

  value = local.location

}