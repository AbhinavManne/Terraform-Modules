resource_group_name   = "rg"
create_resource_group = false
location              = "east us"
#--------------------------------firewall policy rule collection group-----------------------------
firewall_policy_rule_collection_group_name = "fprcg-name1"
priority                                   = 500

################# application_rule_collection #############
application_rule_collection = [{
  action   = "Deny"
  name     = "app_rule_collection1"
  priority = 500
  rule = [{
    description           = "demo-rule-desc"
    destination_addresses = null
    destination_fqdns     = ["*.microsoft.com"]
    destination_fqdn_tags = null
    destination_urls      = null
    name                  = "app_rule_collection1_rule1"
    protocols = [{
      port = 80
      type = "Http"
      }, {
      port = 443
      type = "Https"
    }]
    source_addresses = ["10.0.0.1"]
    source_ip_groups = null
    terminate_tls    = false
    web_categories   = null
  }]
}]

################# Network_rule_collection #############
network_rule_collection = [{
  action   = "Deny"
  name     = "network_rule_collection1"
  priority = 400
  rule = [{
    destination_addresses = ["192.168.1.1", "192.168.1.2"]
    destination_fqdns     = null
    destination_ip_groups = null
    destination_ports     = ["80", "1000-2000"]
    name                  = "network_rule_collection1_rule1"
    protocols             = ["TCP", "UDP"]
    source_addresses      = ["10.0.0.1"]
    source_ip_groups      = null
  }]
}]

################# Nat rule collection #############
nat_rule_collection = [{
  action   = "Dnat"
  name     = "nat_rule_collection1"
  priority = 300
  rule = {
    destination_address = "192.168.1.1"
    destination_ports   = ["80"]
    name                = "nat_rule_collection1_rule1"
    protocols           = ["TCP", "UDP"]
    source_addresses    = ["10.0.0.1", "10.0.0.2"]
    source_ip_groups    = null
    translated_address  = "192.168.0.1"
    translated_fqdn     = null
    translated_port     = "8080"
  }
}]

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


