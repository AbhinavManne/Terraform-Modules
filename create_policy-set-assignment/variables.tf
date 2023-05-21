variable "policyName" {
  type        = string
  description = "Name of the policy that needs to be assigned to a scope"
}

variable "policyAssignmentName" {
  type        = string
  description = "Name of the policy assignment"
}

variable "displayName" {
  type        = string
  description = "Display name of the policy assignment"
}

variable "description" {
  type        = string
  description = "Description of the policy assignment"
}