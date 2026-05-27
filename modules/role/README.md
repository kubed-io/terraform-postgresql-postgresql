# PostgreSQL Role

Creates and manages a single PostgreSQL role.

## Variables

| Name | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `name` | string | yes | — | Role name, unique on the server |
| `privileges.login` | bool | no | `true` | Allow the role to log in |
| `privileges.superuser` | bool | no | `false` | Grant superuser privileges |
| `privileges.inherit` | bool | no | `true` | Inherit privileges of granted roles |
| `privileges.replication` | bool | no | `false` | Allow streaming replication |
| `privileges.createRole` | bool | no | `false` | Allow creating other roles |
| `privileges.createDatabase` | bool | no | `false` | Allow creating databases |
| `roles` | list(string) | no | `null` | Roles granted to this role |
| `connectionLimit` | number | no | `null` | Max concurrent connections (`-1` = unlimited) |

## Example

```hcl
module "role" {
  source = "../../modules/role"

  name = "drupal"
  privileges = {
    login = true
  }
}
```

## References

- [OpenTofu PostgreSQL Provider — postgresql_role](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest/docs/resources/postgresql_role)
