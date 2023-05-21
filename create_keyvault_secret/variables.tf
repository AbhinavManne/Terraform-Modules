variable "keyvault_secret" {
  type        = string
  description = "Specifies the name of the Key Vault Secret. Changing this forces a new resource to be created."
}

variable "keyvault_id" {
  type        = string
  description = "ID of Keyvault"
}

variable "keyvault_secret_value" {
  type        = string
  description = "Specifies the value of the Key Vault Secret."
}

variable "secret_content_type" {
  type        = string
  description = "Specifies the content type for the Key Vault Secret."
}

variable "secret_not_before_date" {
  type        = string
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "secret_expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}