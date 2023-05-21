#Reference to resource group creation module
module "resource_group" {
  source                           = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group            = var.create_resource_group
  resource_group_name              = var.resource_group_name
  location                         = var.location
  tags                             = var.tags

}

#Reference to azure availability set creation module
module "availability_set" {
  source                       = "../../modules/module_availability_set/availability_set"
  resource_group_name          = module.resource_group.resource_group_name
  location                     = module.resource_group.resource_group_location
  availability_set             = var.availability_set
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  managed                      = var.managed
  tags                         = var.tags
  enable_proximity_placement_group = var.enable_proximity_placement_group
  proximity_placement_group_name   = var.proximity_placement_group_name
}

