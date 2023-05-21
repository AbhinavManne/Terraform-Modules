keyvault_certificate = "imported-cert"
keyvault_id    = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/cil-testing-as/providers/Microsoft.KeyVault/vaults/kv-resources-as-001"      
generate_certificate = true//false
certificate = {
  //contents = 
  password = "abvcxkk"
}
certificate_policy = [ {
  content_type = "application/x-pkcs12"
  curve = null
  exportable = "true"
  issuer_parameters_name = "Self"
  key_size = "2048"
  key_type = "RSA"
  lifetime_action = [ {
    action_type = "AutoRenew"
    days_before_expiry = "30"
    lifetime_percentage = null
  } ]
  reuse_key = "true"
  x509_certificate_properties = [ {
    extended_key_usage = ["1.3.6.1.5.5.7.3.1"]
    key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]
    subject = "CN=hello-world"
    subject_alternative_names = [{
      dns_names = ["internal.contoso.com", "domain.hello.world"]
      emails = null
      upns = null
    }]
    validity_in_months = "12"
  } ]
} ]

tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Keyvault_certificate"
}              