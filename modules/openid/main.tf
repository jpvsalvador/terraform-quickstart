# create groups openid client scope
resource "keycloak_openid_client_scope" "groups" {
  realm_id               = var.realm_id
  name                   = "groups"
  include_in_token_scope = true
  gui_order              = 1
}
resource "keycloak_openid_group_membership_protocol_mapper" "groups" {
  realm_id        = var.realm_id
  client_scope_id = keycloak_openid_client_scope.groups.id
  name            = "groups"
  claim_name      = "groups"
  full_path       = false
}
# create kube openid client
resource "keycloak_openid_client" "kube" {
  realm_id                     = var.realm_id
  client_id                    = "kube"
  name                         = "kube"
  enabled                      = true
  access_type                  = "CONFIDENTIAL"
  client_secret                = "kube-client-secret"
  standard_flow_enabled        = false
  implicit_flow_enabled        = false
  direct_access_grants_enabled = true
}
# configure kube openid client default scopes
resource "keycloak_openid_client_default_scopes" "kube" {
  realm_id  = var.realm_id
  client_id = keycloak_openid_client.kube.id
  default_scopes = [
    "email",
    keycloak_openid_client_scope.groups.name,
  ]
}