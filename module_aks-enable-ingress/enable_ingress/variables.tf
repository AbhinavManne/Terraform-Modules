#-----------------------------VARIABLE: RESOURCE GROUP----------------------------------------------------#

variable "create_resource_group" {
  type        = bool
  description = "create resource group"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "application_gateway_name" {
  type        = string
  description = "Name of the application gateway"
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
