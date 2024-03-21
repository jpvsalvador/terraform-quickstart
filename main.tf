module "groups" {
  source  = "./modules/groups"

  realm_id = var.realm_id
  groups = var.groups
}

module "users" {
  source  = "./modules/users"

  realm_id = var.realm_id
  user_groups = var.user_groups

  keycloak_group_ids = module.groups.keycloak_group_ids
  depends_on = [ module.groups ]
}

module "openid" {
  source  = "./modules/openid"

  realm_id = var.realm_id
}

# Commands
# docker run -p 8080:8080 -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:22.0.1 start-dev
# terraform init
# terraform plan -out plan.out
# terraform apply "plan.out"     