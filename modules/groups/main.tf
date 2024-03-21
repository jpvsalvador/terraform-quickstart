# create groups
resource "keycloak_group" "groups" {
  for_each = toset(var.groups)
  realm_id = var.realm_id
  name     = each.key
}