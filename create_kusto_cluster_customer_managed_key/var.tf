variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(any)
}


variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault. Changing this forces a new resource to be created."

}
variable "key_name" {
  type        = string
  description = "The name of Key Vault Key"

}
variable "key_version" {
  type        = number
  description = "The version of Key Vault Key."

}
variable "user_identity" {
  type        = string
  description = "The user assigned identity that has access to the Key Vault Key. If not specified, system assigned identity will be used."
  default     = null

}
variable "kusto_cluster_id" {
  type        = string
  description = "kusto cluster id."
  

}