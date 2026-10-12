# Kubed PostgreSQL Terraform Module

A collection of modules to create and manage resources within PostgreSQL using Terraform.

## Modules 

### Role 

A postgreSQL role module to create and manage PostgreSQL roles.

### Database

A postgreSQL database module to create and manage PostgreSQL databases. This also manages the grants, schemas, and extensions for this db. 

## Releases

Releases are cut by the Publish workflow, which pins every Composition's module to the
release's own tag, so deploy `crd/` at a tag (`?ref=vX.Y.Z`), never at `main`.

## References

- [PostgreSQL Provder by cyrilgdn](https://search.opentofu.org/provider/cyrilgdn/postgresql/latest)
