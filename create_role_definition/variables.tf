variable "role_definition_name" {
  type        = string
  description = " The name of the Role Definition. Changing this forces a new resource to be created."
}

variable "scope" {
  type        = string
  description = " The scope at which the Role Definition applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM. It is recommended to use the first entry of the assignable_scopes. Changing this forces a new resource to be created."
}

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

variable "rdef_assignable_scopes" {
  type        = list(string)
  description = "One or more assignable scopes for this Role Definition, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM."
}
