data "azurerm_key_vault_secret" "secret" {
  name         = var.key_vault_secret_name
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_managed_instance" "sqlmi" {
  name                           = var.primary_sqlmi
  resource_group_name            = var.resource_group_name
  location                       = var.location
  administrator_login            = var.administrator_login
  administrator_login_password   = data.azurerm_key_vault_secret.secret.value 
  license_type                   = var.license_type
  subnet_id                      = var.subnet_id
  sku_name                       = var.sku_name
  vcores                         = var.vcores
  storage_size_in_gb             = var.storage_size_in_gb
  public_data_endpoint_enabled   = var.public_data_endpoint_enabled
  collation                      = var.collation != null ? var.collation : null
  minimum_tls_version            = var.minimum_tls_version != null ? var.minimum_tls_version : null
  proxy_override                 = var.proxy_override != null ? var.proxy_override : null
  timezone_id                    = var.timezone_id != null ? var.timezone_id : null
  dns_zone_partner_id            = var.dns_zone_partner_id != null ? var.dns_zone_partner_id : null
  storage_account_type           = var.storage_account_type != null ? var.storage_account_type : null
  maintenance_configuration_name = var.maintenance_configuration_name != null ? var.maintenance_configuration_name : null
  tags                           = var.tags


  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }
}

# Create Secondary (Failover) SQL MI instance
resource "azurerm_mssql_managed_instance" "secondary" {
  for_each                       = var.secondary_sqlmi != null ? { for k, v in var.secondary_sqlmi : k => v if v != null } : {}
  name                           = each.key
  resource_group_name            = var.resource_group_name
  location                       = var.secondary_location
  administrator_login            = each.value["administrator_login"]
  administrator_login_password   = each.value["administrator_login_password"]
  license_type                   = each.value["license_type"]
  subnet_id                      = each.value["subnet_id"]
  dns_zone_partner_id            = azurerm_mssql_managed_instance.sqlmi.id
  sku_name                       = each.value["sku_name"]
  vcores                         = each.value["vcores"]
  storage_size_in_gb             = each.value["storage_size_in_gb"]
  public_data_endpoint_enabled   = each.value["public_data_endpoint_enabled"]
  collation                      = each.value["collation"]
  minimum_tls_version            = each.value["minimum_tls_version"]
  proxy_override                 = each.value["proxy_override"]
  timezone_id                    = each.value["timezone_id"]
  storage_account_type           = each.value["storage_account_type"]
  maintenance_configuration_name = each.value["maintenance_configuration_name"]

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }
}

# Create Failover Group between Primary and Secondary SQL MI instances
resource "azurerm_mssql_managed_instance_failover_group" "fgroup" {
  for_each                                  = var.failover_group_name != null ? { for k, v in var.failover_group_name : k => v if v != null } : {}
  name                                      = each.key
  location                                  = var.location
  managed_instance_id                       = azurerm_mssql_managed_instance.sqlmi.id
  partner_managed_instance_id               = element([for k in azurerm_mssql_managed_instance.secondary : k.id],0)
  readonly_endpoint_failover_policy_enabled = each.value.readonly_endpoint_failover_policy_enabled

  read_write_endpoint_failover_policy {
    mode          = var.mode
    grace_minutes = var.mode == "Automatic" ? var.grace_minutes : null

  }
}


resource "azurerm_mssql_managed_database" "db" {
  for_each            = var.database_name != null ? { for k, v in var.database_name : k => v if v != null } : {}
  name                = each.key
  managed_instance_id = azurerm_mssql_managed_instance.sqlmi.id
}


resource "azurerm_mssql_managed_instance_active_directory_administrator" "aad" {
  count                       = var.create_aad ? 1 : 0
  managed_instance_id         = azurerm_mssql_managed_instance.sqlmi.id
  login_username              = var.login_username
  object_id                   = var.object_id
  tenant_id                   = var.tenant_id
  azuread_authentication_only = var.azuread_authentication_only != null ? var.azuread_authentication_only : null
}


resource "azurerm_mssql_managed_instance_vulnerability_assessment" "vulnerability" {
  count                      = var.create_vulnerability_assessment ? 1 : 0
  managed_instance_id        = azurerm_mssql_managed_instance.sqlmi.id
  storage_container_path     = var.storage_container_path
  storage_account_access_key = var.storage_account_access_key != null ? var.storage_account_access_key : null
  storage_container_sas_key  = var.storage_container_sas_key != null ? var.storage_container_sas_key : null

  dynamic "recurring_scans" {
    for_each = var.recurring_scans != null ? [1] : []

    content {

      enabled                   = recurring_scans.value.enabled
      email_subscription_admins = recurring_scans.value.email_subscription_admins
      emails                    = recurring_scans.value.emails

    }
  }
}