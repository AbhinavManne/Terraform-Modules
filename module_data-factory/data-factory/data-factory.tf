#------------------------------------------------- Data Factory ----------------------------------------------------


resource "azurerm_data_factory" "df" {
  name                = var.data_factory_name
  resource_group_name = var.resource_group_name
  location            = var.location
  //----------------------------optional arguments--------------------------------------
  managed_virtual_network_enabled  = var.managed_virtual_network_enabled
  public_network_enabled           = var.public_network_enabled
  customer_managed_key_id          = var.customer_managed_key_id != null ? var.customer_managed_key_id : null
  customer_managed_key_identity_id = var.customer_managed_key_id != null ? var.customer_managed_key_identity_id : null
  #--------------------------------------------------------------------------------------
  tags = var.tags

  dynamic "github_configuration" {
    for_each = var.github_configuration != null ? [var.github_configuration] : []

    content {
      account_name    = github_configuration.value.account_name
      branch_name     = github_configuration.value.branch_name
      git_url         = github_configuration.value.git_url
      repository_name = github_configuration.value.repository_name
      root_folder     = github_configuration.value.root_folder
    }
  }

  dynamic "global_parameter" {
    for_each = var.global_parameter != null ? [var.global_parameter] : []

    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [var.identity_type] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }

  dynamic "vsts_configuration" {
    for_each = var.vsts_configuration != null ? [var.vsts_configuration] : []

    content {
      account_name    = vsts_configuration.value.account_name
      branch_name     = vsts_configuration.value.branch_name
      project_name    = vsts_configuration.value.project_name
      repository_name = vsts_configuration.value.repository_name
      root_folder     = vsts_configuration.value.root_folder
      tenant_id       = vsts_configuration.value.tenant_id
    }
  }

}

