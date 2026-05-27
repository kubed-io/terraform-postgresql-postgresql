module "database" {
  source = "../../modules/database"

  name  = "drupal"
  owner = "drupal"
  schemas = [
    {
      name = "drupal"
    }
  ]
  grants = [
    {
      role       = "drupal"
      privileges = ["CONNECT", "CREATE"]
    }
  ]
}
