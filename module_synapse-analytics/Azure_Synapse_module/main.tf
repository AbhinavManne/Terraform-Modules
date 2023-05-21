####---------------------  ***** Creating a synapse workspace with customer managed key and aad admin ***** ---------------------####
data "azurerm_key_vault_secret" "secret" {
  name         = var.key_vault_secret_name
  key_vault_id = var.key_vault_id
}


resource "azurerm_storage_data_lake_gen2_filesystem" "egen2" {
  name               = var.filesystem_name
  storage_account_id = var.storage_account_id
}

#----------------------Synapse workspace ------------------------#
resource "azurerm_synapse_workspace" "azsynapse" {
  name                                 = var.synapse_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.egen2.id 
  sql_administrator_login              = var.adminlogin
  sql_administrator_login_password     = data.azurerm_key_vault_secret.secret.value 
  managed_virtual_network_enabled      = var.managed_virtual_network_enabled
  sql_identity_control_enabled         = var.sql_identity_control_enabled
  managed_resource_group_name          = var.managed_resource_group_name != "" ? var.managed_resource_group_name : null
  tags                                 = var.tags
  data_exfiltration_protection_enabled = var.data_exfiltration_protection_enabled
  compute_subnet_id                    = var.compute_subnet_id
  linking_allowed_for_aad_tenant_ids   = var.linking_allowed_for_aad_tenant_ids
  public_network_access_enabled        = var.public_network_access_enabled
  purview_id                           = var.purview_id

   identity {
        type         = var.managed_identity_type
    }
  


  dynamic "aad_admin" {
    for_each = var.aad_admin != null ? [var.aad_admin] : []
    content {
      login     = lookup(aad_admin.value,"login")
      object_id = lookup(aad_admin.value,"object_id")
      tenant_id = lookup(aad_admin.value,"tenant_id")
    }
  }

  dynamic "azure_devops_repo" {
    for_each = var.azure_devops_repo != null ? [var.azure_devops_repo] : []
    content {
      account_name    = lookup(azure_devops_repo.value,"account_name")
      branch_name     = lookup(azure_devops_repo.value,"branch_name")
      project_name    = lookup(azure_devops_repo.value,"project_name")
      repository_name = lookup(azure_devops_repo.value,"repository_name")
      root_folder     = lookup(azure_devops_repo.value, "root_folder")
      last_commit_id  = lookup(azure_devops_repo.value, "last_commit_id", "/")
      tenant_id       = lookup(azure_devops_repo.value, "tenant_id", "/")
    }
  }

  dynamic "github_repo" {
    for_each = var.github_repo != null ? [var.github_repo] : []
    content {
      account_name    = lookup(github_repo.value,"account_name")
      branch_name     = lookup(github_repo.value,"branch_name")
      repository_name = lookup(github_repo.value,"repository_name")
      root_folder     = lookup(github_repo.value, "root_folder", "/")
      git_url         = lookup(github_repo.value, "git_url", null)
      last_commit_id  = lookup(github_repo.value, "last_commit_id", null)
    }
  }

  dynamic "sql_aad_admin" {
    for_each = var.sql_aad_admin != null ? [var.sql_aad_admin] : []
    content {
      login     = lookup(sql_aad_admin.value,"login")
      object_id = lookup(sql_aad_admin.value,"object_id")
      tenant_id = lookup(sql_aad_admin.value,"tenant_id")
    }
  }
}



#---------------------------------------------  **** Sqlpool ****  ----------------------------------#

resource "azurerm_synapse_sql_pool" "sqlpool" {
  for_each             = var.synapse_sql_pool
  name                 = each.key
  synapse_workspace_id = azurerm_synapse_workspace.azsynapse.id
  sku_name             = lookup(each.value, "sku_name", "DW100c")
  collation            = lookup(each.value, "collation", null)
  create_mode          = lookup(each.value, "create_mode", "Default")
  data_encrypted       = lookup(each.value, "data_encrypted", true)
  recovery_database_id = lookup(each.value, "recovery_database_id", null)

  dynamic "restore" {
    for_each = lookup(each.value, "restore", {})
    content {
      source_database_id = lookup(restore.value, "source_database_id")
      point_in_time      = lookup(restore.value, "point_in_time")
    }
  }
}

#---------------------Firewall Rule------------------------#

resource "azurerm_synapse_firewall_rule" "synapsefwrule" {
  for_each             = var.firewall_rules != null ? { for k, v in var.firewall_rules : k => v if v != null } : {}
  name                 = format("%s", each.key)
  synapse_workspace_id = azurerm_synapse_workspace.azsynapse.id
  start_ip_address     = each.value["start_ip_address"]
  end_ip_address       = each.value["end_ip_address"]
}

#--------------------Spark Pool-----------------
resource "azurerm_synapse_spark_pool" "sparkpool" {
  for_each = var.synapse_spark_pool

  name                 = each.key
  synapse_workspace_id = azurerm_synapse_workspace.azsynapse.id
  node_size_family     = lookup(each.value,"node_size_family")
  node_size            = lookup(each.value, "node_size", "Small")
  # node_count should be in the range (3 - 200)
  node_count = lookup(each.value, "node_count", null)

  dynamic "auto_scale" {
    for_each = lookup(each.value, "auto_scale", {})
    content {
      max_node_count = lookup(auto_scale.value,"max_node_count")
      min_node_count = lookup(auto_scale.value,"min_node_count")
    }
  }

  dynamic "auto_pause" {
    for_each = lookup(each.value, "auto_pause", {})
    content {
      delay_in_minutes = lookup(auto_pause.value,"delay_in_minutes")
    }
  }

  dynamic "library_requirement" {
    for_each = lookup(each.value, "library_requirement", {})
    content {
      content  = lookup(library_requirement.value,"content")
      filename = lookup(library_requirement.value,"filename")
    }
  }

  spark_log_folder    = lookup(each.value, "spark_log_folder", "/logs")
  spark_events_folder = lookup(each.value, "spark_events_folder", "/events")
  spark_version       = lookup(each.value, "spark_version", "2.4")
  tags                = var.tags

}


