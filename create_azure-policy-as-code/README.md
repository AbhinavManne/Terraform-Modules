<!-- BEGIN_TF_DOCS -->

## Introduction :

* During POC we have tested and assigned all policies at subscription level scope.
* For testing management group level we need management group contributor role and resource policy contributor role.
* For built-in policies :
Step 1 : Add data source with policy name.
Step 2 : Call the necessary module in main.tf for policy assignment.
Step 3: Create policy assignment by passing all mandatory parameters.
* For policy initiative :
Step 1 : Add the data source with policy name .
Step 2 : Call the necessary module in main.tf for policy initiative.
Step 3 : Pass all the mandatory parameters in policy initiative .
* For Custom policies : 
Step 1 : Call the necessary module in main.tf for custom policy .
Step 2 : Pass all the mandatory parameters and also pass the list of assignment parameters if required.
* list of allowed resources ,has to be revisited according to the requirements

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.29.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Audit_resource_location_matches_rg_location"></a> [Audit\_resource\_location\_matches\_rg\_location](#module\_Audit\_resource\_location\_matches\_rg\_location) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_Secrets_maximum_validity_period"></a> [Secrets\_maximum\_validity\_period](#module\_Secrets\_maximum\_validity\_period) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_geo_redundant_storage"></a> [geo\_redundant\_storage](#module\_geo\_redundant\_storage) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_keyvault_expiration_date"></a> [keyvault\_expiration\_date](#module\_keyvault\_expiration\_date) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_keyvault_purgeprotection_enabled"></a> [keyvault\_purgeprotection\_enabled](#module\_keyvault\_purgeprotection\_enabled) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_keyvault_softdelete_enabled"></a> [keyvault\_softdelete\_enabled](#module\_keyvault\_softdelete\_enabled) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_mg_whitelist_resources"></a> [mg\_whitelist\_resources](#module\_mg\_whitelist\_resources) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_org_mg_azure_security_benchmark"></a> [org\_mg\_azure\_security\_benchmark](#module\_org\_mg\_azure\_security\_benchmark) | ../module_azure-policy-as-code/modules/set_assignment | n/a |
| <a name="module_org_mg_cis_1_3_0_benchmark"></a> [org\_mg\_cis\_1\_3\_0\_benchmark](#module\_org\_mg\_cis\_1\_3\_0\_benchmark) | ../module_azure-policy-as-code/modules/set_assignment | n/a |
| <a name="module_require_tag_rg1"></a> [require\_tag\_rg1](#module\_require\_tag\_rg1) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_storage_keys_shldnt_expired"></a> [storage\_keys\_shldnt\_expired](#module\_storage\_keys\_shldnt\_expired) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_storage_restrict_network_access"></a> [storage\_restrict\_network\_access](#module\_storage\_restrict\_network\_access) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_storage_secure_transfer"></a> [storage\_secure\_transfer](#module\_storage\_secure\_transfer) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_sub_resourcegroupallowedlocations_deny"></a> [sub\_resourcegroupallowedlocations\_deny](#module\_sub\_resourcegroupallowedlocations\_deny) | ../module_azure-policy-as-code/modules/def_assignment | n/a |
| <a name="module_whitelist_resources"></a> [whitelist\_resources](#module\_whitelist\_resources) | ../module_azure-policy-as-code/modules/definition | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/client_config) | data source |
| [azurerm_policy_definition.allowed_location](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.allowed_location_RG](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.audit_sql_server](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.deploy_diag_setting](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.deploy_log_analytics](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.geo_redundant_storage](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.inherit_tag1](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.inherit_tag2](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.inherit_tag3](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.keyvault_expiration_date](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.keyvault_purgeprotection_enabled](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.keyvault_softdelete_enabled](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.kubernetes_container_privelege_escalation](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.kubernetes_http](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.public_ip_creation](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.require_tag_rg1](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.require_tag_rg2](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.require_tag_rg3](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.resource_location_matches_rgloc](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.secrets_validity_period](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.sql_server_defender](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.storage_deploy_atp](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.storage_keys_shldnt_expired](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.storage_restrict_network_access](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.storage_secure_transfer](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.vm_backup](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_definition.vnet_protection_by_ddos](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_definition) | data source |
| [azurerm_policy_set_definition.azure_security_bench_mark](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_set_definition) | data source |
| [azurerm_policy_set_definition.cis_1_3_0](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/policy_set_definition) | data source |
| [azurerm_role_definition.contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/role_definition) | data source |
| [azurerm_role_definition.tag_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/role_definition) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignment_parameters"></a> [assignment\_parameters](#input\_assignment\_parameters) | The policy assignment parameters. Changing this forces a new resource to be created | `any` | `null` | no |
| <a name="input_management_group_scope"></a> [management\_group\_scope](#input\_management\_group\_scope) | Management Group Name | `string` | `null` | no |
| <a name="input_rg_scope"></a> [rg\_scope](#input\_rg\_scope) | rg level scope | `string` | `null` | no |
| <a name="input_skip_remediation"></a> [skip\_remediation](#input\_skip\_remediation) | Skip creation of all remediation tasks for policies that DeployIfNotExists and Modify | `bool` | `false` | no |
| <a name="input_subscription_scope"></a> [subscription\_scope](#input\_subscription\_scope) | subscription scope | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `any` | n/a | yes |

## Module Usage 

```
#--------------------Built-in policies (assignment) --------------------------------------

### policy assignment at subscription level ##########
module "sub_resourcegroupallowedlocations_deny" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.allowed_location_RG
  assignment_scope = var.subscription_scope
  assignment_parameters = {
    "listOfAllowedLocations" = [
      "UK South"
    ]
  }

}


##################---------Policy assignment for all the built-in policies -----------######################

module "Audit_resource_location_matches_rg_location"{
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.allowed_location
  assignment_scope = var.subscription_scope 
  
  assignment_parameters = {
    "listOfAllowedLocations" = [
      "UK South"
    ]
  }
}

module "Secrets_maximum_validity_period"{
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.secrets_validity_period
  assignment_scope = var.subscription_scope 
  assignment_parameters = {
    "maximumValidityInDays" = 2
    
  }
}

module "keyvault_expiration_date" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.secrets_validity_period
  assignment_scope = var.subscription_scope
  assignment_parameters = {
    "maximumValidityInDays" = 2 
  }
}

module "keyvault_purgeprotection_enabled" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.keyvault_purgeprotection_enabled
  assignment_scope = var.subscription_scope
  assignment_parameters = null
}

module "keyvault_softdelete_enabled" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.keyvault_softdelete_enabled
  assignment_scope = var.subscription_scope
  assignment_parameters = null
}


module "geo_redundant_storage" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.geo_redundant_storage
  assignment_scope = var.subscription_scope
  assignment_parameters = null 
}

module "storage_secure_transfer" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.storage_secure_transfer
  assignment_scope = var.subscription_scope
  assignment_parameters = null
}

module "storage_restrict_network_access" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.storage_restrict_network_access
  assignment_scope = var.subscription_scope
  assignment_parameters = null
}

module "require_tag_rg1" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.require_tag_rg1
  assignment_scope = var.subscription_scope
   assignment_parameters = {
    "tagName" = "environment"
  }
}


module "storage_keys_shldnt_expired" {
  source           = "../module_azure-policy-as-code/modules/def_assignment"
  definition       = data.azurerm_policy_definition.storage_keys_shldnt_expired
  assignment_scope = var.subscription_scope
  assignment_parameters = null
  
}

##################
# CIS Custom Benchmark -Initiative 
##################

module "org_mg_cis_1_3_0_benchmark" {
  source           = "../module_azure-policy-as-code/modules/set_assignment"
  initiative       = data.azurerm_policy_set_definition.cis_1_3_0
  assignment_scope = var.subscription_scope 
  assignment_parameters = {
    "effect-b954148f-4c11-4c38-8221-be76711e194a-MicrosoftSql-servers-firewallRules-delete" = "Disabled"
  }
}

##################
# Azure Security Benchmark (Initiative)
##################
module "org_mg_azure_security_benchmark" {
  source           = "../module_azure-policy-as-code/modules/set_assignment"
  initiative       = data.azurerm_policy_set_definition.azure_security_bench_mark
  assignment_scope = var.subscription_scope
}

##########################
# General -  #############   Custom Policies  ##########
##########################
module "whitelist_resources" {
  source              = "../module_azure-policy-as-code/modules/definition"
  policy_name         = "whitelist_resources"
  display_name        = "Whitelist Azure Resource types"
  policy_category     = "General"
  policy_mode         = "All"
  
}

# ############## #################################
#  --------Policy Assignment for custom policy definition ############333
##########################################################
module "mg_whitelist_resources" {
  source                = "../module_azure-policy-as-code/modules/def_assignment"
  definition            = module.whitelist_resources.definition
  assignment_scope      = var.subscription_scope 
  assignment_effect     = "Audit"
  assignment_parameters = local.mg_whitelist_resource_types
}
```

<!-- END_TF_DOCS -->