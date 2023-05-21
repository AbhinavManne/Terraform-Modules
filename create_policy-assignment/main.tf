data "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  resource_group_name = var.respurce_group_name
}

resource "azurerm_policy_definition" "example" {
  name         = var.policy_name
  policy_type  = var.policy_type
  mode         = var.policy_mode
  display_name = var.policy_display_name

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

resource "azurerm_resource_policy_assignment" "example" {
  name                 = var.policy_assignment_name
  resource_id          = data.azurerm_virtual_network.example.id
  policy_definition_id = azurerm_policy_definition.example.id
}