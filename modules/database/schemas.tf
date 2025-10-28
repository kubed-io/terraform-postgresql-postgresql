resource "postgresql_schema" "this" {
  for_each = {
    for schema in var.schemas : schema.name => schema
  }
  name          = each.value.name
  database      = postgresql_database.this.name
  owner         = try(each.value.owner, postgresql_database.this.owner)
  if_not_exists = each.value.ifNotExists
  drop_cascade  = each.value.dropCascade
  dynamic "policy" {
    for_each = each.value.policies
    content {
      usage  = try(policy.value.usage, null)
      create = try(policy.value.create, null)
      role   = try(policy.value.role, null)
    }
  }
}
