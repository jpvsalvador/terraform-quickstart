output "keycloak_group_ids" {
  value = [for g in var.groups : keycloak_group.groups[g].id]
}