create_resource_group = false
resource_group_name   = "rg"
location              = "east us"

firewall_policy_name = "example-policy"
base_policy_id       = null
private_ip_ranges    = ["193.168.10.0"]
firewall_policy_sku  = "Premium"
tags = {
  contact_name     = "ABC"
  cost_center      = "999"
  application_name = "firewall policy"
}
threat_intelligence_mode = "Alert"
sql_redirect_allowed     = true

enable_dns    = true
proxy_enabled = false
servers       = ["10.0.0.0"]

identity_type = null
identity_ids  = ["/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/new_rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/demo_identity"]

insights_enabled                   = false
default_log_analytics_workspace_id = null
retention_in_days                  = null

log_analytics_workspace = null

enable_intrusion_detection = false
mode                       = null
private_ranges             = null

signature_overrides = [{
  id    = 1
  state = "Alert"
}]

traffic_bypass = null

enable_threat_intelligence_allowlist = true
fqdns                                = ["www.contoso.com"]
ip_addresses                         = ["10.0.0.7"]


enable_tls_certificate = null
key_vault_secret_id    = null
name                   = null


