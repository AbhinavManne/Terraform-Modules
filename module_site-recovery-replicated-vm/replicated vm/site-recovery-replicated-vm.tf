resource "azurerm_resource_group" "primary" {
  name     = var.resource_group_name1
  location = var.resource_group_location1
}

resource "azurerm_resource_group" "secondary" {
  name     = var.resource_group_name2
  location = var.resource_group_location2
}


resource "azurerm_virtual_machine" "vm" {
  name                  = var.virtual_machine_name
  location              = var.virtual_machine_location
  resource_group_name   = azurerm_resource_group.primary.name
  vm_size               = var.vm_size
  network_interface_ids = [azurerm_network_interface.vm.id]


  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.vm_sku
    version   = var.latest_version
  }

  storage_os_disk {
    name              = var.storage_os_disk
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }

  os_profile {
    computer_name  = var.os_profile
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }
}
resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault_name
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
  sku                 = var.recovery_services_vault_sku
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_site_recovery_fabric" "primary" {
  name                = var.site_recovery_fabric_name1
  resource_group_name = azurerm_resource_group.secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = azurerm_resource_group.primary.location
}

resource "azurerm_site_recovery_fabric" "secondary" {
  name                = var.site_recovery_fabric_name2
  resource_group_name = azurerm_resource_group.secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = azurerm_resource_group.secondary.location
}

resource "azurerm_site_recovery_protection_container" "primary" {
  name                 = var.protection_container1
  resource_group_name  = azurerm_resource_group.secondary.name
  recovery_vault_name  = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
}

resource "azurerm_site_recovery_protection_container" "secondary" {
  name                 = var.protection_container2
  resource_group_name  = azurerm_resource_group.secondary.name
  recovery_vault_name  = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
}

resource "azurerm_site_recovery_replication_policy" "policy" {
  name                                                 = var.site_recovery_replication_policy_name
  resource_group_name                                  = azurerm_resource_group.secondary.name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 4 * 60
}

resource "azurerm_site_recovery_protection_container_mapping" "container-mapping" {
  name                                      = var.site_recovery_protection_container_mapping_name
  resource_group_name                       = azurerm_resource_group.secondary.name
  recovery_vault_name                       = azurerm_recovery_services_vault.vault.name
  recovery_fabric_name                      = azurerm_site_recovery_fabric.primary.name
  recovery_source_protection_container_name = azurerm_site_recovery_protection_container.primary.name
  recovery_target_protection_container_id   = azurerm_site_recovery_protection_container.secondary.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.policy.id
}

resource "azurerm_storage_account" "primary" {
  name                     = var.azurerm_storage_account_name
  location                 = azurerm_resource_group.primary.location
  resource_group_name      = azurerm_resource_group.primary.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

# resource "azurerm_role_assignment" "example1" {
#   scope                = azurerm_storage_account.primary.id
#   role_definition_name = "Contributor"
#   principal_id         = azurerm_recovery_services_vault.vault.identity[0].principal_id
#  }



resource "azurerm_virtual_network" "primary" {
  name                = var.virtual_network_name1
  resource_group_name = azurerm_resource_group.primary.name
  address_space       = var.virtual_network_address_space1
  location            = azurerm_resource_group.primary.location
}

resource "azurerm_virtual_network" "secondary" {
  name                = var.virtual_network_name2
  resource_group_name = azurerm_resource_group.secondary.name
  address_space       = var.virtual_network_address_space2
  location            = azurerm_resource_group.secondary.location
}

resource "azurerm_subnet" "primary" {
  name                 = var.subnet_name1
  resource_group_name  = azurerm_resource_group.primary.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = var.subnet_address_prefixes1
}

resource "azurerm_subnet" "secondary" {
  name                 = var.subnet_name2
  resource_group_name  = azurerm_resource_group.secondary.name
  virtual_network_name = azurerm_virtual_network.secondary.name
  address_prefixes     = var.subnet_address_prefixes2
}

resource "azurerm_public_ip" "primary" {
  name                = var.public_ip_name1
  allocation_method   = var.allocation_method1
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_resource_group.primary.name
  sku                 = var.public_ip_sku1
}

resource "azurerm_public_ip" "secondary" {
  name                = var.public_ip_name2
  allocation_method   = var.allocation_method2
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
  sku                 = var.public_ip_sku2
}

resource "azurerm_network_interface" "vm" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.primary.location
  resource_group_name = azurerm_resource_group.primary.name

  ip_configuration {
    name                          = var.network_interface_ip_config_name
    subnet_id                     = azurerm_subnet.primary.id
    private_ip_address_allocation = var.network_interface_ip_config_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.primary.id
  }
}
resource "azurerm_site_recovery_network_mapping" "recovery-mapping" {
  name                        = var.recovery_network_mapping_name
  resource_group_name         = azurerm_resource_group.secondary.name
  recovery_vault_name         = azurerm_recovery_services_vault.vault.name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
  source_network_id           = azurerm_virtual_network.primary.id
  target_network_id           = azurerm_virtual_network.secondary.id
}

