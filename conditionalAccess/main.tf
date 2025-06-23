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
