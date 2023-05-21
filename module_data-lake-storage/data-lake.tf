########################################################################################################################
# Azure Storage Data Lake
########################################################################################################################

resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake" {
  for_each           = var.data_lake_containers != null ? { for k, v in var.data_lake_containers : k => v if v != null } : {}
  storage_account_id = var.storage_account_id
  name               = each.key
  properties         = lookup(each.value,"properties",null)
  owner              = lookup(each.value,"owner","$superuser")
  group              = lookup(each.value,"group","$superuser")


    dynamic "ace" {
        for_each = var.ace != null ? var.ace : {}
        content {
          permissions = lookup(ace.value,"ace_perm")
          type        = lookup(ace.value,"ace_type")
          id          = lookup(ace.value,"ace_type") == "user" || lookup(ace.value,"ace_type") =="group" ? lookup(ace.value,"ace_id",null) : null
          scope       = lookup(ace.value,"ace_scope","access")
          
      }
    }
    }