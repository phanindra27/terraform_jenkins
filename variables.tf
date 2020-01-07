/*Tags must use lowercase only.
  Tags must use the " + " sign with spaces before and after as a delimiter between attributes inside the same tag.*/



variable location {
  default = ""
  description = "Region in which we deploy resources"
}

variable tags {
description = "A map of tags to add to the resource"
default = {}
}

variable app_acronym {
  default = ""
  description = "Acronym for the project or app"
}

variable env {
  default = "Acronym for environment"
  description = "Acronym for environment"
}

variable app_purpose {
  default = ""
  description = "Puropse of the app"
}