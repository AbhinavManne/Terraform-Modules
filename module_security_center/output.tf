# output "advthreat_protection_id" {
#   value       = local.advthreat_protection_id
#   description = "The ID of the Advanced Threat Protection resource."
# }

output "assess_policy_id" {
  value       = local.assess_policy_id
  description = " The ID of the Security Center Assessment Policy."
}

output "assess_policy_name" {
  value       = local.assess_policy_name
  description = "The GUID as the name of the Security Center Assessment Policy."
}

output "assessment_id" {
  value       = local.assessment_id
  description = "The ID of the Security Center Assessment."
}

output "auto_provisioning_id" {
  value       = local.auto_provisioning_id
  description = "The ID of the Security Center Auto Provisioning."
}

output "security_contact_id" {
  value       = local.security_contact_id
  description = " The Security Center Contact ID."
}

output "security_setting" {
  value       = local.security_setting
  description = "The subscription security center setting id."
}

output "subscription_pricing_id" {
  value       = local.subscription_pricing_id
  description = "The subscription pricing ID."
}

output "security_workspace_id" {
  value       = local.security_workspace_id
  description = "The Security Center Workspace ID."
}
