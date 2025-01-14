resource "cloudflare_zone" "back2base_net_zone" {
  account_id = "3d27ad3320e88bb6b86bd395c30784fd"
  zone       = "back2base.net"
}

resource "cloudflare_zero_trust_access_application" "back2base" {
  zone_id                     = cloudflare_zone.back2base_net_zone.id
  name                        = "Back2Base"
  domain                      = "back2base.net"
  type                        = "self_hosted"
  session_duration            = "24h"
  logo_url                    = ""
  allow_authenticate_via_warp = true
  same_site_cookie_attribute  = "lax"
  skip_interstitial           = true
  policies = [
    cloudflare_zero_trust_access_policy.back2base.id,
  ]
}


resource "cloudflare_zero_trust_access_policy" "back2base" {
  account_id = "3d27ad3320e88bb6b86bd395c30784fd"
  name       = "DefaultPolicy"
  decision   = "allow"
  include { email = "ramseymcgrath@gmail.com" }
  include { group = [
    cloudflare_zero_trust_access_group.default.id,
    "3d27ad3320e88bb6b86bd395c30784fd/82784864-a762-4348-a311-aeb6e9542ff6"
  ] }
  include { any_valid_service_token = true }
}
