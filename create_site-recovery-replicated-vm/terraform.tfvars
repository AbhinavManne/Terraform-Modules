resource_group_name1     = "my_rg100"
resource_group_location1 = "West US"

resource_group_name2     = "my_rg200"
resource_group_location2 = "East US"

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "site recovery replicated vm"
}
storage_account_name             = "replication195434"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

#----DEFAULT VALUES: RESOURCE: VIRTUAL NETWORK----#

virtual_network = "vnet-sec"
address_space   = ["10.1.0.0/16"]
#----DEFAULT VALUES: RESOURCE: SUBNET----#
enable_private_endpoint                        = true
subnet_name                                    = "snet-pep"
private_subnet_address_prefix                  = ["10.1.1.0/24"]
enforce_private_link_endpoint_network_policies = true
#----DEFAULT VALUES: RESOURCE: PRIVATE ENDPOINT----#
private_endpoint_name           = "pepabby"
private_service_connection_name = "functionappprivatelink"
is_manual_connection            = false
subresource_names               = ["AzureSiteRecovery"]

virtual_machine_name            = "demo_vm"
virtual_machine_location        = "West US"
vm_size                         = "Standard_B1s"
publisher                       = "OpenLogic"
offer                           = "CentOS"
vm_sku                          = "7.5"
latest_version                  = "latest"
storage_os_disk                 = "vm-os-disk"
caching                         = "ReadWrite"
create_option                   = "FromImage"
managed_disk_type               = "Premium_LRS"
os_profile                      = "vm"
admin_username                  = "test-admin-123"
admin_password                  = "test-pwd-123"
disable_password_authentication = "false"

recovery_services_vault_name = "vault91312"
recovery_services_vault_sku  = "Standard"

site_recovery_fabric_name1 = "primary-fabric"

site_recovery_fabric_name2 = "secondary-fabric"

protection_container1 = "primary-protection-container"

protection_container2 = "secondary-protection-container"

site_recovery_replication_policy_name = "policy"

site_recovery_protection_container_mapping_name = "container-mapping"

azurerm_storage_account_name = "stoaraccount31267"

account_tier             = "Standard"
account_replication_type = "LRS"

virtual_network_name1          = "demo_network1"
virtual_network_address_space1 = ["192.168.1.0/24"]

virtual_network_name2          = "demo_network2"
virtual_network_address_space2 = ["192.168.2.0/24"]

subnet_name1             = "primary"
subnet_address_prefixes1 = ["192.168.1.0/24"]

subnet_name2             = "secondary"
subnet_address_prefixes2 = ["192.168.2.0/24"]

public_ip_name1    = "primary"
allocation_method1 = "Static"
public_ip_sku1     = "Basic"

public_ip_name2    = "secondary"
allocation_method2 = "Static"
public_ip_sku2     = "Basic"

network_interface_name                                    = "vm-nic"
network_interface_ip_config_name                          = "vm"
network_interface_ip_config_private_ip_address_allocation = "Dynamic"

recovery_network_mapping_name = "recovery-network-mapping-1"

site_recovery_replicated_vm_name                     = "vm-replication"
site_recovery_replicated_vm_target_disk_type         = "Premium_LRS"
site_recovery_replicated_vm_target_replica_disk_type = "Premium_LRS"
