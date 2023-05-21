#Reference to NSG creation module
module "module_nsg_with_asg" {
  source                        = "../../modules/module_nsg-with-asg/nsg-asg"
  create_resource_group         = var.create_resource_group
  location                      = var.location
  network_security_group        = var.network_security_group
  resource_group_name           = var.resource_group_name
  application_security_group    = var.application_security_group
  sr_name                       = var.sr_name
  sr_priority                   = var.sr_priority
  sr_direction                  = var.sr_direction
  sr_access                     = var.sr_access
  sr_protocol                   = var.sr_protocol
  sr_source_port_range          = var.sr_source_port_range
  sr_destination_port_range     = var.sr_destination_port_range
  sr_destination_address_prefix = var.sr_destination_address_prefix
  tags                          = var.tags
}

#---------module for Role Assignemt--------#

module "role_assignment" {
  source               = "../../modules/module_application-security-group/rbac"
  resource_group_name  = module.module_nsg_with_asg.resource_group_name
  scope                = module.module_nsg_with_asg.resource_id
  role_definition_name = var.role_definition_name

}

#---------module for logging and monitoring--------#

module "diag_monitoring" {
  source                  = "../../modules/module_application-security-group/logging_and_monitoring"
  resource_group_name     = module.module_nsg_with_asg.resource_group_name
  resource_group_id       = module.module_nsg_with_asg.resource_group_id
  resource_group_location = module.module_nsg_with_asg.resource_group_location
  resource_id             = module.module_nsg_with_asg.resource_id
}