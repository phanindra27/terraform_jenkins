module "resource-group" {
  source = "../../../_modules/resource_group_new"
  #source = "git::https://pv801h@codecloud.web.att.com/scm/~pv801h/cdoazureinfra.git//_modules-V12/resource_group_new/?ref=pv801h"
  location = var.location
  tags     = var.tags
  app_acronym = var.app_acronym
  app_purpose = var.app_purpose
  env = var.env
}