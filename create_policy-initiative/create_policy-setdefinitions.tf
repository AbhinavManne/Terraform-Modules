resource "azurerm_policy_set_definition" "Deny-PublicEndpoints" {
  name         = "Deny-PublicEndpoints"
  policy_type  = "Custom"
  display_name = "Public network access should be disabled for PAAS services"

  dynamic "policy_definition_reference" {
    for_each = local.data_list
    content {
      policy_definition_id = azurerm_policy_definition.policy[policy_definition_reference.value.Name].id
    }
  }


}


