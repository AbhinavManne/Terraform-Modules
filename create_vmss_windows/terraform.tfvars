#------------------------------------DEFAULT VALUES OF WINDOWS VMSS MODULE-------------------------#

#----DEFAULT VALUES: RESOURCE: KEY VAULT-------#

key_vault_secret_name = "adminuser"
key_vault_id = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.KeyVault/vaults/kv-174"

#----DEFAULT VALUES: RESOURCE: RESOURCE GROUP----#
create_resource_group = false
resource_group_name   = "vmssw"
location              = "East US"

#----DEFAULT VALUES: RESOURCE: VIRTUAL MACHINE SCALE SET----#
windows_vmss                                      = "windows"
vmss_instances                                    = 2
vmss_sku                                          = "Standard_DS2_v2"
network_interface                                 = "example-ni"
network_interface_primary                         = true
nsg_id                                            = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.Network/networkSecurityGroups/nsg-1"
dns_server                                        = null
enable_accelerated_networking                     = false
enable_ip_forwarding                              = false
lb_frontend_ip_config                             = "lb-frontend_IP"
ip_config_primary                                 = true
subnet_id                                         = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.Network/virtualNetworks/vnet-vmssw/subnets/default"
load_balancer_backend_address_pool_ids            = ["/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.Network/loadBalancers/l-1/backendAddressPools/pool-1"]
application_gateway_backend_address_pool_ids      = null
application_security_group_ids                    = null
load_balancer_inbound_nat_rules_ids               = null
enable_public_ip_address                          = false
public_ip_address_name                            = "publicipconfig"
domain_name_label                                 = null
idle_timeout_in_minutes                           = "4"
public_ip_prefix_id                               = null
os_disk_caching                                   = "ReadOnly"
os_disk_storage_account_type                      = "Standard_LRS"
diff_disk_settings_option                         = null
diff_disk_settings_placement                      = null
os_disk_encryption_set_id                         = null
disk_size_gb                                      = "59"
security_encryption_type                          = null
secure_vm_disk_encryption_set_id                  = null
write_accelerator_enabled                         = false
ultra_ssd_enabled                                 = false
content_additional_unattend_content               = null
setting_additional_unattend_content               = null
enable_automatic_updates                          = true
health_probe_id                                   = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.Network/loadBalancers/l-1/probes/hp-1"
vmss_upgrade_mode                                 = "Automatic"
enable_automatic_os_upgrade_policy                = false
disable_automatic_rollback                        = true
enable_automatic_os_upgrade                       = true
enable_automatic_instance_repair                  = true
grace_period_for_automatic_instance_repair        = null
storage_account_uri                               = "https://dffxv.blob.core.windows.net/"
capacity_reservation_group_id                     = null
prefix                                            = "ABCprefix"
custom_data                                       = null
add_data_disk                                     = true
data_disk_caching                                 = "ReadWrite"
data_disk_create_option                           = "Empty"
data_disk_disk_size_gb                            = 10
data_disk_storage_account_type                    = "Standard_LRS"
data_disk_lun                                     = 10
data_disk_encryption_set_id                       = null
# data_disk_mbps_read_write                         = null
# data_disk_iops_read_write                         = null
data_disk_write_accelerator_enabled               = false
do_not_run_extensions_on_overprovisioned_machines = false
edge_zone                                         = null
encryption_at_host_enabled                        = false
#ext_value = null
ext_value = {
  "ex-1" = {
    auto_upgrade_minor_version = true
    automatic_upgrade_enabled = false
    force_update_tag = null
    name = "dependagent"
    protected_settings = null
    provision_after_extensions = null
    publisher = "Microsoft.Azure.Monitoring.DependencyAgent"
    settings = "null"
    type = "DependencyAgentWindows"
    type_handler_version = "9.10"
  }
}
extensions_time_budget                            = null
managed_identity_type                             = "SystemAssigned"
managed_identity_ids                              = null
eviction_policy                                   = null
license_type                                      = null
max_bid_price                                     = "-1"
overprovision                                     = true
name_of_image                                     = null
product_of_image                                  = null
publisher_of_image                                = null
platform_fault_domain_count                       = null
priority                                          = null
provision_vm_agent                                = true
proximity_placement_group_id                      = null
enable_rolling_upgrade_policy                     = false
max_batch_instance_percent                        = null
max_unhealthy_instance_percent                    = null
max_unhealthy_upgraded_instance_percent           = null
pause_time_between_batches                        = null
scale_in_policy                                   = "Default"
add_secret = {
  "secret-1" = {
    certificate = {
      "c-2" = {
        store = "mystore"
        url = "https://kv-174.vault.azure.net/secrets/c-2/738a0dbff54d48368176b801c19ab25d"
      }
    }
    key_vault_id = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.KeyVault/vaults/kv-174"
  }
}
single_placement_group         = true
source_image_id                = null#"/subscriptions/d9eb170f-fa4b-49e2-916a-446a6c074b1a/resourceGroups/image/providers/Microsoft.Compute/images/vm-01-image-20220825111645" #null
using_source_image_reference   = true
publisher_type                 = "MicrosoftWindowsServer"
offer_type                     = "WindowsServer"
sku_type                       = "2016-Datacenter-smalldisk"
version_type                   = "latest"
terminate_notification_enabled = true
terminate_notification_timeout = null
timezone                       = null
user_data                      = null
enable_winrm_listener          = false
certificate_url                = null
protocol                       = null
zones                          = ["1"]
zone_balance                   = false
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "WINDOWS_VM"
}

storage_account_id     = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/vmssw/providers/Microsoft.Storage/storageAccounts/dffxv"
action_group_name      = "example-action-group5"
short_name             = "actiong5"
action_group_rule_name = "example-5"
scope_type             = "Resource"
activity_log_alert_name  = "example-activitylogalert5"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert     = "Security"
metric_alert_name      = "example-metricalert5"
metric_namespace       = "Microsoft.Storage/storageAccounts"
metric_name            = "Transactions"
aggregation            = "Total"
operator               = "GreaterThan"
threshold              = 50
dimension_name         = "ApiName"
dimension_operator     = "Include"
values                 = ["*"]