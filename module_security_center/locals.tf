locals {
  //advthreat_protection_id = var.enable_threat_protection ? azurerm_advanced_threat_protection.atp.0.id : null
  assess_policy_id        = var.create_assessment_policy ? azurerm_security_center_assessment_policy.assess_pol.0.id : null
  assess_policy_name      = var.create_assessment_policy ? azurerm_security_center_assessment_policy.assess_pol.0.name : null
  assessment_id           = var.create_assessment_policy ? azurerm_security_center_assessment.assess.0.id : null
  auto_provisioning_id    = var.enable_auto_provision ? azurerm_security_center_auto_provisioning.autopro.0.id : null
  security_contact_id     = var.add_contact ? azurerm_security_center_contact.contact.0.id : null
  security_setting        = var.enable_setting ? azurerm_security_center_setting.setting.0.id : null
  subscription_pricing_id = var.enable_pricing ? azurerm_security_center_subscription_pricing.pricing.0.id : null
  security_workspace_id   = var.add_workspace ? azurerm_security_center_workspace.workspace.0.id : null
}
