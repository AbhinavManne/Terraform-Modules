#-----------------------------------Resource Group--------------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
#--------------------------------Analysis Services Server Variables----------------------------------
variable "server_name" {
  type        = string
  description = "Analysis Services server name in Azure"
}

variable "sku" {
  type        = string
  description = "Analysis Services server sku in Azure, Possible values are: D1, B1, B2, S0, S1, S2, S4, S8, S9, S8v2 and S9v2"
}

variable "admin_users" {
  type        = list(string)
  description = "Admin user in Azure"
  default     = ["abc@xyz.com"]
}

variable "querypool_connection_mode" {
  type        = string
  description = "This controls how the read-write server is used in the query pool"
  default     = "All"
}

variable "backup_blob_container_uri" {
  type        = string
  description = "URI and SAS token for a blob container to store backups."
  default     = null
}

variable "enable_power_bi_service" {
  type        = bool
  description = "to enable power BI services"
  default     = null
}

variable "firewall_rules" {
  description = "Firewall rules."
  type = list(object({
    name        = string
    range_start = string
    range_end   = string

  }))

}

variable "tags" {
  type        = map(any)
  description = "tags for the resource"
}
