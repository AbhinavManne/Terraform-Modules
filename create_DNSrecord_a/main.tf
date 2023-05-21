#Reference to module that provisions azure dns zone
module "DNSZone_module" {
  source = "../../modules/module_DNSrecord_a_Creation/DNS_A_record"

  resource_group        = var.resource_group
  create_resource_group = var.create_resource_group
  location              = var.location
  DNSZone_name          = var.DNSZone_name
  email                 = var.email
  host_name             = var.host_name
  expire_time           = var.expire_time
  minimum_ttl           = var.minimum_ttl
  refresh_time          = var.refresh_time
  retry_time            = var.retry_time
  serial_number         = var.serial_number
  ttl                   = var.ttl
  tags                  = var.tags
  DNSrecord_name        = var.DNSrecord_name
  dns_a_ttl             = var.dns_a_ttl
  dns_a_records         = var.dns_a_records
  private_dns_zone_name = var.private_dns_zone_name
}

#Reference to module that provisions role assignment for each resource
module "module_resource-role-assignment" {
  source               = "../../modules/module_DNSrecord_a_Creation/rbac"
  scope                = module.DNSZone_module.resource_id
  role_definition_name = var.role_definition_name

}

#Reference to module that provisions diagnostic settings of a particular resource
module "dns_monitoring" {
  source                  = "../../modules/module_DNSrecord_a_Creation/diag_setting"
  resource_id             = module.DNSZone_module.resource_id
  resource_group_name     = module.DNSZone_module.resource_group
  resource_group_id       = module.DNSZone_module.resource_group_id
  resource_group_location = module.DNSZone_module.resource_group_location
}