data "azurerm_subscription" "current" {}

data "azurerm_policy_definition" "example" {
  display_name = var.policy_definition_display_name
}

#Assign the existing policy definitions at subscription level
resource "azurerm_subscription_policy_assignment" "example" {
  name                 = "${var.policy_assignment_name_prefix}-${data.azurerm_policy_definition.example.name}"
  policy_definition_id = data.azurerm_policy_definition.example.id
  subscription_id      = data.azurerm_subscription.current.id
}