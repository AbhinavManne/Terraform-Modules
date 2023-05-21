keyvault_id = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/kv-testing/providers/Microsoft.KeyVault/vaults/kv-testing-kv"
policies = {
  "key1" = {
    certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
    object_id               = "86852476-732a-459f-bff1-01d99174bfcb"
    secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
    storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
    tenant_id               = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
    application_id          = null
  }
  "key2" = {
    certificate_permissions = ["Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_permissions         = ["Backup", "Create", "Delete", "Encrypt", "Get", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
    object_id               = "eb5d48dd-6e37-435a-83fa-c8d42697dab7"
    secret_permissions      = ["Backup", "Delete", "Get", "Purge", "Recover", "Restore", "Set"]
    storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
    tenant_id               = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
    application_id          = null
  }
  //multiple access policies...
}