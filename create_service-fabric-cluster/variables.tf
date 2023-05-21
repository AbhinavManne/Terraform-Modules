
variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  type        = string
  description = "RG location in Azure"
}

#-------------------------------------VARIABLES: RESOURCE: SERVICE FABRIC CLUSTER--------------------------#
variable "service_fabric_cluster_name" {
  type        = string
  description = "Name of the Service Fabric Cluster"
}

variable "reliability_level" {
  type        = string
  description = "Specifies the Reliability Level of the Cluster. Possible values include None, Bronze, Silver, Gold and Platinum."
}

variable "management_endpoint" {
  type        = string
  description = "Specifies the Management Endpoint of the cluster such as http://example.com. Changing this forces a new resource to be created."
}

variable "upgrade_mode" {
  type        = string
  description = "Specifies the Upgrade Mode of the cluster. Possible values are Automatic or Manual."
}

variable "vm_image" {
  type        = string
  description = "Image expected for the Service Fabric Cluster, such as Windows"
}

variable "cluster_code_version" {
  type        = string
  description = "Required if Upgrade Mode set to Manual, Specifies the Version of the Cluster Code of the cluster"
}

variable "add_on_features" {
  type        = list(string)
  description = "A List of one or more features which should be enabled, such as DnsService."
}

variable "service_fabric_zonal_upgrade_mode" {
  type        = string
  description = "Specifies the logical grouping of VMs in upgrade domains. Possible values are Hierarchical or Parallel."
}

variable "vmss_zonal_upgrade_mode" {
  type        = string
  description = "Specifies the upgrade mode for the virtual machine scale set updates that happen in all availability zones at once. Possible values are Hierarchical or Parallel."
}

# variable "tenant_id" {
#   type = string
#   description = "The Azure Active Directory Tenant ID."
# }

variable "cluster_application_id" {
  type        = string
  description = "The Azure Active Directory Cluster Application ID."
}

variable "client_application_id" {
  type        = string
  description = "The Azure Active Directory Client ID which should be used for the Client Application."
}

variable "certificate_common_name" {
  type        = string
  description = "The common or subject name of the certificate."
}

variable "certificate_issuer_thumbprint" {
  type        = string
  description = " The Issuer Thumbprint of the Certificate."
}

variable "certificate_common_names_x509_store_name" {
  type        = string
  description = "The X509 Store where the Certificate Exists, such as My."
}

variable "certificate_thumbprint" {
  type        = string
  description = "The Thumbprint of the Certificate."
}

variable "certificate_thumbprint_secondary" {
  type        = string
  description = "The Secondary Thumbprint of the Certificate."
}

variable "certificate_x509_store_name" {
  type        = string
  description = "The X509 Store where the Certificate Exists, such as My."
}

variable "reverse_proxy_certificate_thumbprint" {
  type        = string
  description = "The Thumbprint of the Certificate."
}

variable "reverse_proxy_certificate_thumbprint_secondary" {
  type        = string
  description = "The Secondary Thumbprint of the Certificate."
}

variable "reverse_proxy_certificate_x509_store_name" {
  type        = string
  description = " The X509 Store where the Certificate Exists, such as My."
}

variable "reverse_proxy_certificate_common_names" {
  type        = string
  description = "The common or subject name of the certificate."
}

variable "reverse_proxy_certificate_common_names_x509_store_name" {
  type        = string
  description = "The X509 Store where the Certificate Exists, such as My."
}

variable "reverse_proxy_certificate_certificate_issuer_thumbprint" {
  type        = string
  description = "The Issuer Thumbprint of the Certificate."
}

variable "client_certificate_thumbprint" {
  type        = map(any)
  description = " The Thumbprint associated with the Client Certificate. Does the Client Certificate have Admin Access to the cluster? Non-admin clients can only perform read only operations on the cluster."
}

variable "client_certificate_common_name" {
  type        = string
  description = "The common or subject name of the certificate."
}

variable "client_certificate_common_name_certificate_issuer_thumbprint" {
  type        = string
  description = " The Issuer Thumbprint of the Certificate."
}

variable "client_certificate_common_name_is_admin" {
  type        = string
  description = "Does the Client Certificate have Admin Access to the cluster? Non-admin clients can only perform read only operations on the cluster."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account where the Diagnostics should be sent to."
}

variable "protected_account_key_name" {
  type        = string
  description = "The protected diagnostics storage key name, such as StorageAccountKey1."
}

variable "storage_account_blob_endpoint" {
  type        = string
  description = "The Blob Endpoint of the Storage Account."
}

variable "storage_account_queue_endpoint" {
  type        = string
  description = "The Queue Endpoint of the Storage Account."
}

variable "storage_account_table_endpoint" {
  type        = string
  description = "The Table Endpoint of the Storage Account."
}

variable "fabric_settings" {
  type = list(object({
    name       = string
    parameters = map(string)
  }))
  description = " The name of the Fabric Setting, such as Security or Federation.A map containing settings for the specified Fabric Setting."
}

variable "service_fabric_cluster_nodes" {
  type = list(object({
    name                        = string
    placement_properties        = map(string)
    capacities                  = map(string)
    instance_count              = number
    is_primary                  = bool
    is_stateless                = bool
    multiple_availability_zones = string
    client_endpoint_port        = number
    http_endpoint_port          = number
    durability_level            = string
    reverse_proxy_endpoint_port = number
    application_ports = list(object({
      start_port = number
      end_port   = number
    }))
    ephemeral_ports = list(object({
      start_port = number
      end_port   = number
    }))
  }))
  description = "One or more node type blocks"
}

variable "upgrade_policy" {
  type = list(object({
    force_restart                     = string
    health_check_retry_timeout        = string
    health_check_stable_duration      = string
    health_check_wait_duration        = string
    upgrade_domain_timeout            = string
    upgrade_replica_set_check_timeout = string
    upgrade_timeout                   = string
    health_policy = list(object({
      max_unhealthy_applications_percent = number
      max_unhealthy_nodes_percent        = number
    }))
    delta_health_policy = list(object({
      max_delta_unhealthy_applications_percent         = number
      max_delta_unhealthy_nodes_percent                = number
      max_upgrade_domain_delta_unhealthy_nodes_percent = number
    }))
  }))

}

variable "tags" {
  type        = map(string)
  description = "The tags to associate with the resource."
}
