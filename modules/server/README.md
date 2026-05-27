# PostgreSQL Server

Provisions all roles that should exist on a PostgreSQL server. Accepts a list of roles and delegates each one to the `../role` module.

This module is the terraform counterpart to the `Server` Crossplane CRD. When used through Crossplane, the composition merges static roles from the spec with LDAP Entry names resolved via the `entrySelector`. When used directly with terraform, the full roles list is passed in explicitly.

## Variables

| Name | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `roles` | list(object) | no | `[]` | Roles to provision on the server |

### Role object

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string | — | Role name |
| `privileges.login` | bool | `true` | Allow the role to log in |
| `privileges.superuser` | bool | `false` | Grant superuser privileges |
| `privileges.inherit` | bool | `true` | Inherit privileges of granted roles |
| `privileges.replication` | bool | `false` | Allow streaming replication |
| `privileges.createRole` | bool | `false` | Allow creating other roles |
| `privileges.createDatabase` | bool | `false` | Allow creating databases |
| `roles` | list(string) | `null` | Roles granted to this role |
| `connectionLimit` | number | `null` | Max concurrent connections |

Note: `login` defaults to `true` here (unlike the role module where it defaults to `false`) because server roles are primarily login identities.

## Example

```hcl
module "server" {
  source = "../../modules/server"

  roles = [
    {
      name = "opentofu"
      privileges = {
        login     = true
        superuser = true
      }
    },
    { name = "drupal" },
    { name = "n8n" },
  ]
}
```

## Outputs

| Name | Description |
| --- | --- |
| `roles` | Names of the roles created on this server |

## References

- [OpenTofu PostgreSQL Provider — postgresql_role](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest/docs/resources/postgresql_role)
