data "azurerm_client_config" "example" {}

#-------------------------------------------RESOURCE GROUP---------------------------------------------#

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

#-------------------------------------------API MANAGMENT-----------------------------------------------#

resource "azurerm_api_management" "example" {
  name                = var.api_managment_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email

  sku_name = var.sku_name
  tags     = var.tags
  identity {
    type = "SystemAssigned"
  }
  protocols {
    enable_http2 = true
  }
  security {
    enable_backend_ssl30                                = true
    enable_backend_tls10                                = true
    enable_backend_tls11                                = true
    enable_frontend_ssl30                               = true
    enable_frontend_tls10                               = true
    enable_frontend_tls11                               = true
    tls_ecdhe_ecdsa_with_aes128_cbc_sha_ciphers_enabled = true
    tls_ecdhe_ecdsa_with_aes256_cbc_sha_ciphers_enabled = true
    tls_ecdhe_rsa_with_aes128_cbc_sha_ciphers_enabled   = true
    tls_ecdhe_rsa_with_aes256_cbc_sha_ciphers_enabled   = true
    tls_rsa_with_aes128_cbc_sha256_ciphers_enabled      = true
    tls_rsa_with_aes128_cbc_sha_ciphers_enabled         = true
    tls_rsa_with_aes128_gcm_sha256_ciphers_enabled      = true
    tls_rsa_with_aes256_cbc_sha_ciphers_enabled         = true
    tls_rsa_with_aes256_cbc_sha256_ciphers_enabled      = true
    triple_des_ciphers_enabled                          = true
  }

}

#-------------------------------------------APPLICATION INSIGHTS----------------------------------------#

resource "azurerm_application_insights" "example" {
  name                = var.application_insights_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  application_type    = var.application_insights_type
}

#-------------------------------------------API MANAGMENT LOGGER----------------------------------------#

resource "azurerm_api_management_logger" "example" {
  name                = var.api_managment_logger_name
  api_management_name = azurerm_api_management.example.name
  resource_group_name = azurerm_resource_group.example.name
  resource_id         = azurerm_application_insights.example.id

  application_insights {
    instrumentation_key = azurerm_application_insights.example.instrumentation_key
  }
}

#-------------------------------------------API MANAGMENT API-------------------------------------------#

resource "azurerm_api_management_api" "example" {
  name                = var.api_managment_api_name
  resource_group_name = azurerm_resource_group.example.name
  api_management_name = azurerm_api_management.example.name
  revision            = var.api_managment_api_revision
  display_name        = var.api_managment_api_display_name
  path                = var.api_managment_api_path
  protocols           = var.api_managment_api_protocols




  import {
    content_format = "swagger-link-json"
    content_value  = "http://conferenceapi.azurewebsites.net/?format=json"
  }

}

# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

#------------------------------------------VIRTUAL NETWORK-----------------------------------------------#

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network
  address_space       = var.address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

#---------------------------------------------SUBNET----------------------------------------------------#

resource "azurerm_subnet" "snet-ep" {
  count                                          = var.enable_private_endpoint ? 1 : 0
  name                                           = var.subnet_name
  resource_group_name                            = azurerm_resource_group.example.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = var.private_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

#-----------------------------------------PRIVATE ENDPOINT------------------------------------------#
resource "azurerm_private_endpoint" "pep1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  subnet_id           = azurerm_subnet.snet-ep.0.id
  private_service_connection {
    name                           = var.private_service_connection_name
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = azurerm_api_management.example.id
    subresource_names              = var.subresource_names
  }
}

data "azurerm_private_endpoint_connection" "private-ip1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = azurerm_private_endpoint.pep1.0.name
  resource_group_name = azurerm_resource_group.example.name
  depends_on          = [azurerm_api_management.example]
}

#-------------------------------------------KEY VAULT---------------------------------------------------#

resource "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name


  tenant_id = data.azurerm_client_config.example.tenant_id

  sku_name = var.key_vault_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.example.tenant_id
    object_id = data.azurerm_client_config.example.object_id
    certificate_permissions = [
      "create",
      "delete",
      "deleteissuers",
      "get",
      "getissuers",
      "import",
      "list",
      "listissuers",
      "managecontacts",
      "manageissuers",
      "purge",
      "setissuers",
      "update",
    ]

    key_permissions = [
      "backup",
      "create",
      "decrypt",
      "delete",
      "encrypt",
      "get",
      "import",
      "list",
      "purge",
      "recover",
      "restore",
      "sign",
      "unwrapKey",
      "update",
      "verify",
      "wrapKey",
    ]

    secret_permissions = [
      "backup",
      "delete",
      "get",
      "list",
      "purge",
      "recover",
      "restore",
      "set",
    ]
  }

}

#-----------------------------------ACCESS POLICY FOR API MANAGMENT---------------------------------------------------#

resource "azurerm_key_vault_access_policy" "example2" {
  key_vault_id = azurerm_key_vault.example.id
  tenant_id    = data.azurerm_client_config.example.tenant_id
  object_id    = azurerm_api_management.example.identity[0].principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

#-------------------------------------------KEY VAULT CERTIFICATE----------------------------------------------#

resource "azurerm_key_vault_certificate" "example" {
  name         = var.key_vault_certificate_name
  key_vault_id = azurerm_key_vault.example.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = true
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pkcs12"
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = ["1.3.6.1.5.5.7.3.1"]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject_alternative_names {
        dns_names = ["internal.contoso.com", "domain.hello.world"]
      }

      subject            = "CN=hello-world"
      validity_in_months = 12
    }
  }
}

#-------------------------------------API MANAGMENT CERTIFICATION---------------------------------------#

resource "azurerm_api_management_certificate" "example" {
  name                = var.api_managment_certificate_name
  api_management_name = azurerm_api_management.example.name
  resource_group_name = azurerm_resource_group.example.name

  key_vault_secret_id = azurerm_key_vault_certificate.example.secret_id
}

#-----------------------------------ROLE DEFINATION FOR KEY VALUT---------------------------------------#

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_key_vault.example.id
  role_definition_name = var.role_definition_for_key_vault
  principal_id         = data.azurerm_client_config.example.object_id
}

