resource "postgresql_database" "this" {
  name                   = var.name
  owner                  = var.owner
  tablespace_name        = var.tablespace_name
  template               = var.template
  lc_collate             = var.lc_collate
  lc_ctype               = var.lc_ctype
  encoding               = var.encoding
  connection_limit       = var.connection_limit
  allow_connections      = var.allow_connections
  is_template            = var.is_template
  alter_object_ownership = true
}
