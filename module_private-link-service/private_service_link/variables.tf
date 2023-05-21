variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Private Link Service should exist."
}

variable "subnet_id" {
  type        = string
  description = "Specifies the ID of the Subnet which should be used for the Private Link Service."
}

variable "private_link_service" {
  type        = string
  description = "Specifies the name of this Private Link Service."
}

variable "location"{
type = string
description = "Specifies the supported Azure location where the resource exists"
}

variable "auto_approval_subscription_ids"{
type = list (string)
description = "A list of Subscription UUID/GUID's that will be automatically be able to use this Private Link Service."
default = null 
}
variable "enable_proxy_protocol"{
type = bool
description = "Should the Private Link Service support the Proxy Protocol? Defaults to false."
default = false 
}
variable "fqdns"{
type = list(string)
description = "List of FQDNs allowed for the Private Link Service."
default = null
}
variable "visibility_subscription_ids"{
type = list(string)
description = "A list of Subscription UUID/GUID's that will be able to see this Private Link Service."
default = null
}

variable "load_balancer_frontend_ip_configuration_ids"{
type = list(string)
description = "A list of Frontend IP Configuration IDs from a Standard Load Balancer, where traffic from the Private Link Service should be routed. You can use Load Balancer Rules to direct this traffic to appropriate backend pools where your applications are running."
}

variable "tags"{
type = map(string)
description = "A mapping of tags to assign to the resource. Changing this forces a new resource to be created." 

}

variable "nat_ip_configuration"{
type = string
description ="Specifies the name which should be used for the NAT IP Configuration." 
}
variable "private_ip_address"{
type = string
description = "Specifies a Private Static IP Address for this IP Configuration."
default = null
}
variable "private_ip_address_version"{
type = string
description = "The version of the IP Protocol which should be used. At this time the only supported value is IPv4. Defaults to IPv4." 
default = "IPv4"
}

variable "primary"{
type = bool
description = "Is this is the Primary IP Configuration? Changing this forces a new resource to be created." 
}
