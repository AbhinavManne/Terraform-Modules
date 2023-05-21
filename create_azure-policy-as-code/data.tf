data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}
# Roles
data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

data "azurerm_role_definition" "tag_contributor" {
  name = "Tag Contributor"
}

###set defintion 
data "azurerm_policy_set_definition" "azure_security_bench_mark" {
  display_name = "Azure Security Benchmark"
}
###------------------------------Built in policies -----------------------------#########
              #########  Data source Built-in policies 
#################################
# General
#################################


data "azurerm_policy_set_definition" "cis_1_3_0" {
  display_name = "CIS Microsoft Azure Foundations Benchmark v1.3.0"
}


data "azurerm_policy_definition" "allowed_location" {
  display_name = "Allowed locations"
}


data "azurerm_policy_definition" "allowed_location_RG" {
  display_name = "Allowed locations for resource groups"
}

data "azurerm_policy_definition" "resource_location_matches_rgloc" {
  display_name = "Audit resource location matches resource group location"
}

##################
# KeyVault
##################
data "azurerm_policy_definition" "secrets_validity_period" {
  display_name = "Secrets should have the specified maximum validity period"
}


data "azurerm_policy_definition" "keyvault_softdelete_enabled" {
  display_name = "Key vaults should have soft delete enabled"
}

data "azurerm_policy_definition" "keyvault_purgeprotection_enabled" {
  display_name = "Key vaults should have purge protection enabled"
}

data "azurerm_policy_definition" "keyvault_expiration_date" {
  display_name = "Key Vault keys should have an expiration date"
}

#################
//Storage
#################
data "azurerm_policy_definition" "storage_secure_transfer" {
  display_name = "Secure transfer to storage accounts should be enabled"
}

data "azurerm_policy_definition" "storage_restrict_network_access" {
  display_name = "Storage accounts should restrict network access"
}

data "azurerm_policy_definition" "storage_keys_shldnt_expired" {
  display_name = "Storage account keys should not be expired"
}

data "azurerm_policy_definition" "storage_deploy_atp" {
  display_name = "Deploy Advanced Threat Protection on storage accounts"
}

data "azurerm_policy_definition" "geo_redundant_storage" {
  display_name = "Geo-redundant storage should be enabled for Storage Accounts"
}
#################
//Tags
#################
data "azurerm_policy_definition" "require_tag_rg1" {
  display_name = "Require a tag on resource groups"
}

data "azurerm_policy_definition" "require_tag_rg2" {
  display_name = "Require a tag on resource groups"
}

data "azurerm_policy_definition" "require_tag_rg3" {
  display_name = "Require a tag on resource groups"
}

# Modify
data "azurerm_policy_definition" "inherit_tag1" {
  display_name = "Inherit a tag from the resource group"
}

data "azurerm_policy_definition" "inherit_tag2" {
  display_name = "Inherit a tag from the resource group"
}

data "azurerm_policy_definition" "inherit_tag3" {
  display_name = "Inherit a tag from the resource group"
}


data "azurerm_policy_definition" "deploy_diag_setting" {
  display_name = "Configure Azure Activity logs to stream to specified Log Analytics workspace"
}

data "azurerm_policy_definition" "vnet_protection_by_ddos"{
  display_name = "Virtual networks should be protected by Azure DDoS Protection Standard"
}

data "azurerm_policy_definition" "deploy_log_analytics"{
  display_name = "Configure Log Analytics workspace and automation account to centralize logs and monitoring"
}

data "azurerm_policy_definition" "public_ip_creation" {
  display_name = "Not allowed resource types"
}

data "azurerm_policy_definition" "kubernetes_http" {
  display_name = "Kubernetes clusters should be accessible only over HTTPS"
}

data "azurerm_policy_definition" "kubernetes_container_privelege_escalation" {
  display_name = "Kubernetes clusters should not allow container privilege escalation"
}

data "azurerm_policy_definition" "sql_server_defender" {
  display_name = "Configure Azure Defender to be enabled on SQL servers"
}

data "azurerm_policy_definition" "audit_sql_server" {
  display_name = "Auditing on SQL server should be enabled"
}

data "azurerm_policy_definition" "kubernetes_cluster" {
  display_name = "Deploy Azure Policy Add-on to Azure Kubernetes Service clusters"
}

data "azurerm_policy_definition" "vm_backup" {
  display_name = "Configure backup on virtual machines without a given tag to a new recovery services vault with a default policy"
}

