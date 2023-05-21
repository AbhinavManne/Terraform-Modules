variable "keyvault_id" {
  type        = string
  description = "Keyvault ID"
}

variable "policies" {
  type = map(object({
    tenant_id          = string
    object_id          = string
    application_id     = string
    key_permissions    = list(string)
    secret_permissions = list(string)
    certificate_permissions = list(string) 
    storage_permissions     = list(string)
    }))
}