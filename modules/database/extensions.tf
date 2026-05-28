resource "postgresql_extension" "this" {
  for_each = {
    for ext in var.extensions : ext.name => ext
  }
  name            = each.value.name
  database        = postgresql_database.this.name
  schema          = try(each.value.schema, null)
  drop_cascade    = each.value.dropCascade
  create_cascade  = each.value.createCascade
}
