variable "realm_id" {
  type    = string
  default = "my-realm"
}

variable "groups" {
  type    = list(string)
  default = ["group-dev", "group-admin"]
}

variable "user_groups" {
  type = object({
    user-dev   = list(string)
    user-admin = list(string)
  })
  default = {
    user-dev   = ["group-dev"]
    user-admin = ["group-admin"]
  }
}