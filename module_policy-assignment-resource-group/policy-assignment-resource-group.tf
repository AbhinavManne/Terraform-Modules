#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = "example-resources"
}

#Reading existing policy definition info
data "azurerm_policy_definition" "example" {
  display_name = var.policy_definition_display_name
}

#Assign the existing policy definitions at resource group level
resource "azurerm_resource_group_policy_assignment" "example" {
  name                 = "${var.policy_assignment_name_prefix}-${data.azurerm_policy_definition.example.name}"
  resource_group_id    = data.azurerm_resource_group.example.id
  policy_definition_id = data.azurerm_policy_definition.example.id
}