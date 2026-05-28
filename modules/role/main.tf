resource "random_password" "this" {
  count   = var.privileges.login ? 1 : 0
  length  = 32
  special = false
}

resource "postgresql_role" "this" {
  name             = var.name
  login            = var.privileges.login
  password         = var.privileges.login ? random_password.this[0].result : null
  superuser        = var.privileges.superuser
  inherit          = var.privileges.inherit
  replication      = var.privileges.replication
  create_role      = var.privileges.createRole
  create_database  = var.privileges.createDatabase
  roles            = var.roles
  connection_limit = var.connectionLimit
}
