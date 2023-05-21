variable "target_resource_id" {
  type        = string
  description = "Target resource ID"
}

# variable "enable_threat_protection" {
#   type        = bool
#   description = "Wants to enable threat protection?"
# }

variable "create_assessment_policy" {
  type        = bool
  description = "Wants to create security center assessment policy?"
}

variable "assess_policy_description" {
  type        = string
  description = "The description of the Security Center Assessment."
}

variable "assess_policy_display_name" {
  type        = string
  description = "The user-friendly display name of the Security Center Assessment."
}

variable "assess_policy_severity" {
  type        = string
  description = "The severity level of the Security Center Assessment. Possible values are Low, Medium and High. Defaults to Medium."
}

variable "assess_policy_categories" {
  type        = list(string)
  description = " A list of the categories of resource that is at risk when the Security Center Assessment is unhealthy. Possible values are Unknown, Compute, Data, IdentityAndAccess, IoT and Networking."
}

variable "implementation_effort" {
  type        = string
  description = "The implementation effort which is used to remediate the Security Center Assessment. Possible values are Low, Moderate and High."
}

variable "remediation_description" {
  type        = string
  description = "The description which is used to mitigate the security issue."
}

variable "assess_policy_threats" {
  type        = list(string)
  description = " A list of the threat impacts for the Security Center Assessment. Possible values are AccountBreach, DataExfiltration, DataSpillage, DenialOfService, ElevationOfPrivilege, MaliciousInsider, MissingCoverage and ThreatResistance."
}

variable "assess_policy_user_impact" {
  type        = string
  description = " The user impact of the Security Center Assessment. Possible values are Low, Moderate and High."
}

variable "additional_data" {
  type        = map(string)
  description = "A map of additional data to associate with the assessment."
}

variable "status_code" {
  type        = string
  description = " Specifies the programmatic code of the assessment status. Possible values are Healthy, Unhealthy and NotApplicable."
}

variable "status_cause" {
  type        = string
  description = "Specifies the cause of the assessment status"
}

variable "status_description" {
  type        = string
  description = "Specifies the human readable description of the assessment status."
}

variable "enable_auto_provision" {
  type        = bool
  description = "Wants to enable auto provision?"
}

variable "auto_provision" {
  type        = string
  description = "Should the security agent be automatically provisioned on Virtual Machines in this subscription? Possible values are On (to install the security agent automatically, if it's missing) or Off (to not install the security agent automatically)."
}

variable "add_contact" {
  type        = bool
  description = "Wants to add security center contact?"
}

variable "security_center_contact_name" {
  type        = string
  description = " The name of the Security Center Contact. Defaults to default1."
}

variable "security_center_email" {
  type        = string
  description = "The email of the Security Center Contact."
}

variable "security_center_phone" {
  type        = string
  description = "The phone number of the Security Center Contact."
}

variable "alert_notifications" {
  type        = string
  description = "Whether to send security alerts notifications to the security contact."
}

variable "alerts_to_admins" {
  type        = string
  description = " Whether to send security alerts notifications to subscription admins."
}

variable "setting_name" {
  type        = string
  description = "The setting to manage. Possible values are MCAS and WDATP. Changing this forces a new resource to be created."
}

variable "enable_setting" {
  type        = bool
  description = "Boolean flag to enable/disable data access."
}

variable "enable_pricing" {
  type        = bool
  description = "Wants to enable security center subscription pricing?"
}

variable "pricing_tier" {
  type        = string
  description = "The pricing tier to use. Possible values are Free and Standard."
}

variable "pricing_resource_type" {
  type        = string
  description = "The resource type this setting affects. Possible values are AppServices, ContainerRegistry, KeyVaults, KubernetesService, SqlServers, SqlServerVirtualMachines, StorageAccounts, VirtualMachines, Arm, OpenSourceRelationalDatabases, Containers and Dns. Defaults to VirtualMachines."
}

variable "add_workspace" {
  type        = bool
  description = "Wants to provision security center workspace?"
}

variable "log_analytics_id" {
  type        = string
  description = " The ID of the Log Analytics Workspace to save the data in."
}
