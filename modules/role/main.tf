resource "postgresql_role" "this" {
  name             = var.name
  login            = var.privileges.login
  superuser        = var.privileges.superuser
  inherit          = var.privileges.inherit
  replication      = var.privileges.replication
  create_role      = var.privileges.createRole
  create_database  = var.privileges.createDatabase
  roles            = var.roles
  connection_limit = var.connectionLimit
}
