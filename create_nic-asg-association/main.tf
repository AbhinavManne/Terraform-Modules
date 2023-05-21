
module "nic_asg_association_module" {
  source = "../../modules/module_nic-asg-association/nic-asg"

  resource_group_name           = var.resource_group_name
  location                      = var.location
  create_resource_group         = var.create_resource_group
  application_security_group    = var.application_security_group
  network_interface             = var.network_interface
  vnet_name                     = var.vnet_name
  subnet_name                   = var.subnet_name
  address_prefixes              = var.address_prefixes
  address_space                 = var.address_space
  ip_configuration              = var.ip_configuration
  private_ip_address_allocation = var.private_ip_address_allocation
  tags                          = var.tags
}

#---------module for Role Assignemt--------#

module "role_assignment" {
  source               = "../../modules/module_application-security-group/rbac"
  resource_group_name  = module.nic_asg_association_module.resource_group_name
  scope                = module.nic_asg_association_module.resource_id
  role_definition_name = var.role_definition_name

}


#---------module for logging and monitoring--------#
module "diag_monitoring" {
  source                  = "../../modules/module_application-security-group/logging_and_monitoring"
  resource_group_name     = module.nic_asg_association_module.resource_group_name
  resource_group_id       = module.nic_asg_association_module.resource_group_id
  resource_group_location = module.nic_asg_association_module.resource_group_location
  resource_id             = module.nic_asg_association_module.resource_id
}