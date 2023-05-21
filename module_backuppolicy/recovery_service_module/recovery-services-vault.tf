#RECOVERY_SERVICES_VAULT_MODULE

#-----------------------------------------DATA SOURCE: RESOURCE GROUP-------------------------------------#
data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

#-----------------------------------------RESOURCE: RECOVERY SERVICES VAULT-------------------------------#
resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  #storage_mode_type   = var.storage_mode_type
  identity {
    type = var.identity_type
  }
  tags = var.tags
}

resource "azurerm_backup_policy_vm" "example" {
  name                = var.backup_policy_vm_name
  resource_group_name = var.resource_group
  recovery_vault_name = azurerm_recovery_services_vault.vault.name

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }

  retention_weekly {
    count    = 42
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 7
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }

  retention_yearly {
    count    = 77
    weekdays = ["Sunday"]
    weeks    = ["Last"]
    months   = ["January"]
  }
}

#-----------------------------------------RESOURCE: VNET & SUBNET---------------------------------------#
resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  name                                           = var.subnet
  resource_group_name                            = data.azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.example.name
  address_prefixes                               = var.address_prefixes
  enforce_private_link_service_network_policies  = var.enforce_private_link_service_network_policies
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies

}

#-----------------------------------------RESOURCE: PRIVATE ENDPOINT--------------------------------------#
#Private endpoints will get enabled if the user has system managed service identity permission in all the resources of the resource group.
#Go to IAM->Role Assignment->Contributor-> Managed Identity
data "azurerm_client_config" "current" {}
/*
resource "azurerm_role_assignment" "abc" {
  scope                = data.azurerm_resource_group.rg.id#azurerm_private_endpoint.example.id #azurerm_recovery_services_vault.vault.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}
*/
resource "azurerm_private_endpoint" "example" {
  name                = var.private_endpoint
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_recovery_services_vault.vault.id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresources_names
  }
}

data "azurerm_private_endpoint_connection" "private-ip1" {
  name                = azurerm_private_endpoint.example.name
  resource_group_name = data.azurerm_resource_group.rg.name
  depends_on          = [azurerm_recovery_services_vault.vault]
}

#---------------------------------------------------------------------------------------------------------#