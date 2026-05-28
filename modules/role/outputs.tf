output "username" {
  description = "The name of the PostgreSQL role."
  value       = postgresql_role.this.name
}

output "password" {
  description = "The generated password for the role. Only set when login = true."
  value       = var.privileges.login ? random_password.this[0].result : null
  sensitive   = true
}
