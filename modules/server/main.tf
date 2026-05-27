module "role" {
  for_each = { for r in var.roles : r.name => r }
  source   = "../role"

  name            = each.value.name
  connectionLimit = each.value.connectionLimit
  roles           = each.value.roles
  privileges      = each.value.privileges
}
