terraform {
  required_version = ">= 1.4.4"
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = ">= 1.25.0"
    }
  }
}