resource "azurerm_site_recovery_replicated_vm" "vm-replication" {
  name                                      = var.site_recovery_replicated_vm_name
  resource_group_name                       = azurerm_resource_group.secondary.name
  recovery_vault_name                       = azurerm_recovery_services_vault.vault.name
  source_recovery_fabric_name               = azurerm_site_recovery_fabric.primary.name
  source_vm_id                              = azurerm_virtual_machine.vm.id
  recovery_replication_policy_id            = azurerm_site_recovery_replication_policy.policy.id
  source_recovery_protection_container_name = azurerm_site_recovery_protection_container.primary.name

  target_resource_group_id                = azurerm_resource_group.secondary.id
  target_recovery_fabric_id               = azurerm_site_recovery_fabric.secondary.id
  target_recovery_protection_container_id = azurerm_site_recovery_protection_container.secondary.id

  managed_disk {
    disk_id                    = azurerm_virtual_machine.vm.storage_os_disk[0].managed_disk_id
    staging_storage_account_id = azurerm_storage_account.primary.id
    target_resource_group_id   = azurerm_resource_group.secondary.id
    target_disk_type           = var.site_recovery_replicated_vm_target_disk_type
    target_replica_disk_type   = var.site_recovery_replicated_vm_target_replica_disk_type
  }

  network_interface {
    source_network_interface_id = azurerm_network_interface.vm.id

    target_subnet_name            = azurerm_subnet.secondary.name
    recovery_public_ip_address_id = azurerm_public_ip.secondary.id
  }
}

# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.secondary.name
  location                 = azurerm_resource_group.secondary.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

# #------------------------------------------VIRTUAL NETWORK-----------------------------------------------#

# resource "azurerm_virtual_network" "vnet" {
#   name                = var.virtual_network
#   address_space       = var.address_space
#   location            = azurerm_resource_group.secondary.location
#   resource_group_name = azurerm_resource_group.secondary.name
# }

# #---------------------------------------------SUBNET----------------------------------------------------#

# resource "azurerm_subnet" "snet-ep" {
#   count                                          = var.enable_private_endpoint ? 1 : 0
#   name                                           = var.subnet_name
#   resource_group_name                            = azurerm_resource_group.secondary.name
#   virtual_network_name                           = azurerm_virtual_network.vnet.name
#   address_prefixes                               = var.private_subnet_address_prefix
#   enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
# }

# #-----------------------------------------PRIVATE ENDPOINT------------------------------------------#
# resource "azurerm_private_endpoint" "pep1" {
#   count               = var.enable_private_endpoint ? 1 : 0
#   name                = var.private_endpoint_name
#   location            = azurerm_resource_group.secondary.location
#   resource_group_name = azurerm_resource_group.secondary.name
#   subnet_id           = azurerm_subnet.snet-ep.0.id
#   private_service_connection {
#     name                           = var.private_service_connection_name
#     is_manual_connection           = var.is_manual_connection
#     private_connection_resource_id = azurerm_recovery_services_vault.vault.id
#     subresource_names              = var.subresource_names
#   }
# }

# data "azurerm_private_endpoint_connection" "private-ip1" {
#   count               = var.enable_private_endpoint ? 1 : 0
#   name                = azurerm_private_endpoint.pep1.0.name
#   resource_group_name = azurerm_resource_group.secondary.name
#   depends_on          = [azurerm_recovery_services_vault.vault]
# }
