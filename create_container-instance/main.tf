module "container_instance" {
  source          = "../../modules/module_container-instance/container-instance"
  container_group = var.container_group
  resource_group  = var.resource_group
  dns_name_label  = var.dns_name_label
  os_type         = var.os_type
  image_name      = var.image_name
  container_name  = var.container_name
  cpu_core_number = var.cpu_core_number
  memory_size     = var.memory_size
  port_number     = var.port_number
  protocol        = var.protocol
  tags            = var.tags
  ip_address_type = var.ip_address_type
}

module "diag_monitoring" {
  source                  = "../../modules/module_container-instance/logging_and_monitoring"
  resource_group_name     = module.container_instance.resource_group_name
  resource_group_id       = module.container_instance.resource_group_id
  resource_group_location = module.container_instance.resource_group_location
  resource_id             = module.container_instance.resource_id
}

// --------Module for RBAC ----------------------//
module "module_resource-role-assignment" {

  resource_group_name     = module.container_instance.resource_group_name
  resource_group_id       = module.container_instance.resource_group_id
  resource_group_location =  module.container_instance.resource_group_location
  source                  = "../../modules/module_container-instance/rbac"
  scope                   = module.container_instance.resource_id
  role_definition_name    = var.role_definition_name
}