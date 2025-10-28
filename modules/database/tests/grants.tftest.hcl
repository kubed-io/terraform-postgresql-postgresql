run "db_with_grants" {
  command = plan
  variables {
    name = "db_with_grants"
    grants = [
      {
        role = "foo"
        privileges = ["CONNECTION", "CREATE"]
      }
    ]
  }

  # make sure there is only one grant created
  assert {
    condition = length(postgresql_grant.this) == 1
    error_message = "Expected exactly one postgresql_grant resource to be created"
  }

  # make sure the key of the grant looks right
  assert {
    condition = keys(postgresql_grant.this)[0] == "foo-database"
    error_message = "Expected grant key to be 'foo-database'"
  }

  # the default for the object type should be 'database'
  assert {
    condition = postgresql_grant.this["foo-database"].object_type == "database"
    error_message = "Expected object_type to be 'database'" 
  }
}
