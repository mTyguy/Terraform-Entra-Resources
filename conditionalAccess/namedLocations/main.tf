# version 0.1  #

###

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

resource "azuread_named_location" "Philippines" {
  display_name = "Philippines Named Location"
  country {
    countries_and_regions = [
      "PH"
    ]
    country_lookup_method                 = "clientIpAddress"
    include_unknown_countries_and_regions = false
  }
}

resource "azuread_named_location" "BritishIsles" {
  display_name = "British Isles Named Location"
  country {
    countries_and_regions = [
      "GB",
      "IE"
    ]
    country_lookup_method                 = "clientIpAddress"
    include_unknown_countries_and_regions = false
  }
}
