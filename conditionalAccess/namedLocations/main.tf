# version 0.1  #

####

provider "azuread" {
  tenant_id = var.tenant_id
}

###

resource "azuread_named_location" "UnitedStates" {
  display_name = "United States Named Location"
  country {
    countries_and_regions = [
      "US"
    ]
    country_lookup_method                 = "clientIpAddress"
    include_unknown_countries_and_regions = false
  }
}
