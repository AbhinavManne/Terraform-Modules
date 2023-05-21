locals {
  mg_add_replace_resource_group_tag_key_modify = {
    tags = var.tags
  }
}


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

# Policy Assignment for custom policy definition
module "mg_whitelist_resources" {
  source                = "../module_azure-policy-as-code/modules/def_assignment"
  definition            = module.whitelist_resources.definition
  assignment_scope      = var.subscription_scope 
  assignment_effect     = "Audit"
  assignment_parameters = local.mg_whitelist_resource_types
}

############################
# Resource Types to Whitelist
#############################

## Note :- This is a list of allowed resources ,has to be revisited according to the requirements .
locals {
  mg_whitelist_resource_types = {
    listOfResourceTypesAllowed = [
      "microsoft.insights/components",
      "microsoft.insights/components/query",
      "microsoft.insights/components/metadata",
      "microsoft.insights/components/metrics",
      "microsoft.insights/components/events",
      "microsoft.insights/components/syntheticmonitorlocations",
      "microsoft.insights/components/analyticsItems",
      "microsoft.insights/components/webtests",
      "microsoft.insights/components/workItemConfigs",
      "microsoft.insights/components/myFavorites",
      "microsoft.insights/components/operations",
      "microsoft.insights/components/exportConfiguration",
      "microsoft.insights/components/purge",
      "microsoft.insights/components/api",
      "microsoft.insights/components/aggregate",
      "microsoft.insights/components/metricDefinitions",
      "microsoft.insights/components/extendQueries",
      "microsoft.insights/components/apiKeys",
      "microsoft.insights/components/myAnalyticsItems",
      "microsoft.insights/components/favorites",
      "microsoft.insights/components/defaultWorkItemConfig",
      "microsoft.insights/components/annotations",
      "microsoft.insights/components/proactiveDetectionConfigs",
      "microsoft.insights/components/move",
      "microsoft.insights/components/currentBillingFeatures",
      "microsoft.insights/components/quotaStatus",
      "microsoft.insights/components/featureCapabilities",
      "microsoft.insights/components/getAvailableBillingFeatures",
      "microsoft.insights/webtests",
      "microsoft.insights/webtests/getTestResultFile",
      "microsoft.insights/scheduledqueryrules",
      "microsoft.insights/components/pricingPlans",
      "microsoft.insights/migrateToNewPricingModel",
      "microsoft.insights/rollbackToLegacyPricingModel",
      "microsoft.insights/listMigrationdate",
      "microsoft.insights/logprofiles",
      "microsoft.insights/migratealertrules",
      "microsoft.insights/metricalerts",
      "microsoft.insights/alertrules",
      "microsoft.insights/autoscalesettings",
      "microsoft.insights/eventtypes",
      "microsoft.insights/locations",
      "microsoft.insights/locations/operationResults",
      "microsoft.insights/vmInsightsOnboardingStatuses",
      "microsoft.insights/operations",
      "microsoft.insights/diagnosticSettings",
      "microsoft.insights/diagnosticSettingsCategories",
      "microsoft.insights/extendedDiagnosticSettings",
      "microsoft.insights/metricDefinitions",
      "microsoft.insights/logDefinitions",
      "microsoft.insights/eventCategories",
      "microsoft.insights/metrics",
      "microsoft.insights/metricbatch",
      "microsoft.insights/metricNamespaces",
      "microsoft.insights/notificationstatus",
      "microsoft.insights/createnotifications",
      "microsoft.insights/actiongroups",
      "microsoft.insights/activityLogAlerts",
      "microsoft.insights/metricbaselines",
      "microsoft.insights/workbooks",
      "microsoft.insights/workbooktemplates",
      "microsoft.insights/myWorkbooks",
      "microsoft.insights/logs",
      "microsoft.insights/transactions",
      "microsoft.insights/topology",
      "microsoft.insights/generateLiveToken",
      "microsoft.insights/monitoredObjects",
      "microsoft.insights/dataCollectionRules",
      "microsoft.insights/dataCollectionRuleAssociations",
      "microsoft.insights/dataCollectionEndpoints",
      "microsoft.insights/dataCollectionEndpoints/scopedPrivateLinkProxies",
      "microsoft.insights/privateLinkScopes",
      "microsoft.insights/privateLinkScopes/privateEndpointConnections",
      "microsoft.insights/privateLinkScopes/privateEndpointConnectionProxies",
      "microsoft.insights/privateLinkScopes/scopedResources",
      "microsoft.insights/components/linkedstorageaccounts",
      "microsoft.insights/privateLinkScopeOperationStatuses",
      "Microsoft.OperationalInsights/workspaces",
      "Microsoft.OperationalInsights/querypacks",
      "Microsoft.OperationalInsights/locations",
      "Microsoft.OperationalInsights/locations/operationStatuses",
      "Microsoft.OperationalInsights/workspaces/scopedPrivateLinkProxies",
      "Microsoft.OperationalInsights/workspaces/query",
      "Microsoft.OperationalInsights/workspaces/metadata",
      "Microsoft.OperationalInsights/workspaces/dataSources",
      "Microsoft.OperationalInsights/workspaces/linkedStorageAccounts",
      "Microsoft.OperationalInsights/workspaces/tables",
      "Microsoft.OperationalInsights/workspaces/storageInsightConfigs",
      "Microsoft.OperationalInsights/storageInsightConfigs",
      "Microsoft.OperationalInsights/workspaces/linkedServices",
      "Microsoft.OperationalInsights/linkTargets",
      "Microsoft.OperationalInsights/deletedWorkspaces",
      "Microsoft.OperationalInsights/operations",
      "Microsoft.OperationalInsights/clusters",
      "Microsoft.OperationalInsights/workspaces/dataExports",
      "Microsoft.OperationsManagement/solutions",
      "Microsoft.OperationsManagement/managementconfigurations",
      "Microsoft.OperationsManagement/managementassociations",
      "Microsoft.OperationsManagement/views",
      "Microsoft.OperationsManagement/operations",
      "Microsoft.SecurityInsights/operations",
      "Microsoft.SecurityInsights/alertRules",
      "Microsoft.SecurityInsights/alertRuleTemplates",
      "Microsoft.SecurityInsights/cases",
      "Microsoft.SecurityInsights/bookmarks",
      "Microsoft.SecurityInsights/dataConnectors",
      "Microsoft.SecurityInsights/dataConnectorsCheckRequirements",
      "Microsoft.SecurityInsights/enrichment",
      "Microsoft.SecurityInsights/fileImports",
      "Microsoft.SecurityInsights/entities",
      "Microsoft.SecurityInsights/incidents",
      "Microsoft.SecurityInsights/officeConsents",
      "Microsoft.SecurityInsights/settings",
      "Microsoft.SecurityInsights/aggregations",
      "Microsoft.SecurityInsights/entityQueries",
      "Microsoft.SecurityInsights/entityQueryTemplates",
      "Microsoft.SecurityInsights/threatIntelligence",
      "Microsoft.SecurityInsights/automationRules",
      "Microsoft.SecurityInsights/sourceControls",
      "Microsoft.SecurityInsights/listrepositories",
      "Microsoft.SecurityInsights/watchlists",
      "Microsoft.SecurityInsights/onboardingStates",
      "Microsoft.SecurityInsights/metadata",
      "Microsoft.SecurityInsights/MitreCoverageRecords",
      "Microsoft.SecurityInsights/securityMLAnalyticsSettings",
      "Microsoft.Advisor/suppressions",
      "Microsoft.Advisor/recommendations",
      "Microsoft.Advisor/generateRecommendations",
      "Microsoft.Advisor/operations",
      "Microsoft.Storage/storageAccounts/encryptionScopes",
      "Microsoft.Storage/deletedAccounts",
      "Microsoft.Storage/locations/deletedAccounts",
      "Microsoft.Storage/storageAccounts",
      "Microsoft.Storage/operations",
      "Microsoft.Storage/locations/asyncoperations",
      "Microsoft.Storage/storageAccounts/listAccountSas",
      "Microsoft.Storage/storageAccounts/listServiceSas",
      "Microsoft.Storage/storageAccounts/blobServices",
      "Microsoft.Storage/storageAccounts/tableServices",
      "Microsoft.Storage/storageAccounts/queueServices",
      "Microsoft.Storage/storageAccounts/fileServices",
      "Microsoft.Storage/locations",
      "Microsoft.Storage/locations/usages",
      "Microsoft.Storage/locations/deleteVirtualNetworkOrSubnets",
      "Microsoft.Storage/usages",
      "Microsoft.Storage/checkNameAvailability",
      "Microsoft.Storage/locations/checkNameAvailability",
      "Microsoft.Storage/storageAccounts/services",
      "Microsoft.Storage/storageAccounts/services/metricDefinitions",
      "Microsoft.KeyVault/vaults",
      "Microsoft.KeyVault/vaults/secrets",
      "Microsoft.KeyVault/vaults/accessPolicies",
      "Microsoft.KeyVault/operations",
      "Microsoft.KeyVault/checkNameAvailability",
      "Microsoft.KeyVault/deletedVaults",
      "Microsoft.KeyVault/locations",
      "Microsoft.KeyVault/locations/deletedVaults",
      "Microsoft.KeyVault/locations/deleteVirtualNetworkOrSubnets",
      "Microsoft.KeyVault/locations/operationResults",
      "Microsoft.KeyVault/vaults/eventGridFilters",
      "Microsoft.KeyVault/managedHSMs",
      "Microsoft.KeyVault/deletedManagedHSMs",
      "Microsoft.KeyVault/locations/deletedManagedHSMs",
      "Microsoft.KeyVault/locations/managedHsmOperationResults",
      "Microsoft.KeyVault/vaults/keys",
      "Microsoft.KeyVault/vaults/keys/versions",
      "Microsoft.ManagedIdentity/Identities",
      "Microsoft.ManagedIdentity/userAssignedIdentities",
      "Microsoft.ManagedIdentity/operations",
      "Microsoft.Management/resources",
      "Microsoft.Management/managementGroups",
      "Microsoft.Management/getEntities",
      "Microsoft.Management/checkNameAvailability",
      "Microsoft.Management/operationResults",
      "Microsoft.Management/operations",
      "Microsoft.Management/tenantBackfillStatus",
      "Microsoft.Management/startTenantBackfill",
      "Microsoft.PolicyInsights/policyEvents",
      "Microsoft.PolicyInsights/policyStates",
      "Microsoft.PolicyInsights/operations",
      "Microsoft.PolicyInsights/asyncOperationResults",
      "Microsoft.PolicyInsights/remediations",
      "Microsoft.PolicyInsights/eventGridFilters",
      "Microsoft.PolicyInsights/checkPolicyRestrictions",
      "Microsoft.PolicyInsights/policyTrackedResources",
      "Microsoft.PolicyInsights/policyMetadata",
      "Microsoft.Portal/dashboards",
      "Microsoft.Portal/tenantconfigurations",
      "Microsoft.Portal/listTenantConfigurationViolations",
      "Microsoft.Portal/operations",
      "Microsoft.Portal/locations",
      "Microsoft.Portal/consoles",
      "Microsoft.Portal/locations/consoles",
      "Microsoft.Portal/userSettings",
      "Microsoft.Portal/locations/userSettings",
      "Microsoft.ResourceHealth/availabilityStatuses",
      "Microsoft.ResourceHealth/childAvailabilityStatuses",
      "Microsoft.ResourceHealth/childResources",
      "Microsoft.ResourceHealth/events",
      "Microsoft.ResourceHealth/metadata",
      "Microsoft.ResourceHealth/emergingissues",
      "Microsoft.ResourceHealth/operations",
      "Microsoft.Security/operations",
      "Microsoft.Security/securityStatuses",
      "Microsoft.Security/tasks",
      "Microsoft.Security/secureScores",
      "Microsoft.Security/secureScores/secureScoreControls",
      "Microsoft.Security/secureScoreControls",
      "Microsoft.Security/secureScoreControlDefinitions",
      "Microsoft.Security/connectors",
      "Microsoft.Security/regulatoryComplianceStandards",
      "Microsoft.Security/regulatoryComplianceStandards/regulatoryComplianceControls",
      "Microsoft.Security/regulatoryComplianceStandards/regulatoryComplianceControls/regulatoryComplianceAssessments",
      "Microsoft.Security/alerts",
      "Microsoft.Security/alertsSuppressionRules",
      "Microsoft.Security/autoDismissAlertsRules",
      "Microsoft.Security/dataCollectionAgents",
      "Microsoft.Security/pricings",
      "Microsoft.Security/AutoProvisioningSettings",
      "Microsoft.Security/MdeOnboardings",
      "Microsoft.Security/Compliances",
      "Microsoft.Security/securityContacts",
      "Microsoft.Security/workspaceSettings",
      "Microsoft.Security/complianceResults",
      "Microsoft.Security/policies",
      "Microsoft.Security/assessments",
      "Microsoft.Security/assessmentMetadata",
      "Microsoft.Security/subAssessments",
      "Microsoft.Security/securitySolutions",
      "Microsoft.Security/locations/securitySolutions",
      "Microsoft.Security/discoveredSecuritySolutions",
      "Microsoft.Security/locations/discoveredSecuritySolutions",
      "Microsoft.Security/allowedConnections",
      "Microsoft.Security/locations/allowedConnections",
      "Microsoft.Security/topologies",
      "Microsoft.Security/locations/topologies",
      "Microsoft.Security/securitySolutionsReferenceData",
      "Microsoft.Security/locations/securitySolutionsReferenceData",
      "Microsoft.Security/jitPolicies",
      "Microsoft.Security/jitNetworkAccessPolicies",
      "Microsoft.Security/locations/jitNetworkAccessPolicies",
      "Microsoft.Security/locations",
      "Microsoft.Security/securityStatusesSummaries",
      "Microsoft.Security/applicationWhitelistings",
      "Microsoft.Security/locations/applicationWhitelistings",
      "Microsoft.Security/locations/alerts",
      "Microsoft.Security/locations/tasks",
      "Microsoft.Security/externalSecuritySolutions",
      "Microsoft.Security/locations/externalSecuritySolutions",
      "Microsoft.Security/InformationProtectionPolicies",
      "Microsoft.Security/advancedThreatProtectionSettings",
      "Microsoft.Security/sqlVulnerabilityAssessments",
      "Microsoft.Security/deviceSecurityGroups",
      "Microsoft.Security/iotSecuritySolutions",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels",
      "Microsoft.Security/iotSecuritySolutions/iotAlertTypes",
      "Microsoft.Security/iotSecuritySolutions/iotAlerts",
      "Microsoft.Security/iotSecuritySolutions/iotRecommendationTypes",
      "Microsoft.Security/iotSecuritySolutions/iotRecommendations",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels/aggregatedAlerts",
      "Microsoft.Security/iotSecuritySolutions/analyticsModels/aggregatedRecommendations",
      "Microsoft.Security/settings",
      "Microsoft.Security/serverVulnerabilityAssessments",
      "Microsoft.Security/serverVulnerabilityAssessmentsSettings",
      "Microsoft.Security/adaptiveNetworkHardenings",
      "Microsoft.Security/automations",
      "Microsoft.Security/ingestionSettings",
      "Microsoft.Security/insights",
      "Microsoft.Security/securityConnectors",
      "Microsoft.Security/customAssessmentAutomations",
      "Microsoft.Security/customEntityStoreAssignments",
      "Microsoft.Security/standards",
      "Microsoft.Security/assignments",
      "Microsoft.Authorization/roleAssignments",
      "Microsoft.Authorization/roleDefinitions",
      "Microsoft.Authorization/classicAdministrators",
      "Microsoft.Authorization/permissions",
      "Microsoft.Authorization/denyAssignments",
      "Microsoft.Authorization/locks",
      "Microsoft.Authorization/operations",
      "Microsoft.Authorization/policyDefinitions",
      "Microsoft.Authorization/policySetDefinitions",
      "Microsoft.Authorization/policyAssignments",
      "Microsoft.Authorization/policyExemptions",
      "Microsoft.Authorization/dataAliases",
      "Microsoft.Authorization/providerOperations",
      "Microsoft.Authorization/elevateAccess",
      "Microsoft.Authorization/checkAccess",
      "Microsoft.Authorization/findOrphanRoleAssignments",
      "Microsoft.Authorization/roleAssignmentsUsageMetrics",
      "Microsoft.Authorization/privateLinkAssociations",
      "Microsoft.Authorization/resourceManagementPrivateLinks",
      "Microsoft.Authorization/operationStatus",
      "Microsoft.Maintenance/maintenanceConfigurations",
      "Microsoft.Maintenance/updates",
      "Microsoft.Maintenance/configurationAssignments",
      "Microsoft.Maintenance/applyUpdates",
      "Microsoft.Maintenance/publicMaintenanceConfigurations",
      "Microsoft.Maintenance/operations",
      "Microsoft.Diagnostics/operations",
      "Microsoft.Diagnostics/operationResults",
      "Microsoft.Diagnostics/checkNameAvailability",
      "Microsoft.Subscription/SubscriptionDefinitions",
      "Microsoft.Subscription/SubscriptionOperations",
      "Microsoft.Subscription/CreateSubscription",
      "Microsoft.Subscription/operations",
      "Microsoft.Subscription/cancel",
      "Microsoft.Subscription/rename",
      "Microsoft.Subscription/enable",
      "Microsoft.Subscription/subscriptions",
      "Microsoft.Subscription/aliases",
      "Microsoft.Subscription/operationResults",
      "Microsoft.Subscription/acceptChangeTenant",
      "Microsoft.Subscription/changeTenantStatus",
      "Microsoft.Subscription/changeTenantRequest",
      "Microsoft.Subscription/policies",
      "Microsoft.Subscription/acceptOwnership",
      "Microsoft.Subscription/acceptOwnershipStatus",
      "microsoft.aadiam/azureADMetrics",
      "microsoft.aadiam/privateLinkForAzureAD",
      "microsoft.aadiam/tenants",
      "microsoft.aadiam/operations",
      "microsoft.aadiam/diagnosticSettings",
      "microsoft.aadiam/diagnosticSettingsCategories",
      "Microsoft.Billing/billingPeriods",
      "Microsoft.Billing/invoices",
      "Microsoft.Billing/enrollmentAccounts",
      "Microsoft.Billing/permissionRequests",
      "Microsoft.Billing/billingAccounts/permissionRequests",
      "Microsoft.Billing/billingRoleDefinitions",
      "Microsoft.Billing/billingRoleAssignments",
      "Microsoft.Billing/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/billingProfiles/createBillingRoleAssignment",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/createBillingRoleAssignment",
      "Microsoft.Billing/billingPermissions",
      "Microsoft.Billing/billingAccounts/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingPermissions",
      "Microsoft.Billing/billingAccounts",
      "Microsoft.Billing/billingAccounts/policies",
      "Microsoft.Billing/billingAccounts/operationResults",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingPermissions",
      "Microsoft.Billing/billingAccounts/customers",
      "Microsoft.Billing/billingAccounts/billingProfiles/customers",
      "Microsoft.Billing/billingAccounts/billingProfiles/instructions",
      "Microsoft.Billing/billingAccounts/customers/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/customers/products",
      "Microsoft.Billing/billingAccounts/customers/transactions",
      "Microsoft.Billing/billingAccounts/invoiceSections",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingPermissions",
      "Microsoft.Billing/billingAccounts/customers/billingPermissions",
      "Microsoft.Billing/billingAccounts/invoiceSections/elevate",
      "Microsoft.Billing/billingAccounts/createInvoiceSectionOperations",
      "Microsoft.Billing/billingAccounts/patchOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/patchOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/productMoveOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptionMoveOperations",
      "Microsoft.Billing/billingAccounts/listInvoiceSectionsWithCreateSubscriptionPermission",
      "Microsoft.Billing/billingAccounts/billingProfiles",
      "Microsoft.Billing/billingAccounts/BillingProfiles/patchOperations",
      "Microsoft.Billing/departments",
      "Microsoft.Billing/billingAccounts/departments",
      "Microsoft.Billing/billingAccounts/departments/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/departments/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/departments/billingPermissions",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts",
      "Microsoft.Billing/billingAccounts/departments/enrollmentAccounts",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts/billingRoleDefinitions",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts/billingRoleAssignments",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts/billingPermissions",
      "Microsoft.Billing/billingAccounts/enrollmentAccounts/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/departments/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingProfiles/paymentMethods",
      "Microsoft.Billing/billingAccounts/availableBalance",
      "Microsoft.Billing/billingAccounts/billingProfiles/availableBalance",
      "Microsoft.Billing/billingAccounts/invoices",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoices",
      "Microsoft.Billing/billingAccounts/transactions",
      "Microsoft.Billing/billingAccounts/billingProfiles/transactions",
      "Microsoft.Billing/billingAccounts/invoiceSections/transactions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/transactions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoices/transactions",
      "Microsoft.Billing/billingAccounts/invoices/transactions",
      "Microsoft.Billing/billingAccounts/billingProfiles/validateDeleteBillingProfileEligibility",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/validateDeleteInvoiceSectionEligibility",
      "Microsoft.Billing/billingAccounts/invoices/transactionSummary",
      "Microsoft.Billing/billingAccounts/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingSubscriptionAliases",
      "Microsoft.Billing/billingAccounts/billingSubscriptions/invoices",
      "Microsoft.Billing/billingAccounts/billingProfiles/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptions",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/billingSubscriptions",
      "Microsoft.Billing/operationStatus",
      "Microsoft.Billing/operationResults",
      "Microsoft.Billing/billingAccounts/invoiceSections/products",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products",
      "Microsoft.Billing/billingAccounts/invoiceSections/products/updateAutoRenew",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products/updateAutoRenew",
      "Microsoft.Billing/billingAccounts/billingProfiles/products",
      "Microsoft.Billing/billingAccounts/products",
      "Microsoft.Billing/operations",
      "Microsoft.Billing/billingAccounts/invoiceSections/initiateTransfer",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/initiateTransfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/transfers",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/transfers",
      "Microsoft.Billing/transfers/acceptTransfer",
      "Microsoft.Billing/transfers",
      "Microsoft.Billing/transfers/declineTransfer",
      "Microsoft.Billing/transfers/validateTransfer",
      "Microsoft.Billing/billingAccounts/customers/initiateTransfer",
      "Microsoft.Billing/billingAccounts/customers/transfers",
      "Microsoft.Billing/billingAccounts/customers/transferSupportedAccounts",
      "Microsoft.Billing/billingProperty",
      "Microsoft.Billing/billingAccounts/billingProfiles/policies",
      "Microsoft.Billing/billingAccounts/customers/policies",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoices/pricesheet",
      "Microsoft.Billing/billingAccounts/billingProfiles/pricesheet",
      "Microsoft.Billing/billingAccounts/billingProfiles/pricesheetDownloadOperations",
      "Microsoft.Billing/billingAccounts/invoiceSections/billingSubscriptions/transfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/products/transfer",
      "Microsoft.Billing/billingAccounts/billingProfiles/invoiceSections/products/transfer",
      "Microsoft.Billing/billingAccounts/invoiceSections/productTransfersResults",
      "Microsoft.Billing/transfers/operationStatus",
      "Microsoft.Billing/billingAccounts/agreements",
      "Microsoft.Billing/billingAccounts/lineOfCredit",
      "Microsoft.Billing/billingAccounts/paymentMethods",
      "Microsoft.Billing/paymentMethods",
      "Microsoft.Billing/billingAccounts/billingProfiles/paymentMethodLinks",
      "Microsoft.Billing/billingAccounts/payableOverage",
      "Microsoft.Billing/billingAccounts/payNow",
      "Microsoft.Billing/billingAccounts/reservations",
      "Microsoft.Billing/billingAccounts/billingProfiles/reservations",
      "Microsoft.Billing/billingAccounts/billingProfiles/validateDetachPaymentMethodEligibility",
      "Microsoft.Billing/validateAddress",
      "Microsoft.Billing/promotions",
      "Microsoft.Billing/promotions/checkeligibility",
      "Microsoft.Billing/billingAccounts/billingSubscriptions/elevateRole",
      "Microsoft.Billing/billingAccounts/appliedReservationOrders",
      "Microsoft.Billing/promotionalCredits",
      "Microsoft.Billing/billingAccounts/promotionalCredits",
      "Microsoft.Billing/billingAccounts/savingsPlanOrders/savingsPlans",
      "Microsoft.Billing/billingAccounts/savingsPlanOrders",
      "Microsoft.Billing/billingAccounts/savingsPlans",
      "Microsoft.BillingBenefits/savingsPlanOrders",
      "Microsoft.BillingBenefits/savingsPlanOrders/savingsPlans",
      "Microsoft.BillingBenefits/validate",
      "Microsoft.BillingBenefits/operations",
      "Microsoft.BillingBenefits/savingsPlanOrderAliases",
      "Microsoft.BillingBenefits/savingsPlans",
      "Microsoft.CostManagement/Connectors",
      "Microsoft.CostManagement/CloudConnectors",
      "Microsoft.CostManagement/CheckConnectorEligibility",
      "Microsoft.CostManagement/ExternalBillingAccounts",
      "Microsoft.CostManagement/ExternalBillingAccounts/Dimensions",
      "Microsoft.CostManagement/ExternalBillingAccounts/Query",
      "Microsoft.CostManagement/ExternalSubscriptions/Dimensions",
      "Microsoft.CostManagement/ExternalSubscriptions/Query",
      "Microsoft.CostManagement/ExternalSubscriptions",
      "Microsoft.CostManagement/Forecast",
      "Microsoft.CostManagement/ExternalSubscriptions/Forecast",
      "Microsoft.CostManagement/ExternalBillingAccounts/Forecast",
      "Microsoft.CostManagement/Settings",
      "Microsoft.CostManagement/operations",
      "Microsoft.CostManagement/register",
      "Microsoft.CostManagement/Query",
      "Microsoft.CostManagement/Dimensions",
      "Microsoft.CostManagement/Budgets",
      "Microsoft.CostManagement/ExternalSubscriptions/Alerts",
      "Microsoft.CostManagement/ExternalBillingAccounts/Alerts",
      "Microsoft.CostManagement/Alerts",
      "Microsoft.CostManagement/showbackRules",
      "Microsoft.CostManagement/costAllocationRules",
      "Microsoft.CostManagement/Exports",
      "Microsoft.CostManagement/Reports",
      "Microsoft.CostManagement/Reportconfigs",
      "Microsoft.CostManagement/BillingAccounts",
      "Microsoft.CostManagement/Departments",
      "Microsoft.CostManagement/EnrollmentAccounts",
      "Microsoft.CostManagement/Views",
      "Microsoft.CostManagement/Publish",
      "Microsoft.CostManagement/ScheduledActions",
      "Microsoft.CostManagement/CheckNameAvailability",
      "Microsoft.CostManagement/BenefitUtilizationSummaries",
      "Microsoft.CostManagement/BenefitRecommendations",
      "Microsoft.CostManagement/Insights",
      "Microsoft.CostManagement/fetchPrices",
      "Microsoft.CostManagement/fetchMicrosoftPrices",
      "Microsoft.CostManagement/fetchMarketplacePrices",
      "Microsoft.CostManagement/calculatePrice",
      "Microsoft.CostManagement/GenerateReservationDetailsReport",
      "Microsoft.CostManagement/ReservationDetailsOperationResults",
      "Microsoft.CostManagement/GenerateDetailedCostReport",
      "Microsoft.CostManagement/OperationStatus",
      "Microsoft.CostManagement/OperationResults",
      "Microsoft.CostManagement/Pricesheets",
      "Microsoft.ResourceGraph/resources",
      "Microsoft.ResourceGraph/resourcesHistory",
      "Microsoft.ResourceGraph/resourceChanges",
      "Microsoft.ResourceGraph/resourceChangeDetails",
      "Microsoft.ResourceGraph/operations",
      "Microsoft.ResourceGraph/subscriptionsStatus",
      "Microsoft.ResourceGraph/queries",
      "Microsoft.Resources/tenants",
      "Microsoft.Resources/locations",
      "Microsoft.Resources/operationresults",
      "Microsoft.Resources/notifyResourceJobs",
      "Microsoft.Resources/tags",
      "Microsoft.Resources/checkPolicyCompliance",
      "Microsoft.Resources/providers",
      "Microsoft.Resources/checkresourcename",
      "Microsoft.Resources/calculateTemplateHash",
      "Microsoft.Resources/resources",
      "Microsoft.Resources/subscriptions",
      "Microsoft.Resources/subscriptions/resources",
      "Microsoft.Resources/subscriptions/providers",
      "Microsoft.Resources/subscriptions/operationresults",
      "Microsoft.Resources/resourceGroups",
      "Microsoft.Resources/subscriptions/resourceGroups",
      "Microsoft.Resources/subscriptions/resourcegroups/resources",
      "Microsoft.Resources/subscriptions/locations",
      "Microsoft.Resources/subscriptions/tagnames",
      "Microsoft.Resources/subscriptions/tagNames/tagValues",
      "Microsoft.Resources/deployments",
      "Microsoft.Resources/deployments/operations",
      "Microsoft.Resources/links",
      "Microsoft.Resources/operations",
      "Microsoft.Resources/bulkDelete",
      "Microsoft.Resources/deploymentScripts",
      "Microsoft.Resources/deploymentScripts/logs",
      "Microsoft.Resources/locations/deploymentScriptOperationResults",
      "Microsoft.Resources/templateSpecs",
      "Microsoft.Resources/templateSpecs/versions",
      "Microsoft.Resources/builtInTemplateSpecs",
      "Microsoft.Resources/builtInTemplateSpecs/versions",
      "Microsoft.Resources/changes",
      "microsoft.support/operations",
      "microsoft.support/checkNameAvailability",
      "microsoft.support/services",
      "microsoft.support/services/problemclassifications",
      "microsoft.support/supporttickets",
      "microsoft.support/operationresults",
      "microsoft.support/operationsstatus",
      "microsoft.support/lookUpResourceId",
      "microsoft.advisor/configurations"
    ]
  }
}
