variable "name" {
  type        = string
  description = " (Required) The name of the role. Must be unique on the PostgreSQL server instance where it is configured."
}

variable "owner" {
  description = "(Optional) The role name of the user who will own the database, or DEFAULT to use the default (namely, the user executing the command). To create a database owned by another role or to change the owner of an existing database, you must be a direct or indirect member of the specified role, or the username in the provider is a superuser."
  type        = string
  default     = null
  nullable    = true
}

variable "tablespace_name" {
  description = "(Optional) The name of the tablespace that will be associated with the database, or DEFAULT to use the template database's tablespace. This tablespace will be the default tablespace used for objects created in this database."
  type        = string
  default     = null
  nullable    = true
}

variable "template" {
  description = "(Optional) The name of the template database from which to create the database, or DEFAULT to use the default template (template0). NOTE: the default in Terraform is template0, not template1. Changing this value will force the creation of a new resource as this value can only be changed when a database is created."
  type        = string
  default     = null
  nullable    = true
}

variable "connection_limit" {
  description = "(Optional) How many concurrent connections can be established to this database. -1 (the default) means no limit."
  type        = number
  default     = -1
  nullable    = true
}

variable "allow_connections" {
  description = "(Optional) If false then no one can connect to this database. The default is true, allowing connections (except as restricted by other mechanisms, such as GRANT or REVOKE CONNECT)."
  type        = bool
  default     = true
  nullable    = true
}

variable "is_template" {
  description = "(Optional) If true, then this database can be cloned by any user with CREATEDB privileges; if false (the default), then only superusers or the owner of the database can clone it."
  type        = bool
  default     = false
  nullable    = true
}

variable "lc_collate" {
  description = "(Optional) Collation order (LC_COLLATE) to use in the database. This affects the sort order applied to strings, e.g. in queries with ORDER BY, as well as the order used in indexes on text columns. If unset or set to an empty string the default collation is set to C. If set to DEFAULT Terraform will use the same collation order as the specified template database. Changing this value will force the creation of a new resource as this value can only be changed when a database is created."
  type        = string
  default     = null
  nullable    = true
}

variable "lc_ctype" {
  description = "(Optional) Character classification (LC_CTYPE) to use in the database. This affects the categorization of characters, e.g. lower, upper and digit. If unset or set to an empty string the default character classification is set to C. If set to DEFAULT Terraform will use the character classification of the specified template database. Changing this value will force the creation of a new resource as this value can only be changed when a database is created."
  type        = string
  default     = null
  nullable    = true
}

variable "encoding" {
  description = "(Optional) Character set encoding to use in the database. Specify a string constant (e.g. UTF8 or SQL_ASCII), or an integer encoding number. If unset or set to an empty string the default encoding is set to UTF8. If set to DEFAULT Terraform will use the same encoding as the template database. Changing this value will force the creation of a new resource as this value can only be changed when a database is created."
  type        = string
  default     = null
  nullable    = true
}

variable "schemas" {
  description = "(Optional) A set of schemas to create in the database after it has been created. Each schema will be owned by the database owner."
  type = set(object({
    name        = string
    owner       = optional(string)
    ifNotExists = optional(bool, true)
    dropCascade = optional(bool, false)
    policies = optional(set(object({
      create = optional(bool)
      usage  = optional(bool)
      role   = optional(string)
    })), [])
  }))
  default = []
}
