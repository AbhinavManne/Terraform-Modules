variable "virtualhub" {
  type        = string
  description = "The name of the Virtual Hub. Changing this forces a new resource to be created."

}
variable "rg" {
  type        = string
  description = "Specifies the name of the Resource Group where the Virtual Hub should exist."

}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the Virtual Hub should exist."

}
variable "virtual_wan_id" {
  type        = string
  description = "The ID of a Virtual WAN within which the Virtual Hub should be created. "
  default     = null
}
variable "address_prefix" {
  type        = string
  description = "The Address Prefix which should be used for this Virtual Hub."
  default     = null
}
variable "sku" {
  type        = string
  description = "The SKU of the Virtual Hub. Possible values are Basic and Standard."
  default     = null

}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the Virtual Hub."
  default     = null

}
variable "route" {
  type        = string
  description = "One or more route blocks as defined below."
  default     = null

}

variable "next_hop_ip_address" {
  type        = string
  description = "The IP Address that Packets should be forwarded to as the Next Hop."
  default     = null
}
