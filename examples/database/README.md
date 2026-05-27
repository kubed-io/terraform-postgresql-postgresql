# Database Example

Creates a PostgreSQL database with a schema and grants.

## Terraform

Calls the `modules/database` module directly. Useful when managing databases outside of Crossplane.

```sh
tofu init
tofu apply
```

## Kubernetes

Applies a `Database` composite resource. Crossplane reconciles it into an OpenTofu Workspace that calls the same module.

```sh
kubectl apply -k .
```
