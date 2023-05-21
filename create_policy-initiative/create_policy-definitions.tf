locals {
  data_list = csvdecode(file("deny-public-endpoints.csv"))

}

resource "azurerm_policy_definition" "policy" {

  for_each = { for data_list in local.data_list : data_list.Name => data_list }


  name         = each.value.Name
  description  = each.value.Description
  policy_type  = each.value.PolicyType
  mode         = each.value.Mode
  display_name = each.value.DisplayName
  policy_rule  = file(each.value.PolicyRule)
  parameters   = file("./policies/params.json")

}


