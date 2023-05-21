role_assignment_name                   = null //"00000000-0000-0000-0000-000000000000" //"cil-testing-rbac"
ra_role_definition_name                = null //"Reader"
rbac_condition                         = null
rbac_condition_version                 = null
delegated_managed_identity_resource_id = null
role_assignment_description            = "testing rbac module"
skip_service_principal_aad_check       = null


role_definition_name              = "cil-testing-rdef"
role_definition_description       = "Testing-cil-rdef"
rdef_permissions                  = true
rdef_permissions_actions          = ["Microsoft.Resources/subscriptions/resourceGroups/read"]
rdef_permissions_data_actions     = []
rdef_permissions_not_actions      = []
rdef_permissions_not_data_actions = []

