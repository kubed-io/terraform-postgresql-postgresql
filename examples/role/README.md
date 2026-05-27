# Role Example

Creates a single PostgreSQL role.

## Terraform

Calls the `modules/role` module directly. Useful when managing roles outside of Crossplane.

```sh
tofu init
tofu apply
```

## Kubernetes

Applies a `Role` composite resource. Crossplane reconciles it into an OpenTofu Workspace that calls the same module.

```sh
kubectl apply -k .
```
