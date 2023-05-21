variable "role_assignment_name" {
  type        = string
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified. Changing this forces a new resource to be created."
}

# variable "role_assignment_scope" {
#   type        = string
#   description = "The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created."
# }

# variable "role_definition_id" {
#   type        = string
#   description = " The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role_definition_name."
# }

variable "ra_role_definition_name" {
  type        = string
  description = " The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role_definition_id."
}

# variable "principal_id" {
#   type        = string
#   description = " The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created."
# }

variable "rbac_condition" {
  type        = string
  description = "The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created."
}

variable "rbac_condition_version" {
  type        = string
  description = "The version of the condition. Possible values are 1.0 or 2.0. Changing this forces a new resource to be created."
}

variable "delegated_managed_identity_resource_id" {
  type        = string
  description = " The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created."
}

variable "role_assignment_description" {
  type        = string
  description = "The description for this Role Assignment. Changing this forces a new resource to be created."
}

variable "skip_service_principal_aad_check" {
  type        = bool
  description = " If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal_id is a Service Principal identity. If it is not a Service Principal identity it will cause the role assignment to fail. Defaults to false."
  default     = false
}




variable "role_definition_name" {
  type        = string
  description = " The name of the Role Definition. Changing this forces a new resource to be created."
}

# variable "scope" {
#   type        = string
#   description = " The scope at which the Role Definition applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable_scopes. Changing this forces a new resource to be created."
# }

variable "role_definition_description" {
  type        = string
  description = "A description of the Role Definition."
}

variable "rdef_permissions" {
  type        = bool
  description = "Wants to enable permissions block?"
}

variable "rdef_permissions_actions" {
  type        = list(string)
  description = "One or more Allowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read. "
}

variable "rdef_permissions_data_actions" {
  type        = list(string)
  description = "One or more Allowed Data Actions, such as *, Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read"
}

variable "rdef_permissions_not_actions" {
  type        = list(string)
  description = " One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read"
}

variable "rdef_permissions_not_data_actions" {
  type        = list(string)
  description = "One or more Disallowed Actions, such as *, Microsoft.Resources/subscriptions/resourceGroups/read"
}

# variable "rdef_assignable_scopes" {
#   type        = list(string)
#   description = "One or more assignable scopes for this Role Definition, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM."
# }
