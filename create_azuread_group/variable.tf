variable "azuread_group" {
  type = map(object({
    assignable_to_role         = bool
    auto_subscribe_new_members = bool
    behaviors                  = list(string)
    description                = string
    enabled                    = bool
    rule                       = string
    external_senders_allowed   = bool
    hide_from_address_lists    = bool
    hide_from_outlook_clients  = bool
    mail_enabled               = bool
    mail_nickname              = string
    members                    = list(string)
    owners                     = list(string)
    prevent_duplicate_names    = bool
    provisioning_options       = list(string)
    security_enabled           = bool
    theme                      = string
    types                      = list(string)
    visibility                 = string
  }))
}
