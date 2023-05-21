#group
variable "name" {
  type        = string
  description = "Specifies the name of the Container Group. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Container Group. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "os_type" {
  type        = string
  description = "The OS for the container group. Allowed s are Linux and Windows. Changing this forces a new resource to be created."
}

variable "dns_name_label" {
  type        = string
  description = "The DNS label/name for the container group's IP. Changing this forces a new resource to be created."
  default     = null
}

variable "dns_name_label_reuse_policy" {
  type        = string
  description = " The value representing the security enum. Noreuse, ResourceGroupReuse, SubscriptionReuse, TenantReuse or Unsecure. Changing this forces a new resource to be created."
  default     = "Unsecure"
}

variable "ip_address_type" {
  type        = string
  description = " Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, subnet_ids also needs to be set."
  default     = "None"
}

variable "key_vault_key_id" {
  type        = string
  description = "The Key Vault key URI for CMK encryption. Changing this forces a new resource to be created."
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "The subnet resource IDs for a container group. Changing this forces a new resource to be created."
  default     = null
}

variable "restart_policy" {
  type        = string
  description = "Restart policy for the container group. Allowed values are Always, Never, OnFailure. Changing this forces a new resource to be created."
  default     = "Always"
}

variable "zones" {
  type        = list(string)
  description = "A list of Availability Zones in which this Container Group is located."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = null
}

variable "identity_config" {
  type = list(object({
    type         = string
    identity_ids = list(string)
  }))
  default = [{
    identity_ids = null
    type         = "SystemAssigned"
  }]
  description = "Managed Service Identity configuration"
}

variable "init_container_config" {
  type = list(object({
    name                         = string
    image                        = string
    environment_variables        = map(string)
    secure_environment_variables = map(string)
    commands                     = list(string)
    volume = list(object({
      name                 = string
      mount_path           = string
      read_only            = bool
      empty_dir            = bool
      storage_account_name = string
      storage_account_key  = string
      share_name           = string
      git_repo = list(object({
        url       = string
        directory = string
        revision  = string
      }))
      secret = map(string)
    }))
  }))
  default = [{
    commands                     = null
    environment_variables        = null
    image                        = ""
    name                         = ""
    secure_environment_variables = null
    volume = [{
      empty_dir = false
      git_repo = [{
        directory = null
        revision  = null
        url       = ""
      }]
      mount_path           = ""
      name                 = ""
      read_only            = false
      secret               = null
      share_name           = null
      storage_account_key  = null
      storage_account_name = null
    }]
  }]
  description = "The definition of an init container that is part of the group"
}

variable "container_config" {
  type = list(object({
    name   = string
    image  = string
    cpu    = number
    memory = number
    gpu = list(object({
      count = number
      sku   = string
    }))
    cpu_limit    = number
    memory_limit = number
    gpu_limit = list(object({
      count = number
      sku   = string
    }))
    ports = list(object({
      port     = number
      protocol = string
    }))
    environment_variables        = map(string)
    secure_environment_variables = map(string)
    readiness_probe = list(object({
      //one and only one of exec and http_get can be specified 
      exec                  = list(string)
      initial_delay_seconds = number
      period_seconds        = number
      failure_threshold     = number
      success_threshold     = number
      timeout_seconds       = number
    }))
    liveness_probe = list(object({
      //one and only one of exec and http_get can be specified 
      http_get = list(object({
        path         = string
        port         = number
        scheme       = string
        http_headers = map(string)
      }))
      initial_delay_seconds = number
      period_seconds        = number
      failure_threshold     = number
      success_threshold     = number
      timeout_seconds       = number
    }))
    commands = list(string)
    volume = list(object({
      name                 = string
      mount_path           = string
      read_only            = bool
      empty_dir            = bool
      storage_account_name = string
      storage_account_key  = string
      share_name           = string
      git_repo = list(object({
        url       = string
        directory = string
        revision  = string
      }))
      secret = map(string)
    }))
  }))
  default = [{
    commands              = null
    cpu                   = 1
    cpu_limit             = null
    environment_variables = null
    gpu = [{
      count = 1
      sku   = "K80"
    }]
    gpu_limit = [{
      count = null
      sku   = null
    }]
    image = ""
    liveness_probe = [{
      //one and only one of exec and http_get can be specified 
      failure_threshold = null
      http_get = [{
        http_headers = null
        path         = null
        port         = null
        scheme       = null
      }]
      initial_delay_seconds = null
      period_seconds        = null
      success_threshold     = null
      timeout_seconds       = null
    }]
    memory       = 1
    memory_limit = null
    name         = ""
    ports = [{
      port     = 1
      protocol = ""
    }]
    readiness_probe = [{
      //one and only one of exec and http_get can be specified
      exec                  = null
      failure_threshold     = null
      initial_delay_seconds = null
      period_seconds        = null
      success_threshold     = null
      timeout_seconds       = null
    }]
    secure_environment_variables = null
    volume = [{
      empty_dir = false
      git_repo = [{
        directory = null
        revision  = null
        url       = ""
      }]
      mount_path           = ""
      name                 = ""
      read_only            = false
      secret               = null
      share_name           = null
      storage_account_key  = null
      storage_account_name = null
    }]
  }]
  description = "The definition of a container that is part of the group"
}

variable "dns_config_config" {
  type = list(object({
    nameservers    = list(string)
    search_domains = list(string)
    options        = list(string)
  }))
  default = [{
    nameservers    = [""]
    options        = null
    search_domains = null
  }]
  description = "The definition of the DNS configuration settings that are part of the group"
}

variable "diagnostics_config" {
  type = list(object({
    log_analytics = list(object({
      log_type      = string
      workspace_id  = string
      workspace_key = string
      metadata      = map(string)
    }))
  }))
  default = [{
    log_analytics = [{
      log_type = null
      metadata = {
        diagnostic = "containergroup"
      }
      workspace_id  = ""
      workspace_key = ""
    }]
  }]
  description = "The definition of the diagnostic settings that are part of the group"
}

variable "exposed_port_config" {
  type = list(object({
    port     = number
    protocol = string
  }))
  default = [{
    port     = null
    protocol = null
  }]
  description = "The definition of the exposed port settings that is part of the group"
}

variable "image_registry_credential_config" {
  type = list(object({
    user_assigned_identity_id = string
    username                  = string
    password                  = string
    server                    = string
  }))
  default = [{
    password                  = ""
    server                    = "myacr.acr.io"
    user_assigned_identity_id = null
    username                  = ""
  }]
  description = "Settings for connecting to the image registry"
}
