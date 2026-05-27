# PostgreSQL Database

Creates and manages a PostgreSQL database including schemas and grants.

## Variables

| Name | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `name` | string | yes | — | Database name |
| `owner` | string | no | `null` | Role that owns the database |
| `connection_limit` | number | no | `-1` | Max concurrent connections (`-1` = unlimited) |
| `allow_connections` | bool | no | `true` | Whether connections are allowed |
| `is_template` | bool | no | `false` | Whether the database can be used as a template |
| `template` | string | no | `null` | Template database to clone from |
| `tablespace_name` | string | no | `null` | Tablespace for the database |
| `lc_collate` | string | no | `null` | Collation order |
| `lc_ctype` | string | no | `null` | Character classification |
| `encoding` | string | no | `null` | Character set encoding |
| `schemas` | list(object) | no | `[]` | Schemas to create in the database |
| `grants` | list(object) | no | `[]` | Grants to apply to the database |

### Schema object

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Schema name |
| `owner` | string | `null` | Schema owner |
| `ifNotExists` | bool | `true` | Skip if schema already exists |
| `dropCascade` | bool | `false` | Drop all objects when schema is removed |
| `policies` | list(object) | `[]` | Schema-level `CREATE`/`USAGE` policies |

### Grant object

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `role` | string | — | Role to grant to |
| `privileges` | list(string) | — | Privileges to grant (e.g. `CONNECT`, `CREATE`) |
| `objectType` | string | `database` | Object type the grant applies to |
| `schema` | string | `null` | Schema scope |
| `objects` | list(string) | `null` | Specific objects to grant on |
| `withGrantOption` | bool | `false` | Allow the grantee to re-grant |

## Example

```hcl
module "database" {
  source = "../../modules/database"

  name  = "drupal"
  owner = "drupal"
  schemas = [
    {
      name = "drupal"
    }
  ]
  grants = [
    {
      role       = "drupal"
      privileges = ["CONNECT", "CREATE"]
    }
  ]
}
```

## References

- [OpenTofu PostgreSQL Provider — postgresql_database](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest/docs/resources/postgresql_database)
- [OpenTofu PostgreSQL Provider — postgresql_grant](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest/docs/resources/postgresql_grant)
- [OpenTofu PostgreSQL Provider — postgresql_schema](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest/docs/resources/postgresql_schema)
