run "empty_roles" {
  command = plan
  variables {
    roles = []
  }

  assert {
    condition     = length(output.roles) == 0
    error_message = "Expected no roles to be created"
  }
}

run "single_role" {
  command = plan
  variables {
    roles = [{ name = "drupal" }]
  }

  assert {
    condition     = output.roles == ["drupal"]
    error_message = "Expected a single drupal role"
  }
}
