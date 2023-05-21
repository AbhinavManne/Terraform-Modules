variable "keyvault_certificate" {
  type        = string
  description = "Specifies the name of the Key Vault Certificate."
}

variable "keyvault_id" {
  type        = string
  description = "The ID of the Key Vault where the Certificate should be created."
}

variable "generate_certificate" {
  type        = bool
  description = "Wants to generate a certificate?"
}

variable "certificate" {
  type = object({
    //contents = string
    password = string
  })
  description = "contents - (Required) The base64-encoded certificate contents. password - (Optional) The password associated with the certificate. Changing this forces a new resource to be created."
}

variable "certificate_policy" {
  type = list(object({
    issuer_parameters_name = string
    curve                  = string
    exportable             = string
    key_size               = string
    key_type               = string
    reuse_key              = string
    content_type           = string
    lifetime_action = list(object({
      action_type         = string
      days_before_expiry  = string
      lifetime_percentage = number
    }))
    x509_certificate_properties = list(object({
      extended_key_usage = list(string)
      key_usage          = list(string)
      subject            = string
      validity_in_months = string
      subject_alternative_names = list(object({
        dns_names = list(string)
        emails    = list(string)
        upns      = list(string)
      }))
    }))
  }))
  description = "issuer_parameters:name - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown (for a certificate issuing authority like Let's Encrypt and Azure direct supported ones). key_properties: curve - (Optional) Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. exportable - (Required) Is this certificate exportable? Changing this forces a new resource to be created. key_size - (Optional) The size of the key used in the certificate. Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys. This property is required when using RSA keys. key_type - (Required) Specifies the type of key, such as RSA or EC. reuse_key - (Required) Is the key reusable? lifetime_action: action_type - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts. days_before_expiry - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. lifetime_percentage - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run.  "
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
