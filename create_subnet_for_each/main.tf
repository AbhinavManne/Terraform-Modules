module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}
module "subnet" {
  source              = "../../modules/module_subnet-creation_for_each"
  resource_group_name = module.create_resource_group.resource_group_name
  subnets             = var.subnets
}
