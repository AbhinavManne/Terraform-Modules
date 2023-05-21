#Reference to application security group module
module "application_security_group_module" {
  source = "../../modules/module_application-security-group/asg"

  resource_group_name             = var.resource_group_name
  location                        = var.location
  application_security_group      = var.application_security_group
  tags                            = var.tags
}

