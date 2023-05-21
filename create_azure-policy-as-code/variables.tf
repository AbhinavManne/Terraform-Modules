# ----------------------------------------------------------------------------------------------------------------------
# Module variables
# ----------------------------------------------------------------------------------------------------------------------
variable "management_group_scope" {
  type        = string
  description = "Management Group Name"
  default = null
}

variable "tags" {
  type        = any
  description = "Resource tags"
}

variable "skip_remediation" {
  type        = bool
  description = "Skip creation of all remediation tasks for policies that DeployIfNotExists and Modify"
  default     = false
}

variable "subscription_scope" {
  type = string
  description = "subscription scope"
  default = null
}

variable assignment_parameters {
  type        = any
  description = "The policy assignment parameters. Changing this forces a new resource to be created"
  default     = null
}

variable "rg_scope" {
  type = string
  description = "rg level scope"
  default = null
}
  