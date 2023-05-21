data "azurerm_client_config" "current" {}

#Reference to module that provisions service fabric cluster
module "service_fabric_cluster_module" {
  source                                                       = "../../modules/module_service-fabric-cluster"
  resource_group_name                                          = var.resource_group_name
  location                                                     = var.location
  service_fabric_cluster_name                                  = var.service_fabric_cluster_name
  reliability_level                                            = var.reliability_level
  management_endpoint                                          = var.management_endpoint
  upgrade_mode                                                 = var.upgrade_mode
  vm_image                                                     = var.vm_image
  cluster_code_version                                         = var.cluster_code_version
  add_on_features                                              = var.add_on_features
  service_fabric_zonal_upgrade_mode                            = var.service_fabric_zonal_upgrade_mode
  vmss_zonal_upgrade_mode                                      = var.vmss_zonal_upgrade_mode
  tenant_id                                                    = data.azurerm_client_config.current.tenant_id
  cluster_application_id                                       = var.cluster_application_id
  client_application_id                                        = var.client_application_id
  certificate_common_name                                      = var.certificate_common_name
  certificate_issuer_thumbprint                                = var.certificate_issuer_thumbprint
  certificate_common_names_x509_store_name                     = var.certificate_common_names_x509_store_name
  certificate_thumbprint                                       = var.certificate_thumbprint
  certificate_thumbprint_secondary                             = var.certificate_thumbprint_secondary
  certificate_x509_store_name                                  = var.certificate_x509_store_name
  reverse_proxy_certificate_thumbprint                         = var.reverse_proxy_certificate_thumbprint
  reverse_proxy_certificate_thumbprint_secondary               = var.reverse_proxy_certificate_thumbprint_secondary
  reverse_proxy_certificate_x509_store_name                    = var.reverse_proxy_certificate_x509_store_name
  reverse_proxy_certificate_common_names                       = var.reverse_proxy_certificate_common_names
  reverse_proxy_certificate_common_names_x509_store_name       = var.reverse_proxy_certificate_common_names_x509_store_name
  reverse_proxy_certificate_certificate_issuer_thumbprint      = var.reverse_proxy_certificate_certificate_issuer_thumbprint
  client_certificate_thumbprint                                = var.client_certificate_thumbprint
  client_certificate_common_name                               = var.client_certificate_common_name
  client_certificate_common_name_certificate_issuer_thumbprint = var.client_certificate_common_name_certificate_issuer_thumbprint
  client_certificate_common_name_is_admin                      = var.client_certificate_common_name_is_admin
  storage_account_name                                         = var.storage_account_name
  protected_account_key_name                                   = var.protected_account_key_name
  storage_account_blob_endpoint                                = var.storage_account_blob_endpoint
  storage_account_queue_endpoint                               = var.storage_account_queue_endpoint
  storage_account_table_endpoint                               = var.storage_account_table_endpoint
  fabric_settings                                              = var.fabric_settings
  service_fabric_cluster_nodes                                 = var.service_fabric_cluster_nodes
  upgrade_policy                                               = var.upgrade_policy
  tags                                                         = var.tags
}

