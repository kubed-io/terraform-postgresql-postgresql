variable "name" {
  type        = string
  description = " (Required) The name of the role. Must be unique on the PostgreSQL server instance where it is configured."
}

variable "roles" {
  description = "(Optional) Defines list of roles which will be granted to this new role."
  type        = list(string)
  default     = null
  nullable    = true
}

variable "privileges" {
  description = "(Optional) A map of privilege flags to give to the role."
  type = object({
    inherit        = optional(bool, true)
    login          = optional(bool, false)
    superuser      = optional(bool, false)
    replication    = optional(bool, false)
    createRole     = optional(bool, false)
    createDatabase = optional(bool, false)
  })
  default = {}
}

variable "connectionLimit" {
  description = "(Optional) If this role can log in, this specifies how many concurrent connections the role can establish. -1 (the default) means no limit."
  type        = number
  default     = null
  nullable    = true
}