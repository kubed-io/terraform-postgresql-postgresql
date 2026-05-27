module "server" {
  source = "../../modules/server"

  roles = [
    # static admin role
    {
      name = "opentofu"
      privileges = {
        login     = true
        superuser = true
      }
    },
    # login roles for LDAP identities
    { name = "drupal" },
    { name = "n8n" },
  ]
}
