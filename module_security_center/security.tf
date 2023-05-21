#----ADVANCE THREAT PROTECTION----#
# resource "azurerm_advanced_threat_protection" "atp" {
#   count              = var.enable_threat_protection ? 1 : 0
#   target_resource_id = var.target_resource_id
#   enabled            = var.enable_threat_protection
# }

#----SECURITY CENTER ASSESSMENT POLICY----#
resource "azurerm_security_center_assessment_policy" "assess_pol" {
  count                   = var.create_assessment_policy ? 1 : 0
  description             = var.assess_policy_description
  display_name            = var.assess_policy_display_name
  severity                = var.assess_policy_severity
  categories              = var.assess_policy_categories
  implementation_effort   = var.implementation_effort
  remediation_description = var.remediation_description
  threats                 = var.assess_policy_threats
  user_impact             = var.assess_policy_user_impact
}

#----SECURITY CENTER ASSESSMENT----#
resource "azurerm_security_center_assessment" "assess" {
  count                = var.create_assessment_policy ? 1 : 0
  assessment_policy_id = azurerm_security_center_assessment_policy.assess_pol.0.id
  target_resource_id   = var.target_resource_id
  additional_data      = var.additional_data

  status {
    code        = var.status_code
    cause       = var.status_cause
    description = var.status_description
  }
}

#----SECURITY CENTER AUTO PROVISIONING----#
resource "azurerm_security_center_auto_provisioning" "autopro" {
  count          = var.enable_auto_provision ? 1 : 0
  auto_provision = var.auto_provision
}

#----SECURITY CENTER CONTACT----#
resource "azurerm_security_center_contact" "contact" {
  count               = var.add_contact ? 1 : 0
  name                = var.security_center_contact_name
  email               = var.security_center_email
  phone               = var.security_center_phone
  alert_notifications = var.alert_notifications
  alerts_to_admins    = var.alerts_to_admins
}

#----SECURITY CENTER SETTING----#
resource "azurerm_security_center_setting" "setting" {
  count        = var.enable_setting ? 1 : 0
  setting_name = var.setting_name
  enabled      = var.enable_setting
}

#----SECURITY CENTER PRICING TIER----#
resource "azurerm_security_center_subscription_pricing" "pricing" {
  count         = var.enable_pricing ? 1 : 0
  tier          = var.pricing_tier
  resource_type = var.pricing_resource_type
}

#----SECURITY CENTER WORKSPACE----#
resource "azurerm_security_center_workspace" "workspace" {
  count        = var.add_workspace ? 1 : 0
  scope        = var.target_resource_id //The scope of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope.
  workspace_id = var.log_analytics_id
}
