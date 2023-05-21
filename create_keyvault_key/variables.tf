variable "keyvault_key" {
  type        = string
  description = "Specifies the name of the Key Vault Key. Changing this forces a new resource to be created."
}

variable "keyvault_id" {
  type        = string
  description = "ID of Keyvault"
}

variable "key_type" {
  type        = string
  description = "Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, Oct (Octet), RSA and RSA-HSM. Changing this forces a new resource to be created."
}

variable "key_size" {
  type        = string
  description = "Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created."
}

variable "key_curve" {
  type        = string
  description = "Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified. Changing this forces a new resource to be created"
}

variable "key_not_before_date" {
  type        = string
  description = "Key not usable before the provided UTC datetime (Y-m-d'T'H:M:S'Z')."
}

variable "key_expiration_date" {
  type        = string
  description = "Expiration UTC datetime (Y-m-d'T'H:M:S'Z')"
}

variable "key_opts" {
  type        = list(string)
  description = "A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}