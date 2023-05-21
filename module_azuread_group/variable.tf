variable "assignable_to_role" {
  type        = bool
  description = "Indicates whether this group can be assigned to an Azure Active Directory role. Can only be true for security-enabled groups. Changing this forces a new resource to be created."
  default     = false
}
variable "auto_subscribe_new_members" {
  type        = bool
  description = "Indicates whether new members added to the group will be auto-subscribed to receive email notifications. Can only be set for Unified groups."
  default     = false
}
variable "behaviors" {
  type        = list(string)
  description = "A set of behaviors for a Microsoft 365 group. Possible values are AllowOnlyMembersToPost, HideGroupInOutlook, SubscribeMembersToCalendarEventsDisabled, SubscribeNewGroupMembers and WelcomeEmailDisabled"
  default     = null
}
variable "description" {
  type        = string
  description = "The description for the group."
  default     = "Please provide proper description."
}
variable "display_name" {
  type        = string
  description = "The display name for the group."
}
variable "enabled" {
  type        = bool
  description = "Whether rule processing is On (true) or Paused"
}
variable "rule" {
  type        = string
  description = "The rule that determines membership of this group."
}
variable "external_senders_allowed" {
  type        = bool
  description = "Indicates whether people external to the organization can send messages to the group. Can only be set for Unified groups."
  default    = false
}
variable "hide_from_address_lists" {
  type        = bool
  description = " Indicates whether the group is displayed in certain parts of the Outlook user interface: in the Address Book, in address lists for selecting message recipients, and in the Browse Groups dialog for searching groups. Can only be set for Unified groups."
  default     = false
}
variable "hide_from_outlook_clients" {
  type        = bool
  description = "Indicates whether the group is displayed in Outlook clients, such as Outlook for Windows and Outlook on the web. Can only be set for Unified groups."
  default     = false
}
variable "mail_enabled" {
  type        = bool
  description = "Whether the group is a mail enabled, with a shared group mailbox. At least one of mail_enabled or security_enabled must be specified. Only Microsoft 365 groups can be mail enabled (see the types property)."
  default     = false
}
variable "mail_nickname" {
  type        = string
  description = "The mail alias for the group, unique in the organisation. Required for mail-enabled groups. Changing this forces a new resource to be created."
  default     = "Demo-Group"
}
variable "members" {
  type        = list(string)
  description = " A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
  default     = null
}
variable "owners" {
  type        = list(string)
  description = "A set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed."
  default     = null
}
variable "prevent_duplicate_names" {
  type        = bool
  description = "If true, will return an error if an existing group is found with the same name. Defaults to false."
  default     = true
}
variable "provisioning_options" {
  type        = list(string)
  description = "A set of provisioning options for a Microsoft 365 group. The only supported value is Team. See official documentation for details. Changing this forces a new resource to be created."
  default     = ["Team"]
}
variable "security_enabled" {
  type        = bool
  description = "Whether the group is a security group for controlling access to in-app resources. At least one of security_enabled or mail_enabled must be specified. A Microsoft 365 group can be security enabled and mail enabled (see the types property)."
  default     = false
}
variable "theme" {
  type        = string
  description = "The colour theme for a Microsoft 365 group. Possible values are Blue, Green, Orange, Pink, Purple, Red or Teal. By default, no theme is set."
  default     = null
}
variable "types" {
  type        = list(string)
  description = "A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership, and Unified, which specifies a Microsoft 365 group. Required when mail_enabled is true. Changing this forces a new resource to be created."
  default     = null
}
variable "visibility" {
  type        = string
  default     = "Private"
  description = "The group join policy and group content visibility. Possible values are Private, Public, or Hiddenmembership. Only Microsoft 365 groups can have Hiddenmembership visibility and this value must be set when the group is created. By default, security groups will receive Private visibility and Microsoft 365 groups will receive Public visibility."
}
