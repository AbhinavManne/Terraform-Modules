#KEYVAULT_MODULE

#----RESOURCE: KEYVAULT----#
resource "azurerm_key_vault" "keyvault" {
  name                            = var.keyvault_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.tenant_id
  sku_name                        = var.kv_sku
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days

  dynamic "access_policy"{
    for_each = var.enable_access_policy && var.enable_rbac_authorization != true ? [1] : [] 
    content {
      tenant_id               = var.tenant_id
      object_id               = var.object_id
      application_id          = var.application_id
      key_permissions         = var.keyvault_key_permissions
      secret_permissions      = var.keyvault_secret_permissions
      certificate_permissions = var.keyvault_certificate_permissions 
      storage_permissions     = var.keyvault_storage_permissions
    }
  }

  dynamic "network_acls" {
    for_each  = var.bypass != null ? [1] : []
    content{
      default_action             = var.default_action
      bypass                     = var.bypass
      ip_rules                   = var.ip_rules
      virtual_network_subnet_ids = var.virtual_network_subnet_ids
    }
  }

  dynamic "contact" {
    for_each  = contains(var.keyvault_certificate_permissions,"ManageContacts") ? [1] : []
    content{
      email = var.contact_email
      name  = var.contact_name
      phone = var.contact_phone     
    }
  }

  tags = var.tags
}
