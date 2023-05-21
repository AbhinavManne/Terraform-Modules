#-------------------------------------DEFAULT VALUES OF RECOVERY SERVICE MODULE-------------------------#

#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group = "my_rg"

#----DEFAULT VALUES: RESOURCE: RECOVERY SERVICES VAULT----#
recovery_vault_name = "ex-recoveryvault1"
sku                 = "Standard"
soft_delete_enabled = true
#storage_mode_type = "GeoRedundant" #"LocallyRedundant"
identity_type = "SystemAssigned"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Recovery_services_vault"
}

backup_policy_vm_name = "backup-example"

#----DEFAULT VALUES: RESOURCES: VNET & SUBNET----#
virtual_network                                = "example-network"
address_space                                  = ["10.0.0.0/16"]
subnet                                         = "subnet23"
address_prefixes                               = ["10.0.1.0/24"]
enforce_private_link_service_network_policies  = true
enforce_private_link_endpoint_network_policies = true

#----DEFAULT VALUES: RESOURCE: PRIVATE ENDPOINT----#
private_endpoint                = "example-pe"
private_service_connection_name = "example-privatection12"
is_manual_connection            = false
subresources_names              = ["AzureBackup"]

#-----------------------------------------------------------------------------------------------------#