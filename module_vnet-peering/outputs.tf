output "peer_1" {
   description = "ID of vnet1"
   value = [ for k in azurerm_virtual_network_peering.vnet_peering_1 : k.id ] 
}


output "peer-2" {
   description = "ID of vnet2"
   value = [ for j in azurerm_virtual_network_peering.vnet_peering_2 : j.id ]
}