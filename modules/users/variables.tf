variable "realm_id" {
  type    = string
  default = ""
}

variable "user_groups" {
  type = object({
    user-dev   = list(string)
    user-admin = list(string)
  })
}

variable "keycloak_group_ids" {
  
}