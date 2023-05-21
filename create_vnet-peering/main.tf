#Reference to vnet peering module
module "vnet_peering_module" {
  source = "../../modules/module_vnet-peering"

  peerings = var.peerings
}