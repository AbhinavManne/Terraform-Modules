
variable "resource_lock_name" {
  type        = string
  description = "Name of the Resource Lock"
}

variable "resource_id" {
  type        = string
  description = "Id of the resource on which resource lock needs to be applied"
}

variable "lock_level" {
  type        = string
  description = "Specifies the Level to be used for the Lock"
}

variable "notes" {
  type        = string
  description = "Specifies some notes about the lock."
  default     = "Default Note"
}