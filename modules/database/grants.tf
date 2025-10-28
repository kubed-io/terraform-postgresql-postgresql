resource "postgresql_grant" "this" {
  for_each = {
    for grant in var.grants : join("-", compact([
      grant.role,
      grant.schema,
      grant.objectType,
      join("-", try(grant.objects, [])),
      join("-", try(grant.columns, []))
    ])) => grant
  }
  database          = postgresql_database.this.name
  role              = each.value.role
  privileges        = each.value.privileges
  schema            = each.value.schema
  object_type       = each.value.objectType
  objects           = try(each.value.objects, [])
  columns           = try(each.value.columns, [])
  with_grant_option = each.value.withGrantOption
}
