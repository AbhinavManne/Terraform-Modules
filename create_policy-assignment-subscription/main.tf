data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "example" {
  name         = var.policy_name         #"only-deploy-in-westeurope"
  policy_type  = var.policy_type         #"Custom"
  mode         = var.policy_mode         #"All"
  display_name = var.policy_display_name #"Policy"

  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "location",
        "equals": "westeurope"
      }
    },
    "then": {
      "effect": "Deny"
    }
  }
POLICY_RULE
}

resource "azurerm_subscription_policy_assignment" "example" {
  name                 = var.policy_assignment_name #"example"
  policy_definition_id = azurerm_policy_definition.example.id
  subscription_id      = data.azurerm_subscription.current.id
}