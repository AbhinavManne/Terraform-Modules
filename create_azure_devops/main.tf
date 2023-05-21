terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.2.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.81.0"
    }
  }
}

provider "azuredevops" {
  //version = ">= 0.0.1"
  # Remember to specify the org service url and personal access token details below
  org_service_url = "https://dev.azure.com/organization/"
  # PAT Value will be store in key vault secret manually.
  personal_access_token = data.azurerm_key_vault_secret.admin_name.value
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}


data "azurerm_key_vault_secret" "admin_name" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

resource "azuredevops_project" "terraform_ado_project" {
  name               = var.project_name
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  # Enable or desiable the DevOps fetures below (enabled / disabled)
  features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "enabled"
    "artifacts"    = "enabled"
  }
}

# resource "azuredevops_git_repository" "r" {
#   project_id = azuredevops_project.terraform_ado_project.id
#   name       = "Sample Repo"
#   initialization {
#     init_type = "Clean"
#   }
# }

# resource "azuredevops_branch_policy_min_reviewers" "p" {
#   project_id = azuredevops_project.terraform_ado_project.id

#   enabled  = true
#   blocking = true

#   settings {
#     reviewer_count     = 2
#     submitter_can_vote = false
#     last_pusher_cannot_approve = true
#     allow_completion_with_rejects_or_waits = false
#     on_push_reset_approved_votes = true # OR on_push_reset_all_votes = true
#     on_last_iteration_require_vote = false

#     scope {
#       repository_id  = azuredevops_git_repository.r.id
#       repository_ref = azuredevops_git_repository.r.default_branch
#       match_type     = "Exact"
#     }

#     scope {
#       repository_id  = null               # All repositories in the project
#       repository_ref = "refs/heads/releases"
#       match_type     = "Prefix"
#     }
#   }
# }

resource "azuredevops_user_entitlement" "tf-user" {
  principal_name       = "aabya.singh@gds.ey.com"
  account_license_type = "stakeholder"
}

resource "azuredevops_group" "tfgroup" {
  scope        = azuredevops_project.terraform_ado_project.id
  display_name = "tf-group"
  description  = "This group is created using terraform"
}

resource "azuredevops_group_membership" "tf-group-membership" {
  group = azuredevops_group.tfgroup.descriptor
  members = [
    azuredevops_user_entitlement.tf-user.descriptor
  ]
  mode = "add"
}
/*
resource "azuredevops_group" "g" {
  scope        = azuredevops_project.terraform_ado_project.id
  display_name = "Test group"
  description  = "Test description"

    members = [
    azuredevops_group.g.descriptor,
    azuredevops_group.g.descriptor
  ]
}

resource "azuredevops_team" "team" {
  project_id = azuredevops_project.terraform_ado_project.id
  name       = "${azuredevops_project.terraform_ado_project.name} Team 2"
}

resource "azuredevops_team_members" "team_members" {
  project_id = azuredevops_team.team.project_id
  team_id    = azuredevops_team.team.id
  mode       = "overwrite"
  members = [
    azuredevops_group.g.descriptor
  ]
}*/
/*
data "azuredevops_group" "builtin_project_contributors" {
  project_id = "${azuredevops_project.terraform_ado_project.id}"
  name       = "Contributors"
}

resource "azuredevops_team" "team" {
  project_id = azuredevops_project.terraform_ado_project.id
  name       = "${azuredevops_project.terraform_ado_project.name} Team 2"
}

resource "azuredevops_team_administrators" "team_administrators" {
  project_id = azuredevops_team.team.project_id
  team_id    = azuredevops_team.team.id
  mode       = "overwrite"
  administrators = [
    data.azuredevops_group.builtin_project_contributors.descriptor
  ]
}*/