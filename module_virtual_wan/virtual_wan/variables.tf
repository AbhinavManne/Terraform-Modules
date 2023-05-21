variable "resource_group_name" {
    type        = string
    description = "The name of the resource group in which to create the Virtual WAN"
}

variable "name" {
    type        = string
    description = "Specifies the name of the Virtual WAN."
}

variable "location" {
    type        = string
    description = "Specifies the supported Azure location where the resource exists."
}

variable "disable_vpn_encryption" {
    type        = string
    description = "Boolean flag to specify whether VPN encryption is disabled."
    default     = "false"
}

variable "allow_branch_to_branch_traffic" {
    type        = string
    description = "Boolean flag to specify whether branch to branch traffic is allowed."
    default     = "true"
}

variable "office365_local_breakout_category" {
    type        = string
    description = "Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None."
    default     = "None"
}

variable "type" {
    type        = string
    description = "Specifies the Virtual WAN type. Possible Values include: Basic and Standard."
}

variable "tags" {
    type        = map(string)
    description = "A mapping of tags to assign to the Virtual WAN."
}