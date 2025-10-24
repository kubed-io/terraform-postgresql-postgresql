resource "postgresql_database" "this" {
  name                   = var.name
  owner                  = var.owner
  tablespace_name       = var.tablespace_name
  template               = var.template
  lc_collate             = var.lc_collate
  lc_ctype               = var.lc_ctype
  encoding               = var.encoding
  connection_limit       = var.connection_limit
  allow_connections      = var.allow_connections
  is_template            = var.is_template
  alter_object_ownership = true
}

resource "postgresql_schema" "this" {
  for_each = { 
    for schema in var.schemas : schema.name => schema 
  }
  name  = each.value.name
  database      = postgresql_database.this.name
  owner = try(each.value.owner, postgresql_database.this.owner)
  if_not_exists = each.value.ifNotExists
  drop_cascade = each.value.dropCascade
  dynamic "policy" {
    for_each = each.value.policies
    content {
      usage  = try(policy.value.usage, null)
      create = try(policy.value.create, null)
      role   = try(policy.value.role, null)
    }
  }
}
