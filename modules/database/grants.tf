resource "postgresql_grant" "this" {
  for_each = {
    for grant in var.grants : join("-", compact([
      grant.role,
      grant.schema,
      grant.objectType,
      join("-", coalesce(grant.objects, [])),
      join("-", coalesce(grant.columns, []))
    ])) => grant
  }
  database          = postgresql_database.this.name
  role              = each.value.role
  privileges        = each.value.privileges
  schema            = each.value.schema
  object_type       = each.value.objectType
  objects           = each.value.objects
  columns           = each.value.columns
  with_grant_option = each.value.withGrantOption
}
