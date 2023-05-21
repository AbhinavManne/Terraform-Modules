<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 21/11/2022
##  Introduction 
This module helps us to add role assignment, access to Azure resources is granted by creating a role assignment.

## File Structure 
This particular module is having the following configuration files.
- security.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consists of all the variable definitions needed for the terraform code mentioned in role_assignment.tf
- output.tf : This file will be having the resource output details generated.
- locals.tf : This file consist of all the local variables.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.30.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_security_center_assessment.assess](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_assessment) | resource |
| [azurerm_security_center_assessment_policy.assess_pol](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_assessment_policy) | resource |
| [azurerm_security_center_auto_provisioning.autopro](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_auto_provisioning) | resource |
| [azurerm_security_center_contact.contact](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_contact) | resource |
| [azurerm_security_center_setting.setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_setting) | resource |
| [azurerm_security_center_subscription_pricing.pricing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) | resource |
| [azurerm_security_center_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_contact"></a> [add\_contact](#input\_add\_contact) | Wants to add security center contact? | `bool` | n/a | yes |
| <a name="input_add_workspace"></a> [add\_workspace](#input\_add\_workspace) | Wants to provision security center workspace? | `bool` | n/a | yes |
| <a name="input_additional_data"></a> [additional\_data](#input\_additional\_data) | A map of additional data to associate with the assessment. | `map(string)` | n/a | yes |
| <a name="input_alert_notifications"></a> [alert\_notifications](#input\_alert\_notifications) | Whether to send security alerts notifications to the security contact. | `string` | n/a | yes |
| <a name="input_alerts_to_admins"></a> [alerts\_to\_admins](#input\_alerts\_to\_admins) | Whether to send security alerts notifications to subscription admins. | `string` | n/a | yes |
| <a name="input_assess_policy_categories"></a> [assess\_policy\_categories](#input\_assess\_policy\_categories) | A list of the categories of resource that is at risk when the Security Center Assessment is unhealthy. Possible values are Unknown, Compute, Data, IdentityAndAccess, IoT and Networking. | `list(string)` | n/a | yes |
| <a name="input_assess_policy_description"></a> [assess\_policy\_description](#input\_assess\_policy\_description) | The description of the Security Center Assessment. | `string` | n/a | yes |
| <a name="input_assess_policy_display_name"></a> [assess\_policy\_display\_name](#input\_assess\_policy\_display\_name) | The user-friendly display name of the Security Center Assessment. | `string` | n/a | yes |
| <a name="input_assess_policy_severity"></a> [assess\_policy\_severity](#input\_assess\_policy\_severity) | The severity level of the Security Center Assessment. Possible values are Low, Medium and High. Defaults to Medium. | `string` | n/a | yes |
| <a name="input_assess_policy_threats"></a> [assess\_policy\_threats](#input\_assess\_policy\_threats) | A list of the threat impacts for the Security Center Assessment. Possible values are AccountBreach, DataExfiltration, DataSpillage, DenialOfService, ElevationOfPrivilege, MaliciousInsider, MissingCoverage and ThreatResistance. | `list(string)` | n/a | yes |
| <a name="input_assess_policy_user_impact"></a> [assess\_policy\_user\_impact](#input\_assess\_policy\_user\_impact) | The user impact of the Security Center Assessment. Possible values are Low, Moderate and High. | `string` | n/a | yes |
| <a name="input_auto_provision"></a> [auto\_provision](#input\_auto\_provision) | Should the security agent be automatically provisioned on Virtual Machines in this subscription? Possible values are On (to install the security agent automatically, if it's missing) or Off (to not install the security agent automatically). | `string` | n/a | yes |
| <a name="input_create_assessment_policy"></a> [create\_assessment\_policy](#input\_create\_assessment\_policy) | Wants to create security center assessment policy? | `bool` | n/a | yes |
| <a name="input_enable_auto_provision"></a> [enable\_auto\_provision](#input\_enable\_auto\_provision) | Wants to enable auto provision? | `bool` | n/a | yes |
| <a name="input_enable_pricing"></a> [enable\_pricing](#input\_enable\_pricing) | Wants to enable security center subscription pricing? | `bool` | n/a | yes |
| <a name="input_enable_setting"></a> [enable\_setting](#input\_enable\_setting) | Boolean flag to enable/disable data access. | `bool` | n/a | yes |
| <a name="input_implementation_effort"></a> [implementation\_effort](#input\_implementation\_effort) | The implementation effort which is used to remediate the Security Center Assessment. Possible values are Low, Moderate and High. | `string` | n/a | yes |
| <a name="input_log_analytics_id"></a> [log\_analytics\_id](#input\_log\_analytics\_id) | The ID of the Log Analytics Workspace to save the data in. | `string` | n/a | yes |
| <a name="input_pricing_resource_type"></a> [pricing\_resource\_type](#input\_pricing\_resource\_type) | The resource type this setting affects. Possible values are AppServices, ContainerRegistry, KeyVaults, KubernetesService, SqlServers, SqlServerVirtualMachines, StorageAccounts, VirtualMachines, Arm, OpenSourceRelationalDatabases, Containers and Dns. Defaults to VirtualMachines. | `string` | n/a | yes |
| <a name="input_pricing_tier"></a> [pricing\_tier](#input\_pricing\_tier) | The pricing tier to use. Possible values are Free and Standard. | `string` | n/a | yes |
| <a name="input_remediation_description"></a> [remediation\_description](#input\_remediation\_description) | The description which is used to mitigate the security issue. | `string` | n/a | yes |
| <a name="input_security_center_contact_name"></a> [security\_center\_contact\_name](#input\_security\_center\_contact\_name) | The name of the Security Center Contact. Defaults to default1. | `string` | n/a | yes |
| <a name="input_security_center_email"></a> [security\_center\_email](#input\_security\_center\_email) | The email of the Security Center Contact. | `string` | n/a | yes |
| <a name="input_security_center_phone"></a> [security\_center\_phone](#input\_security\_center\_phone) | The phone number of the Security Center Contact. | `string` | n/a | yes |
| <a name="input_setting_name"></a> [setting\_name](#input\_setting\_name) | The setting to manage. Possible values are MCAS and WDATP. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_status_cause"></a> [status\_cause](#input\_status\_cause) | Specifies the cause of the assessment status | `string` | n/a | yes |
| <a name="input_status_code"></a> [status\_code](#input\_status\_code) | Specifies the programmatic code of the assessment status. Possible values are Healthy, Unhealthy and NotApplicable. | `string` | n/a | yes |
| <a name="input_status_description"></a> [status\_description](#input\_status\_description) | Specifies the human readable description of the assessment status. | `string` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | Target resource ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assess_policy_id"></a> [assess\_policy\_id](#output\_assess\_policy\_id) | The ID of the Security Center Assessment Policy. |
| <a name="output_assess_policy_name"></a> [assess\_policy\_name](#output\_assess\_policy\_name) | The GUID as the name of the Security Center Assessment Policy. |
| <a name="output_assessment_id"></a> [assessment\_id](#output\_assessment\_id) | The ID of the Security Center Assessment. |
| <a name="output_auto_provisioning_id"></a> [auto\_provisioning\_id](#output\_auto\_provisioning\_id) | The ID of the Security Center Auto Provisioning. |
| <a name="output_security_contact_id"></a> [security\_contact\_id](#output\_security\_contact\_id) | The Security Center Contact ID. |
| <a name="output_security_setting"></a> [security\_setting](#output\_security\_setting) | The subscription security center setting id. |
| <a name="output_security_workspace_id"></a> [security\_workspace\_id](#output\_security\_workspace\_id) | The Security Center Workspace ID. |
| <a name="output_subscription_pricing_id"></a> [subscription\_pricing\_id](#output\_subscription\_pricing\_id) | The subscription pricing ID. |

## Module Usage
```
#Reference to security center module
module "security_center" {
  source                       = "../../modules/module_security_center"
  target_resource_id           = var.target_resource_id
  //enable_threat_protection     = var.enable_threat_protection
  create_assessment_policy     = var.create_assessment_policy
  assess_policy_description    = var.assess_policy_description
  assess_policy_display_name   = var.assess_policy_display_name
  assess_policy_severity       = var.assess_policy_severity
  assess_policy_categories     = var.assess_policy_categories
  implementation_effort        = var.implementation_effort
  remediation_description      = var.remediation_description
  assess_policy_threats        = var.assess_policy_threats
  assess_policy_user_impact    = var.assess_policy_user_impact
  additional_data              = var.additional_data
  status_code                  = var.status_code
  status_cause                 = var.status_cause
  status_description           = var.status_description
  enable_auto_provision        = var.enable_auto_provision
  auto_provision               = var.auto_provision
  add_contact                  = var.add_contact
  security_center_contact_name = var.security_center_contact_name
  security_center_email        = var.security_center_email
  security_center_phone        = var.security_center_phone
  alert_notifications          = var.alert_notifications
  alerts_to_admins             = var.alerts_to_admins
  setting_name                 = var.setting_name
  enable_setting               = var.enable_setting
  enable_pricing               = var.enable_pricing
  pricing_tier                 = var.pricing_tier
  pricing_resource_type        = var.pricing_resource_type
  add_workspace                = var.add_workspace
  log_analytics_id             = var.log_analytics_id
}
```
<!-- END_TF_DOCS -->