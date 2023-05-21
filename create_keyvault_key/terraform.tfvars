keyvault_key        = "test-key-askk"
keyvault_id         = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/cil-testing-as/providers/Microsoft.KeyVault/vaults/kv-resources-as-001" //
key_type            = "RSA"
key_size            = "2048"
key_curve           = null //""
key_not_before_date = null //""
key_expiration_date = null //""
key_opts = [
  "decrypt",
  "encrypt",
  "sign",
  "unwrapKey",
  "verify",
  "wrapKey",
]
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Keyvault_key"
}