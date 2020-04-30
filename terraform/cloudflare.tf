resource "cloudflare_zone" "qt_rs" {
  zone = "qt.rs"
  plan = "free"
  type = "full"
}

# resource "cloudflare_zone_settings_override" "qt_rs_settings" {
#   zone_id = cloudflare_zone.qt_rs.id
#   settings {
#     always_online    = "on"
#     browser_check    = "off"
#     development_mode = "off"
#     #http2            = "on"
#     http3            = "on"
#     ipv6             = "on"
#     tls_1_3          = "on"
#     security_level   = "essentially_off"
#   }
# }

resource "cloudflare_record" "qt_rs_ipv4" {
  zone_id = cloudflare_zone.qt_rs.id
  type    = "A"
  value   = "178.128.233.67"
  name    = "qt.rs."
  proxied = false
}

resource "cloudflare_record" "dozer_ipv4" {
  zone_id = cloudflare_zone.qt_rs.id
  type    = "A"
  value   = "178.128.233.67"
  name    = "dozer.qt.rs."
  proxied = false
}

resource "cloudflare_record" "dozer_ipv6" {
  zone_id = cloudflare_zone.qt_rs.id
  type    = "AAAA"
  value   = "2604:a880:cad:d0::c8c:c001"
  name    = "dozer.qt.rs."
  proxied = false
}

resource "cloudflare_record" "qt_rs_ipv6" {
  zone_id = cloudflare_zone.qt_rs.id
  type    = "AAAA"
  value   = "2604:a880:cad:d0::c8c:c001"
  name    = "qt.rs."
  proxied = false
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.qt_rs.id
  type    = "CNAME"
  name    = "www"
  value   = "qt.rs."
  proxied = false
}
