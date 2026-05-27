# Server Example

Provisions all roles on a PostgreSQL server. Roles come from two sources:

- **Static roles** — defined directly in `spec.roles` (e.g. the `opentofu` superuser)
- **LDAP entries** — any `ldap.kubed.io/v1alpha1 Entry` labeled with the server's opt-in label gets a login role automatically

## Opt-in label convention

Label key: `postgresql.kubed.io/server.{server-name}: "true"`

Using the server name in the key (not the value) means one Entry can be a member of multiple servers by carrying multiple labels:

```yaml
labels:
  postgresql.kubed.io/server.psql-main: "true"
  postgresql.kubed.io/server.psql-secondary: "true"
```

## Terraform

Calls the `modules/server` module directly with an explicit roles list. Useful for one-off provisioning or bootstrapping outside of Crossplane.

```sh
tofu init
tofu apply
```

## Kubernetes

Applies a `Server` composite resource. Crossplane:
1. Creates a per-server `ProviderConfig` with credentials mounted from the referenced secret
2. Finds all `Entry` resources matching `entrySelector.matchLabels` and merges their names into the roles list
3. Runs the server module via an OpenTofu `Workspace`

```sh
kubectl apply -k .
```

The secret referenced by `credentialsRef` must exist and contain `username` and `password` keys.
