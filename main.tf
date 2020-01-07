module "resource-group" {
  
  source = "git::https://github.com/phanindra27/terrraform-modules.git"
  location = var.location
  tags     = var.tags
  app_acronym = var.app_acronym
  app_purpose = var.app_purpose
  env = var.env
}
