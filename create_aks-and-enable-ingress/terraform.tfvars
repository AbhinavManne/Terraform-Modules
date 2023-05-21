resource_group_name      = "rg"
create_resource_group   = false
location="east us"
application_gateway_name = "existing-app-gateway"
default_node_pool_name   = "default"
node_count               = 2
vm_size                  = "Standard_B2s"
os_disk_size_gb          = 30
appId                    = "29d498aa-a7d6-4e97-9b88-9aadab1f8719"
password                 = "lEj2FUgsRb3UOPRXwdUf3ZtoA.4LZyLRli"
enabled                  = true

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