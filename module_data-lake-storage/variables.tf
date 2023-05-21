variable "data_lake_containers" {
  type = map(object({
    properties = map(string)
    owner      = string
    group      = string
    //ace        = list(map(string))
  }))
  description = "A list of Data Lake Gen 2 file system container names and ACL permissions."
}

variable "ace" {
  type = map(map(string))
  description = "One or more ace blocks as defined below to specify the entries for the ACL for the path"
  default = null
}

variable "storage_account_id" {
  type        = string
  description = "id of storage acount"
}
