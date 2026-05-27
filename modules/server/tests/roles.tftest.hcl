run "multiple_roles" {
  command = plan
  variables {
    roles = [
      { name = "drupal" },
      { name = "n8n" },
      {
        name = "opentofu"
        privileges = {
          login     = true
          superuser = true
        }
      }
    ]
  }

  assert {
    condition     = length(output.roles) == 3
    error_message = "Expected three roles to be created"
  }

  assert {
    condition     = contains(output.roles, "drupal")
    error_message = "Expected drupal role to be created"
  }

  assert {
    condition     = contains(output.roles, "opentofu")
    error_message = "Expected opentofu role to be created"
  }
}
