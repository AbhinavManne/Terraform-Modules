#-----------------------------VARIABLE: RESOURCE GROUP----------------------------------------------------#
variable "resource_group" {
  type        = string
  description = "RG name in Azure"
}

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#-----------------------------VARIABLE: KUBERNETES SERVICE-------------------------------------------------#
variable "kubernetes_name" {
  type        = string
  description = " The name of the Managed Kubernetes Cluster to create."
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster"
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. "
}

variable "default_node_pool_name" {
  type        = string
  description = "The name which should be used for the default Kubernetes Node Pool"
}

variable "node_count" {
  type        = number
  description = "The initial number of nodes which should exist in the Node Pool"
}

variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine"
}

variable "os_disk_size_gb" {
  type        = number
  description = "The size of the OS Disk which should be used for each agent in the Node Pool"
}

variable "appId" {
  type        = string
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  type        = string
  description = "Azure Kubernetes Service Cluster password"
}

variable "enabled" {
  type        = bool
  description = "Enabled value"
}

variable "enable_http_application_routing" {
  type        = bool
  description = "Is HTTP Application Routing Enabled?"
}

variable "enable_azure_policy" {
  type        = bool
  description = " Is the Azure Policy for Kubernetes Add On enabled?"
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = " enable_log_analytics_workspace?"
}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}

#-----------------------------------------RESOURCE: LOG ANALYTICS WORKSPACE-------------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}


variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}


variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}

#--------------------------------------RESOURCE: SECURITY CENTER SUBSCRIPTION PRICING---------------------#
variable "security_center_subscription_pricing_tier" {
  type        = string
  description = "The pricing tier to use. Possible values are Free and Standard."
}


variable "security_resource_type" {
  type        = string
  description = "The resource type this setting affects."
}


#--------------------------------------RESOURCE: SECURITY CENTER CONTACT----------------------------------#
variable "security_center_email" {
  type        = string
  description = "The email of the Security Center Contact."
}


variable "security_center_phone" {
  type        = string
  description = "The phone number of the Security Center Contact."
}


variable "security_center_alert_notifications" {
  type        = string
  description = "Whether to send security alerts notifications to the security contact."
}


variable "security_center_alerts_to_admins" {
  type        = string
  description = "Whether to send security alerts notifications to subscription admins."
}


#--------------------------------------RESOURCE: SECURITY CENTER SETTING-----------------------------------#
variable "security_center_setting_name" {
  type        = string
  description = "The setting to manage. Possible values are MCAS and WDATP."
}


variable "enable_security_center_setting" {
  type        = string
  description = "Boolean flag to enable/disable data access."
}


#------------------------------------RESOURCE: SECURITY CENTER AUTO PROVISIONING---------------------------#
variable "enable_security_center_auto_provisioning" {
  type        = string
  description = "Should the security agent be automatically provisioned on Virtual Machines in this subscription"
}

#----------------------------------VARIABLES: RBAC MODULE----------------------------------------------#
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

#------------------------------------------------------------------------------------------------------#