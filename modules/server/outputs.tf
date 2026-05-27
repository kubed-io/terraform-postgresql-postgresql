output "roles" {
  description = "Names of the roles created on this server."
  value       = keys(module.role)
}
