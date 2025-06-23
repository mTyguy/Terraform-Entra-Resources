terraform {
  required_version = ">= 1.12"
}

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>3.4"
    }
  }
}
