<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 30/11/2022
# <u> Introduction </u>
* This module provides the facility to provision Azuread group in Azure Active Directory.

# File Structure
This particular module is having the following configuration files.
 
- azuread_group.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in azuread_group.tf
- output.tf : This file is having all the resource output details generated.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.30.0 |


## Resources

| Name | Type |
|------|------|
| [azuread_group.ad_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignable_to_role"></a> [assignable\_to\_role](#input\_assignable\_to\_role) | Indicates whether this group can be assigned to an Azure Active Directory role. Can only be true for security-enabled groups. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_auto_subscribe_new_members"></a> [auto\_subscribe\_new\_members](#input\_auto\_subscribe\_new\_members) | Indicates whether new members added to the group will be auto-subscribed to receive email notifications. Can only be set for Unified groups. | `bool` | `false` | no |
| <a name="input_behaviors"></a> [behaviors](#input\_behaviors) | A set of behaviors for a Microsoft 365 group. Possible values are AllowOnlyMembersToPost, HideGroupInOutlook, SubscribeMembersToCalendarEventsDisabled, SubscribeNewGroupMembers and WelcomeEmailDisabled | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description for the group. | `string` | `"Please provide proper description."` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the group. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether rule processing is On (true) or Paused | `bool` | n/a | yes |
| <a name="input_external_senders_allowed"></a> [external\_senders\_allowed](#input\_external\_senders\_allowed) | Indicates whether people external to the organization can send messages to the group. Can only be set for Unified groups. | `bool` | n/a | yes |
| <a name="input_hide_from_address_lists"></a> [hide\_from\_address\_lists](#input\_hide\_from\_address\_lists) | Indicates whether the group is displayed in certain parts of the Outlook user interface: in the Address Book, in address lists for selecting message recipients, and in the Browse Groups dialog for searching groups. Can only be set for Unified groups. | `bool` | `false` | no |
| <a name="input_hide_from_outlook_clients"></a> [hide\_from\_outlook\_clients](#input\_hide\_from\_outlook\_clients) | Indicates whether the group is displayed in Outlook clients, such as Outlook for Windows and Outlook on the web. Can only be set for Unified groups. | `bool` | `false` | no |
| <a name="input_mail_enabled"></a> [mail\_enabled](#input\_mail\_enabled) | Whether the group is a mail enabled, with a shared group mailbox. At least one of mail\_enabled or security\_enabled must be specified. Only Microsoft 365 groups can be mail enabled (see the types property). | `bool` | `false` | no |
| <a name="input_mail_nickname"></a> [mail\_nickname](#input\_mail\_nickname) | The mail alias for the group, unique in the organisation. Required for mail-enabled groups. Changing this forces a new resource to be created. | `string` | `"Demo-Group"` | no |
| <a name="input_members"></a> [members](#input\_members) | A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic\_membership block. | `list(string)` | `null` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | A set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals. By default, the principal being used to execute Terraform is assigned as the sole owner. Groups cannot be created with no owners or have all their owners removed. | `list(string)` | `null` | no |
| <a name="input_prevent_duplicate_names"></a> [prevent\_duplicate\_names](#input\_prevent\_duplicate\_names) | If true, will return an error if an existing group is found with the same name. Defaults to false. | `bool` | `true` | no |
| <a name="input_provisioning_options"></a> [provisioning\_options](#input\_provisioning\_options) | A set of provisioning options for a Microsoft 365 group. The only supported value is Team. See official documentation for details. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  "Team"<br>]</pre> | no |
| <a name="input_rule"></a> [rule](#input\_rule) | The rule that determines membership of this group. | `string` | n/a | yes |
| <a name="input_security_enabled"></a> [security\_enabled](#input\_security\_enabled) | Whether the group is a security group for controlling access to in-app resources. At least one of security\_enabled or mail\_enabled must be specified. A Microsoft 365 group can be security enabled and mail enabled (see the types property). | `bool` | `false` | no |
| <a name="input_theme"></a> [theme](#input\_theme) | The colour theme for a Microsoft 365 group. Possible values are Blue, Green, Orange, Pink, Purple, Red or Teal. By default, no theme is set. | `string` | `null` | no |
| <a name="input_types"></a> [types](#input\_types) | A set of group types to configure for the group. Supported values are DynamicMembership, which denotes a group with dynamic membership, and Unified, which specifies a Microsoft 365 group. Required when mail\_enabled is true. Changing this forces a new resource to be created. | `list(string)` | `null` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The group join policy and group content visibility. Possible values are Private, Public, or Hiddenmembership. Only Microsoft 365 groups can have Hiddenmembership visibility and this value must be set when the group is created. By default, security groups will receive Private visibility and Microsoft 365 groups will receive Public visibility. | `string` | `"Private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | Group Id |

## Module Usage 
* You can call the specified Linux VM Scal Set in any script where you want to integrate it.
```
module "azuread_group_module" {
  for_each = var.azuread_group
  source                     = "../../modules/module_azuread_group"
  assignable_to_role         = lookup(each.value,"assignable_to_role")
  auto_subscribe_new_members = lookup(each.value,"auto_subscribe_new_members")
  description                = lookup(each.value,"description")
  display_name               = each.key
  enabled                    = lookup(each.value,"enabled")
  rule                       = lookup(each.value,"rule")
  external_senders_allowed   = lookup(each.value,"external_senders_allowed")
  hide_from_address_lists    = lookup(each.value,"hide_from_address_lists")
  hide_from_outlook_clients  = lookup(each.value,"hide_from_outlook_clients")
  mail_enabled               = lookup(each.value,"mail_enabled")
  mail_nickname              = lookup(each.value,"mail_nickname")
  members                    = lookup(each.value,"members")
  owners                     = lookup(each.value,"owners")
  prevent_duplicate_names    = lookup(each.value,"prevent_duplicate_names")
  provisioning_options       = lookup(each.value,"provisioning_options")
  security_enabled           = lookup(each.value,"security_enabled")
  theme                      = lookup(each.value,"theme")
  types                      = lookup(each.value,"types")
  visibility                 = lookup(each.value,"visibility")
}



```

<!-- END_TF_DOCS -->