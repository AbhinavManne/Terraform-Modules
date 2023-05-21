module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "vmss_module" {
  source                                            = "../../modules/module_vmss_linux/vmss"
  enable_ssh_key_authentication                     = var.enable_ssh_key_authentication
  generate_ssh_key                                  = var.generate_ssh_key
  existed_public_key                                = var.existed_public_key
  ssh_key_algorithm                                 = var.ssh_key_algorithm
  ssh_key_rsa_bits                                  = var.ssh_key_rsa_bits
  private_key_secret_name                           = var.private_key_secret_name
  key_vault_id                                      = var.key_vault_id
  secret_content_type                               = var.secret_content_type
  secret_not_before_date                            = var.secret_not_before_date
  secret_expiration_date                            = var.secret_expiration_date
  resource_group_name                               = module.create_resource_group.resource_group_name
  location                                          = module.create_resource_group.resource_group_location
  password_secret_name                              = var.password_secret_name
  linux_vmss                                        = var.linux_vmss
  vmss_instances                                    = var.vmss_instances
  vmss_sku                                          = var.vmss_sku
  admin_username                                    = var.admin_username
  ssh_key_username                                  = var.ssh_key_username
  network_interface                                 = var.network_interface
  network_interface_primary                         = var.network_interface_primary
  nsg_id                                            = var.nsg_id
  dns_server                                        = var.dns_server
  enable_accelerated_networking                     = var.enable_accelerated_networking
  enable_ip_forwarding                              = var.enable_ip_forwarding
  lb_frontend_ip_config                             = var.lb_frontend_ip_config
  ip_config_primary                                 = var.ip_config_primary
  subnet_id                                         = var.subnet_id
  load_balancer_backend_address_pool_ids            = var.load_balancer_backend_address_pool_ids
  application_gateway_backend_address_pool_ids      = var.application_gateway_backend_address_pool_ids
  application_security_group_ids                    = var.application_security_group_ids
  load_balancer_inbound_nat_rules_ids               = var.load_balancer_inbound_nat_rules_ids
  enable_public_ip_address                          = var.enable_public_ip_address
  public_ip_address_name                            = var.public_ip_address_name
  domain_name_label                                 = var.domain_name_label
  idle_timeout_in_minutes                           = var.idle_timeout_in_minutes
  public_ip_prefix_id                               = var.public_ip_prefix_id
  os_disk_caching                                   = var.os_disk_caching
  os_disk_storage_account_type                      = var.os_disk_storage_account_type
  diff_disk_settings_option                         = var.diff_disk_settings_option
  diff_disk_settings_placement                      = var.diff_disk_settings_placement
  os_disk_encryption_set_id                         = var.os_disk_encryption_set_id
  disk_size_gb                                      = var.disk_size_gb
  security_encryption_type                          = var.security_encryption_type
  secure_vm_disk_encryption_set_id                  = var.secure_vm_disk_encryption_set_id
  write_accelerator_enabled                         = var.write_accelerator_enabled
  ultra_ssd_enabled                                 = var.ultra_ssd_enabled
  enable_automatic_os_upgrade                       = var.enable_automatic_os_upgrade
  grace_period_for_automatic_instance_repair        = var.grace_period_for_automatic_instance_repair
  enable_automatic_instance_repair                  = var.enable_automatic_instance_repair
  health_probe_id                                   = var.health_probe_id
  vmss_upgrade_mode                                 = var.vmss_upgrade_mode
  enable_automatic_os_upgrade_policy                = var.enable_automatic_os_upgrade_policy
  disable_automatic_rollback                        = var.disable_automatic_rollback
  storage_account_uri                               = var.storage_account_uri
  capacity_reservation_group_id                     = var.capacity_reservation_group_id
  prefix                                            = var.prefix
  custom_data                                       = var.custom_data
  add_data_disk                                     = var.add_data_disk
  data_disk_caching                                 = var.data_disk_caching
  data_disk_create_option                           = var.data_disk_create_option
  data_disk_disk_size_gb                            = var.data_disk_disk_size_gb
  data_disk_storage_account_type                    = var.data_disk_storage_account_type
  data_disk_lun                                     = var.data_disk_lun
  data_disk_encryption_set_id                       = var.data_disk_encryption_set_id
  data_disk_mbps_read_write                         = var.data_disk_mbps_read_write
  data_disk_iops_read_write                         = var.data_disk_iops_read_write
  data_disk_write_accelerator_enabled               = var.data_disk_write_accelerator_enabled
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  edge_zone                                         = var.edge_zone
  encryption_at_host_enabled                        = var.encryption_at_host_enabled
  ext_value                                         = var.ext_value
  extensions_time_budget                            = var.extensions_time_budget
  managed_identity_type                             = var.managed_identity_type
  managed_identity_ids                              = var.managed_identity_ids
  eviction_policy                                   = var.eviction_policy
  license_type                                      = var.license_type
  max_bid_price                                     = var.max_bid_price
  overprovision                                     = var.overprovision
  name_of_image                                     = var.name_of_image
  publisher_of_image                                = var.publisher_of_image
  product_of_image                                  = var.product_of_image
  platform_fault_domain_count                       = var.platform_fault_domain_count
  priority                                          = var.priority
  provision_vm_agent                                = var.provision_vm_agent
  proximity_placement_group_id                      = var.proximity_placement_group_id
  enable_rolling_upgrade_policy                     = var.enable_accelerated_networking
  scale_in_policy                                   = var.scale_in_policy
  max_batch_instance_percent                        = var.max_batch_instance_percent
  max_unhealthy_instance_percent                    = var.max_unhealthy_instance_percent
  max_unhealthy_upgraded_instance_percent           = var.max_unhealthy_upgraded_instance_percent
  pause_time_between_batches                        = var.pause_time_between_batches
  add_secret                                        = var.add_secret
  single_placement_group                            = var.single_placement_group
  source_image_id                                   = var.source_image_id
  using_source_image_reference                      = var.using_source_image_reference
  publisher_type                                    = var.publisher_type
  offer_type                                        = var.offer_type
  sku_type                                          = var.sku_type
  version_type                                      = var.version_type
  terminate_notification_enabled                    = var.terminate_notification_enabled
  terminate_notification_timeout                    = var.terminate_notification_timeout
  user_data                                         = var.user_data
  zones                                             = var.zones
  zone_balance                                      = var.zone_balance
  tags                                              = var.tags
}


module "alert" {
  source = "../../modules/module_alert"
  action_group_name       = var.action_group_name
  resource_group_name     = var.resource_group_name
  resource_group_location = var.location
  short_name              = var.short_name
  action_group_rule_name  = var.action_group_rule_name
  scope_type              = var.scope_type
  resource_id             = module.vmss_module.vmss_id
  activity_log_alert_name = var.activity_log_alert_name
  resource_group_id       = module.create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert      = var.category_log_alert
  metric_alert_name       = var.metric_alert_name
  storage_account_id      = var.storage_account_id
  metric_namespace        = var.metric_namespace
  metric_name             = var.metric_name
  aggregation             = var.aggregation
  operator                = var.operator
  threshold               = var.threshold
  dimension_name          = var.dimension_name
  dimension_operator      = var.dimension_operator
  values                  = var.values
}