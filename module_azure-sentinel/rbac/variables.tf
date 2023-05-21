#------------------------------------VARIABLES: RESOURCE: ROLE ASSIGNMENT---------------------------#
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}

variable "scope" {
  type        = string
  description = "Scope of the Role Assignment"

}

#----------------------------------------------------------------------------------------------------#
