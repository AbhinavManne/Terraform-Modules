#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group        = "rg-002"
create_resource_group = true
location              = "Central India"

#----DEFAULT VALUES: RESOURCE: KUBERNETES SERVICE---#
kubernetes_name                 = "aks-hawk-sample"
dns_prefix                      = "wanda-aks"
private_cluster_enabled         = true
default_node_pool_name          = "default"
node_count                      = 2
vm_size                         = "Standard_B2s"
os_disk_size_gb                 = 30
appId                           = "29d498aa-a7d6-4e97-9b88-9aadab1f8719"
password                        = "lEj2FUgsRb3UOPRXwdUf3ZtoA.4LZyLRli"
enabled                         = true
enable_http_application_routing = true
enable_azure_policy             = true
enable_log_analytics_workspace  = true
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_Kubernetes"
}

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
log_analytics_workspace = "wvm-workspace12"
log_sku                 = "PerGB2018"
retention_in_days       = 30

#----DEFAULT VALUES: RESOURCES: SECURITY CENTER----#
security_center_subscription_pricing_tier = "Standard"
security_resource_type                    = "Containers" #"KubernetesService"

security_center_email               = "abc@gds.ey.com"
security_center_phone               = "9874892932"
security_center_alert_notifications = true
security_center_alerts_to_admins    = true

security_center_setting_name   = "MCAS"
enable_security_center_setting = "false"

enable_security_center_auto_provisioning = "Off"