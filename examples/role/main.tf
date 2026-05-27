module "role" {
  source = "../../modules/role"

  name = "drupal"
  privileges = {
    login = true
  }
}
