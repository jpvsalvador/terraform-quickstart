# create users
resource "keycloak_user" "users" {
  for_each       = var.user_groups
  realm_id       = var.realm_id
  username       = each.key
  enabled        = true
  email          = "${each.key}@domain.com"
  email_verified = true
  first_name     = each.key
  last_name      = each.key
  initial_password {
    value = each.key
  }
}

# configure use groups membership
resource "keycloak_user_groups" "user_groups" {
  for_each  = var.user_groups
  realm_id  = var.realm_id
  user_id   = keycloak_user.users[each.key].id
  group_ids = var.keycloak_group_ids
}