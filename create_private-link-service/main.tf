module "azurerm_private_link_service" {
  source                                      = "../../modules/module_private-link-service/private_service_link"
  resource_group_name                         = var.resource_group_name
  private_link_service                        = var.private_link_service
  location                                    = var.location
  auto_approval_subscription_ids              = var.auto_approval_subscription_ids
  enable_proxy_protocol                       = var.enable_proxy_protocol
  fqdns                                       = var.fqdns
  visibility_subscription_ids                 = var.visibility_subscription_ids
  load_balancer_frontend_ip_configuration_ids = var.load_balancer_frontend_ip_configuration_ids
  tags                                        = var.tags
  nat_ip_configuration                        = var.nat_ip_configuration
  private_ip_address                          = var.private_ip_address
  private_ip_address_version                  = var.private_ip_address_version
  subnet_id                                   = var.subnet_id
  primary                                     = var.primary

}
