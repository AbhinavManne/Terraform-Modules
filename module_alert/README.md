<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 10/10/2022
##  Introduction 
This module provisions following resources- monitor action group, action rule, log alert and metric alert.

## File Structure 
This particular module is having the following configuration files.
- alert.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in alert.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.mactiong](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_monitor_action_rule_action_group.mactionrg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_rule_action_group) | resource |
| [azurerm_monitor_activity_log_alert.log_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_activity_log_alert) | resource |
| [azurerm_monitor_metric_alert.metric_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_auth"></a> [aad\_auth](#input\_aad\_auth) | The webhook application object Id for AAD auth. The identifier URI for AAD auth. The tenant id for AAD auth. | <pre>object({<br>    object_id      = string<br>    identifier_uri = string<br>    tenant_id      = string<br>  })</pre> | n/a | yes |
| <a name="input_action_group_enabled"></a> [action\_group\_enabled](#input\_action\_group\_enabled) | Whether this action group is enabled. If an action group is not enabled, then none of its receivers will receive communications. Defaults to true. | `bool` | n/a | yes |
| <a name="input_action_group_name"></a> [action\_group\_name](#input\_action\_group\_name) | The name of the Action Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_action_group_rule_name"></a> [action\_group\_rule\_name](#input\_action\_group\_rule\_name) | Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_action_rule_condition"></a> [action\_rule\_condition](#input\_action\_rule\_condition) | The operator for a given condition. A list of values to match for a given condition. | <pre>object({<br>    alert_context = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    alert_rule_id = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    description = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    monitor = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    monitor_service = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    severity = object({<br>      operator = string<br>      values   = list(string)<br>    })<br>    target_resource_type = object({<br>      operator = string<br>      values   = list(string)<br>    })<br><br>  })</pre> | n/a | yes |
| <a name="input_action_rule_description"></a> [action\_rule\_description](#input\_action\_rule\_description) | Specifies a description for the Action Rule. | `string` | n/a | yes |
| <a name="input_action_rule_enabled"></a> [action\_rule\_enabled](#input\_action\_rule\_enabled) | Is the Action Rule enabled? Defaults to true. | `bool` | n/a | yes |
| <a name="input_action_webhook_properties"></a> [action\_webhook\_properties](#input\_action\_webhook\_properties) | The map of custom string properties to include with the post operation. These data are appended to the webhook payload. | `map(any)` | n/a | yes |
| <a name="input_activity_log_alert_name"></a> [activity\_log\_alert\_name](#input\_activity\_log\_alert\_name) | The name of the activity log alert. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_afr_use_common_alert_schema"></a> [afr\_use\_common\_alert\_schema](#input\_afr\_use\_common\_alert\_schema) | Enables or disables the common alert schema. | `bool` | n/a | yes |
| <a name="input_application_insights_web_test_lac"></a> [application\_insights\_web\_test\_lac](#input\_application\_insights\_web\_test\_lac) | The ID of the Application Insights Web Test. The ID of the Application Insights Resource. The number of failed locations. | <pre>object({<br>    web_test_id           = string<br>    component_id          = string<br>    failed_location_count = string<br>  })</pre> | n/a | yes |
| <a name="input_arm_role_receiver_name"></a> [arm\_role\_receiver\_name](#input\_arm\_role\_receiver\_name) | The name of the ARM role receiver. | `string` | n/a | yes |
| <a name="input_arm_role_receiver_role_id"></a> [arm\_role\_receiver\_role\_id](#input\_arm\_role\_receiver\_role\_id) | The arm role id. | `string` | n/a | yes |
| <a name="input_armrr_use_common_alert_schema"></a> [armrr\_use\_common\_alert\_schema](#input\_armrr\_use\_common\_alert\_schema) | Enables or disables the common alert schema. | `bool` | n/a | yes |
| <a name="input_arr_use_common_alert_schema"></a> [arr\_use\_common\_alert\_schema](#input\_arr\_use\_common\_alert\_schema) | Enables or disables the common alert schema. | `bool` | n/a | yes |
| <a name="input_automation_account_id"></a> [automation\_account\_id](#input\_automation\_account\_id) | The automation account ID which holds this runbook and authenticates to Azure resources. | `string` | n/a | yes |
| <a name="input_automation_runbook_receiver_name"></a> [automation\_runbook\_receiver\_name](#input\_automation\_runbook\_receiver\_name) | The name of the automation runbook receiver. | `string` | n/a | yes |
| <a name="input_azure_app_push_receiver"></a> [azure\_app\_push\_receiver](#input\_azure\_app\_push\_receiver) | name: The name of the Azure app push receiver. email\_address: The email address of the user signed into the mobile app who will receive push notifications from this receiver. | <pre>list(object({<br>    name          = string<br>    email_address = string<br>  }))</pre> | n/a | yes |
| <a name="input_azure_function_receiver_name"></a> [azure\_function\_receiver\_name](#input\_azure\_function\_receiver\_name) | The name of the Azure Function receiver. | `string` | n/a | yes |
| <a name="input_callback_url"></a> [callback\_url](#input\_callback\_url) | The callback url where HTTP request sent to. | `string` | n/a | yes |
| <a name="input_category_log_alert"></a> [category\_log\_alert](#input\_category\_log\_alert) | The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth | `string` | `"Security"` | no |
| <a name="input_criteria_aggregation"></a> [criteria\_aggregation](#input\_criteria\_aggregation) | The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. | `string` | n/a | yes |
| <a name="input_criteria_caller"></a> [criteria\_caller](#input\_criteria\_caller) | The email address or Azure Active Directory identifier of the user who performed the operation. | `string` | `null` | no |
| <a name="input_criteria_dimension"></a> [criteria\_dimension](#input\_criteria\_dimension) | One of the dimension names | <pre>list(object({<br>    name     = string<br>    operator = string<br>    values   = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_criteria_level"></a> [criteria\_level](#input\_criteria\_level) | The severity level of the event. Possible values are Verbose, Informational, Warning, Error, and Critical. | `string` | `"Verbose"` | no |
| <a name="input_criteria_metric__name"></a> [criteria\_metric\_\_name](#input\_criteria\_metric\_\_name) | One of the metric names to be monitored. | `string` | n/a | yes |
| <a name="input_criteria_metric_namespace"></a> [criteria\_metric\_namespace](#input\_criteria\_metric\_namespace) | One of the metric namespaces to be monitored. | `string` | n/a | yes |
| <a name="input_criteria_operator"></a> [criteria\_operator](#input\_criteria\_operator) | The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. | `string` | n/a | yes |
| <a name="input_criteria_recommendation_category"></a> [criteria\_recommendation\_category](#input\_criteria\_recommendation\_category) | The recommendation category of the event. Possible values are Cost, Reliability, OperationalExcellence and Performance. It is only allowed when category is Recommendation. | `string` | `"Performance"` | no |
| <a name="input_criteria_recommendation_impact"></a> [criteria\_recommendation\_impact](#input\_criteria\_recommendation\_impact) | The recommendation impact of the event. Possible values are High, Medium and Low. It is only allowed when category is Recommendation. | `string` | `"Low"` | no |
| <a name="input_criteria_recommendation_type"></a> [criteria\_recommendation\_type](#input\_criteria\_recommendation\_type) | The recommendation type of the event. It is only allowed when category is Recommendation. | `string` | `null` | no |
| <a name="input_criteria_skip_metric_validation"></a> [criteria\_skip\_metric\_validation](#input\_criteria\_skip\_metric\_validation) | Skip the metric validation to allow creating an alert rule on a custom metric that isn't yet emitted? Defaults to false. | `bool` | n/a | yes |
| <a name="input_criteria_status"></a> [criteria\_status](#input\_criteria\_status) | The status of the event. For example, Started, Failed, or Succeeded. | `string` | `"Succeeded"` | no |
| <a name="input_criteria_sub_status"></a> [criteria\_sub\_status](#input\_criteria\_sub\_status) | The sub status of the event. | `string` | `null` | no |
| <a name="input_criteria_threshold"></a> [criteria\_threshold](#input\_criteria\_threshold) | The criteria threshold value that activates the alert | `number` | n/a | yes |
| <a name="input_dynamic_criteria"></a> [dynamic\_criteria](#input\_dynamic\_criteria) | dynamic criteria block | <pre>list(object({<br>    metric_namespace  = string<br>    metric_name       = string<br>    aggregation       = string<br>    operator          = string<br>    alert_sensitivity = string<br>    dimension = list(object({<br>      name     = string<br>      operator = string<br>      values   = list(string)<br>    }))<br>    evaluation_total_count   = string<br>    evaluation_failure_count = string<br>    ignore_data_before       = string<br>    skip_metric_validation   = string<br>  }))</pre> | n/a | yes |
| <a name="input_ehr_use_common_alert_schema"></a> [ehr\_use\_common\_alert\_schema](#input\_ehr\_use\_common\_alert\_schema) | Indicates whether to use common alert schema. | `bool` | n/a | yes |
| <a name="input_email_receiver"></a> [email\_receiver](#input\_email\_receiver) | The name of the email receiver. Names must be unique (case-insensitive) across all receivers within an action group.The email address of this receiver. | <pre>list(object({<br>    name                    = string<br>    email_address           = string<br>    use_common_alert_schema = bool<br>  }))</pre> | n/a | yes |
| <a name="input_event_hub_name"></a> [event\_hub\_name](#input\_event\_hub\_name) | The name of the specific Event Hub queue. | `string` | n/a | yes |
| <a name="input_event_hub_namespace"></a> [event\_hub\_namespace](#input\_event\_hub\_namespace) | The namespace name of the Event Hub. | `string` | n/a | yes |
| <a name="input_event_hub_receiver_name"></a> [event\_hub\_receiver\_name](#input\_event\_hub\_receiver\_name) | The name of the EventHub Receiver, must be unique within action group. | `string` | n/a | yes |
| <a name="input_function_app_resource_id"></a> [function\_app\_resource\_id](#input\_function\_app\_resource\_id) | The Azure resource ID of the function app. | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | The function name in the function app. | `string` | n/a | yes |
| <a name="input_http_trigger_url"></a> [http\_trigger\_url](#input\_http\_trigger\_url) | The HTTP trigger url where HTTP request sent to. | `string` | n/a | yes |
| <a name="input_is_global_runbook"></a> [is\_global\_runbook](#input\_is\_global\_runbook) | Indicates whether this instance is global runbook. | `string` | n/a | yes |
| <a name="input_itsm_receiver_connection_id"></a> [itsm\_receiver\_connection\_id](#input\_itsm\_receiver\_connection\_id) | The unique connection identifier of the ITSM connection. | `string` | n/a | yes |
| <a name="input_itsm_receiver_name"></a> [itsm\_receiver\_name](#input\_itsm\_receiver\_name) | The name of the ITSM receiver. | `string` | n/a | yes |
| <a name="input_lar_use_common_alert_schema"></a> [lar\_use\_common\_alert\_schema](#input\_lar\_use\_common\_alert\_schema) | Enables or disables the common alert schema. | `bool` | n/a | yes |
| <a name="input_log_alert_action"></a> [log\_alert\_action](#input\_log\_alert\_action) | Wants to enable action block in log alert resource? | `bool` | n/a | yes |
| <a name="input_log_alert_description"></a> [log\_alert\_description](#input\_log\_alert\_description) | The description of this activity log alert. | `string` | `null` | no |
| <a name="input_log_alert_enabled"></a> [log\_alert\_enabled](#input\_log\_alert\_enabled) | Should this Activity Log Alert be enabled? Defaults to true. | `bool` | `true` | no |
| <a name="input_log_alert_resource_provider"></a> [log\_alert\_resource\_provider](#input\_log\_alert\_resource\_provider) | The name of the resource provider monitored by the activity log alert. | `string` | `null` | no |
| <a name="input_log_workspace_region"></a> [log\_workspace\_region](#input\_log\_workspace\_region) | The region of the workspace. | `string` | n/a | yes |
| <a name="input_logic_app_receiver_name"></a> [logic\_app\_receiver\_name](#input\_logic\_app\_receiver\_name) | The name of the logic app receiver. | `string` | n/a | yes |
| <a name="input_logic_app_resource_id"></a> [logic\_app\_resource\_id](#input\_logic\_app\_resource\_id) | The Azure resource ID of the logic app. | `string` | n/a | yes |
| <a name="input_metric_action_webhook_properties"></a> [metric\_action\_webhook\_properties](#input\_metric\_action\_webhook\_properties) | The map of custom string properties to include with the post operation. These data are appended to the webhook payload. | `map(string)` | n/a | yes |
| <a name="input_metric_alert_action"></a> [metric\_alert\_action](#input\_metric\_alert\_action) | Wants to enable metric action block? | `bool` | n/a | yes |
| <a name="input_metric_alert_auto_mitigate"></a> [metric\_alert\_auto\_mitigate](#input\_metric\_alert\_auto\_mitigate) | Should the alerts in this Metric Alert be auto resolved? Defaults to true. | `bool` | n/a | yes |
| <a name="input_metric_alert_description"></a> [metric\_alert\_description](#input\_metric\_alert\_description) | The description of this Metric Alert. | `string` | n/a | yes |
| <a name="input_metric_alert_enabled"></a> [metric\_alert\_enabled](#input\_metric\_alert\_enabled) | Should this Metric Alert be enabled? Defaults to true. | `bool` | n/a | yes |
| <a name="input_metric_alert_frequency"></a> [metric\_alert\_frequency](#input\_metric\_alert\_frequency) | The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format. Possible values are PT1M, PT5M, PT15M, PT30M and PT1H. Defaults to PT1M. | `string` | n/a | yes |
| <a name="input_metric_alert_name"></a> [metric\_alert\_name](#input\_metric\_alert\_name) | The name of the Metric Alert. Changing this forces a new resource to be created | `string` | n/a | yes |
| <a name="input_metric_alert_scopes"></a> [metric\_alert\_scopes](#input\_metric\_alert\_scopes) | A set of strings of resource IDs at which the metric criteria should be applied. | `list(string)` | n/a | yes |
| <a name="input_metric_alert_severity"></a> [metric\_alert\_severity](#input\_metric\_alert\_severity) | The severity of this Metric Alert. Possible values are 0, 1, 2, 3 and 4. Defaults to 3. | `string` | n/a | yes |
| <a name="input_metric_alert_target_resource_location"></a> [metric\_alert\_target\_resource\_location](#input\_metric\_alert\_target\_resource\_location) | The location of the target resource. | `string` | n/a | yes |
| <a name="input_metric_alert_target_resource_type"></a> [metric\_alert\_target\_resource\_type](#input\_metric\_alert\_target\_resource\_type) | The resource type (e.g. Microsoft.Compute/virtualMachines) of the target resource. | `string` | n/a | yes |
| <a name="input_metric_alert_window_size"></a> [metric\_alert\_window\_size](#input\_metric\_alert\_window\_size) | The period of time that is used to monitor alert activity, represented in ISO 8601 duration format. This value must be greater than frequency. Possible values are PT1M, PT5M, PT15M, PT30M, PT1H, PT6H, PT12H and P1D. Defaults to PT5M. | `string` | n/a | yes |
| <a name="input_operation_name_log_alert"></a> [operation\_name\_log\_alert](#input\_operation\_name\_log\_alert) | The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> | `string` | `null` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Reading Resource group ID from other module | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Reading Resource group name from other module | `string` | n/a | yes |
| <a name="input_resource_health"></a> [resource\_health](#input\_resource\_health) | The current resource health statuses that will log an alert. Possible values are Available, Degraded, Unavailable and Unknown. The previous resource health statuses that will log an alert. Possible values are Available, Degraded, Unavailable and Unknown. The reason that will log an alert. Possible values are PlatformInitiated (such as a problem with the resource in an affected region of an Azure incident), UserInitiated (such as a shutdown request of a VM) and Unknown. | <pre>object({<br>    current  = string<br>    previous = string<br>    reason   = string<br>  })</pre> | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | Reading resource IDs from other module | `string` | n/a | yes |
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | The resource type monitored by the activity log alert. | `string` | `null` | no |
| <a name="input_runbook_name"></a> [runbook\_name](#input\_runbook\_name) | The name for this runbook. | `string` | n/a | yes |
| <a name="input_scope_type"></a> [scope\_type](#input\_scope\_type) | Specifies the type of target scope. Possible values are ResourceGroup and Resource | `string` | n/a | yes |
| <a name="input_service_health"></a> [service\_health](#input\_service\_health) | Events this alert will monitor Possible values are Incident, Maintenance, Informational, ActionRequired and Security.Locations this alert will monitor. For example, West Europe. Defaults to Global.Services this alert will monitor. For example, Activity Logs & Alerts, Action Groups. Defaults to all Services. | <pre>object({<br>    events    = string<br>    locations = string<br>    services  = string<br>  })</pre> | n/a | yes |
| <a name="input_service_uri"></a> [service\_uri](#input\_service\_uri) | The URI where webhooks should be sent. | `string` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | The short name of the action group. | `string` | n/a | yes |
| <a name="input_sms_receiver"></a> [sms\_receiver](#input\_sms\_receiver) | The name of the SMS receiver. Names must be unique (case-insensitive) across all receivers within an action group.The country code of the SMS receiver.The phone number of the SMS receiver. | <pre>list(object({<br>    name         = string<br>    country_code = string<br>    phone_number = string<br>  }))</pre> | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The ID for the subscription containing this Event Hub. Default to the subscription ID of the Action Group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(any)` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Tenant ID for the subscription containing this Event Hub. | `string` | n/a | yes |
| <a name="input_ticket_configuration"></a> [ticket\_configuration](#input\_ticket\_configuration) | A JSON blob for the configurations of the ITSM action. CreateMultipleWorkItems option will be part of this blob as well. | `string` | n/a | yes |
| <a name="input_voice_receiver"></a> [voice\_receiver](#input\_voice\_receiver) | The name of the voice receiver.The country code of the voice receiver.The phone number of the voice receiver. | <pre>list(object({<br>    name         = string<br>    country_code = string<br>    phone_number = string<br>  }))</pre> | n/a | yes |
| <a name="input_webhook_receiver"></a> [webhook\_receiver](#input\_webhook\_receiver) | The name of the webhook receiver. Names must be unique (case-insensitive) across all receivers within an action group.The URI where webhooks should be sent. | <pre>list(object({<br>    name                    = string<br>    service_uri             = string<br>    use_common_alert_schema = string<br>  }))</pre> | n/a | yes |
| <a name="input_webhook_resource_id"></a> [webhook\_resource\_id](#input\_webhook\_resource\_id) | The resource id for webhook linked to this runbook. | `string` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | The Azure Log Analytics workspace ID where this connection is defined. Format is <subscription id>\|<workspace id>, for example 00000000-0000-0000-0000-000000000000\|00000000-0000-0000-0000-000000000000. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_group_id"></a> [action\_group\_id](#output\_action\_group\_id) | "Monitor action group ID" |
| <a name="output_action_rule_id"></a> [action\_rule\_id](#output\_action\_rule\_id) | "Monitor action rule ID" |
| <a name="output_log_alert_id"></a> [log\_alert\_id](#output\_log\_alert\_id) | "Monitor log alert ID" |
| <a name="output_metric_alert_id"></a> [metric\_alert\_id](#output\_metric\_alert\_id) | "Monitor metric alert ID" |


#### Refer this link to know more about Alerts: [Alerts_MSDOC](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview)


#### Refer this link to know more about Alerts: [Alerts_Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group)
<!-- END_TF_DOCS -->