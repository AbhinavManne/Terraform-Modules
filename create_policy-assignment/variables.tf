variable "vnet_name" {
  type        = string
  description = "Name of Virtul network"
}
variable "respurce_group_name" {
  type        = string
  description = "Name of Resource Group"
}
variable "policy_name" {
  type        = string
  description = "Name of Policy defination"
}
variable "policy_type" {
  type        = string
  description = "Policy Defination Type"
}
variable "policy_mode" {
  type        = string
  description = "Mode of Policay Defination"
}
variable "policy_display_name" {
  type        = string
  description = "Policy display name"
}
variable "policy_assignment_name" {
  type        = string
  description = "Name of Policy Assignment"
}