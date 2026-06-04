resource "postgresql_schema" "this" {
  for_each = {
    for schema in var.schemas : schema.name => schema
  }
  name          = each.value.name
  database      = postgresql_database.this.name
  # owner is optional(string) → omitted entries materialize as null, which try()
  # does NOT skip (null is a valid value, not an error). coalesce returns the first
  # non-null, so an omitted owner falls through to the database owner — matching the
  # variable's documented "owned by the database owner" default.
  owner         = coalesce(each.value.owner, postgresql_database.this.owner)
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
