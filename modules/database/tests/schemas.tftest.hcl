# Schema owner defaulting — regression guard.
#
# `owner` is optional(string) with no default, so an omitted owner materializes
# as null. The schema resource must fall through to the DATABASE owner in that
# case (the variable's documented contract). A null owner here means the schema
# gets created owned by the connecting admin role instead of the db owner, which
# silently breaks per-site search_path isolation (the role can't USE the schema).

run "schema_owner_defaults_to_db_owner" {
  command = plan
  variables {
    name  = "app_db"
    owner = "app_owner"
    schemas = [
      { name = "tenant_a" },                    # owner omitted -> inherit db owner
      { name = "tenant_b", owner = "explicit" }, # owner set      -> use it
    ]
  }

  assert {
    condition     = postgresql_schema.this["tenant_a"].owner == "app_owner"
    error_message = "Schema with omitted owner must inherit the database owner, not null/admin"
  }

  assert {
    condition     = postgresql_schema.this["tenant_b"].owner == "explicit"
    error_message = "Schema with an explicit owner must keep it"
  }
}
