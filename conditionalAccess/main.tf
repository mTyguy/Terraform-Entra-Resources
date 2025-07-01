# version 0.1  #

####

provider "azuread" {
  tenant_id = var.tenant_id
}

###

resource "azuread_conditional_access_policy" "MFA_All_Users" {
  display_name = "MFA All Users (custom)"
  state        = "enabled"

  conditions {
    client_app_types = [
      "all",
    ]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []

    applications {
      excluded_applications = []
      included_applications = [
        "All"
      ]
    }

    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users = [
        "570fa922-b90b-4b02-a0f3-4276dcd516b4",
      ]
      included_groups = []
      included_roles  = []
      included_users = [
        "All",
      ]
    }
  }

  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls = [
      "mfa",
    ]
    custom_authentication_factors = []
    operator                      = "OR"
    terms_of_use                  = []
  }

}

#

resource "azuread_conditional_access_policy" "Passkey_Auth_Policy" {
  display_name = "Passkey Auth Policy (custom)"
  state        = "enabled"

  conditions {
    client_app_types = [
      "all",
    ]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []

    applications {
      excluded_applications = []
      included_applications = [
        "All",
      ]
      #      included_user_actions = []
    }

    platforms {
      excluded_platforms = [
        "linux",
      ]
      included_platforms = [
        "all",
      ]
    }

    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users  = []
      included_groups = []
      included_roles  = []
      included_users = [
        "570fa922-b90b-4b02-a0f3-4276dcd516b4",
      ]
    }
  }

  grant_controls {
    authentication_strength_policy_id = "/policies/authenticationStrengthPolicies/00000000-0000-0000-0000-000000000004"
    built_in_controls                 = []
    custom_authentication_factors     = []
    operator                          = "OR"
    terms_of_use                      = []
  }
}

###

#named location based CAs

#Block Non-Philippines logins by Philippines users
resource "azuread_conditional_access_policy" "Restrict_Philippines_Users" {
  display_name = "Restrict Philippines Users (custom)"
  state        = "enabled"

  conditions {
    client_app_types = [
      "all",
    ]
    insider_risk_levels           = null
    service_principal_risk_levels = []
    sign_in_risk_levels           = []
    user_risk_levels              = []

    applications {
      excluded_applications = []
      included_applications = [
        "All"
      ]
    }

    locations {
      excluded_locations = ["1a17a23b-992a-4aa2-93c1-524471daa902"]
      included_locations = ["All"]
    }

    users {
      excluded_groups = []
      excluded_roles  = []
      excluded_users = []
      included_groups = [
        "4f6851b7-5cef-41c7-ab00-2d9b1a876190", #Philippines Users Group
      ]
      included_roles = []
      included_users = []
    }
  }

  grant_controls {
    authentication_strength_policy_id = null
    built_in_controls = [
      "block",
    ]
    operator     = "OR"
    terms_of_use = []
  }
}
