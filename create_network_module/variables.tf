#---------------------------------------- resource group variables -----------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the virtual network."
}
variable "location" {
  type        = string
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

#---------------------------------------- virtual network variables -----------------------------------------
variable "virtual_network" {
  type        = string
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
}

variable "dns_servers" {
  type        = list(string)
  description = "List of IP addresses of DNS servers"
}

#---
variable "bgp_community" {
  type = string
  description = "The BGP community attribute in format <as-number>:<community-value>"
}

variable "edge_zone" {
  type = string
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created."
}

variable "enable_flow_timeout_in_minutes" {
  type = bool
  description = "Want to enable or disable the flow_timeout_in_minutes"
}

variable "flow_timeout_in_minutes" {
  type = number
  description = "The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes."
  validation {
    condition = var.flow_timeout_in_minutes > 4 && var.flow_timeout_in_minutes < 30
    error_message = "flow_timeout_in_minutes shoulf be between 4 to 30 minutes"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
}


variable "enable_ddos_protection_plan" {
  type        = bool
  description = "Enable/disable DDoS Protection Plan on Virtual Network."
}

variable "id_of_existing_ddos" {
  type = string
  description = "The Resource ID of DDoS Protection Plan."
}

#---------------------------------------- DDOS Protection variables -----------------------------------------
variable "network_ddos_protection_plan" {
  type        = string
  description = "Specifies the name of the Network DDoS Protection Plan. Changing this forces a new resource to be created."
}

#---------------------------------------- Firewall Subnet variables -----------------------------------------

variable "firewall_subnet_address_prefix" {
  description = "The address prefix to use for the subnet."
}

variable "firewall_service_endpoints" {
  description = "The list of Service endpoints to associate with the firewall subnet."
  type        = list(string)
}

#---------------------------------------- Gateway Subnet variables -----------------------------------------

variable "gateway_subnet_address_prefix" {
  description = "The address prefix to use for the gateway subnet"
}

variable "gateway_service_endpoints" {
  type = list(string)
  description = "The list of Service endpoints to associate with the gateway subnet."
}

#---------------------------------------- General Subnet variables -----------------------------------------

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}

variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = map(any)
}

variable "private_endpoint_network_policies_enabled" {
  type = bool
  description = "Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
}

variable "private_link_service_network_policies_enabled" {
  type = bool
  description = " Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true."
}

variable "service_endpoint_policy_ids" {
  type = list(string)
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
}

variable "subnet_delegation" {
  description = "A map of subnet name to delegation block on the subnet"
  type        = map(map(any))
}

#---------------------------------------- NSG Assoviation -----------------------------------------

variable "map_of_subnet_name_and_nsg_id" {
  description = "A map of the subnet name as key and nsg id as respected value."
  type = map(string)  
}

#---------------------------------------- Route Table Assoviation -----------------------------------------

variable "map_of_subnet_name_and_route_table_id" {
  description = "A map of the subnet name as key and route table id as respected value."
  type = map(string)
}


#---------------------------------------- Public IP variables -----------------------------------------
variable "public_ip_name" {
  type        = string
  description = "Public ip name"
}

variable "allocation_method" {
  type        = string
  description = "Allocation method for IP"
}

variable "sku" {
  type        = string
  description = "SKU for IP"
}

#---------------------------------------- Firewall variables -----------------------------------------
variable "firewall_name" {
  type        = string
  description = "Name of the firewall"
}

variable "threat_intel_mode" {
  type        = string
  description = "threat intel mode"
}


variable "ip_config" {
  type        = string
  description = "ip configuration"
}

variable "firewall_sku_name" {
  type        = string
  description = "sku_name for firewall"
}

variable "firewall_sku_tier" {
  type        = string
  description = "sku_tier for forewall"
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}
variable "storage_account_id" {
  description = "ID of target resource"
}
variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}

variable "enable_log_monitoring" {
  type  = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type = string
  description = "log_analytics_destination_type"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type  = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type  = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type  = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type  = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type  = number
  description = "log_retention_days"
}