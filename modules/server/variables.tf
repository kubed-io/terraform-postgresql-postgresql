variable "roles" {
  description = "List of roles to create on this server."
  type = list(object({
    name            = string
    connectionLimit = optional(number, null)
    roles           = optional(list(string), null)
    privileges = optional(object({
      inherit        = optional(bool, true)
      login          = optional(bool, true)
      superuser      = optional(bool, false)
      replication    = optional(bool, false)
      createRole     = optional(bool, false)
      createDatabase = optional(bool, false)
    }), {})
  }))
  default = []
}
