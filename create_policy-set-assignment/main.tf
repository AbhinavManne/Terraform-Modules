data "azurerm_policy_set_definition" "policysetdef" {
  //Add existing policy initiative name that needs to be assigned
  name = var.policyName
}

//Add scope (can be subscription, resource group, etc)
data "azurerm_subscription" "current" {
}

resource "azurerm_policy_assignment" "policyassgn" {
  name                 = var.policyAssignmentName
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = data.azurerm_policy_set_definition.policysetdef.id
  description          = var.description
  display_name         = var.displayName

  //Add parameters based on the policy initiative if required (optional)
  /*parameters = <<PARAMETERS
{
  "effect": {
    "value": "Deny" 
  }
}
PARAMETERS*/

}