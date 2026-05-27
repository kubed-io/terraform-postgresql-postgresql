resource "postgresql_role" "this" {
  for_each = { for r in var.roles : r.name => r }

  name             = each.value.name
  login            = each.value.privileges.login
  superuser        = each.value.privileges.superuser
  inherit          = each.value.privileges.inherit
  replication      = each.value.privileges.replication
  create_role      = each.value.privileges.createRole
  create_database  = each.value.privileges.createDatabase
  roles            = each.value.roles
  connection_limit = each.value.connectionLimit
}
