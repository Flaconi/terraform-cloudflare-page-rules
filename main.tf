data "cloudflare_zones" "domain" {
  filter {
    name = var.domain
  }
}

resource "cloudflare_page_rule" "page_rules" {
  zone_id  = lookup(data.cloudflare_zones.domain.zones[0], "id")
  for_each = local.page_rules
  target   = each.value["target"]

  priority = lookup(each.value, "priority", null)
  status   = lookup(each.value, "status", null)

  actions {
    always_online            = lookup(each.value["actions"], "always_online", [])
    always_use_https         = lookup(each.value["actions"], "always_use_https", false)
    disable_apps             = lookup(each.value["actions"], "disable_apps", false)
    disable_performance      = lookup(each.value["actions"], "disable_performance", false)
    disable_railgun          = lookup(each.value["actions"], "disable_railgun", false)
    disable_security         = lookup(each.value["actions"], "disable_security", false)
    edge_cache_ttl           = lookup(each.value["actions"], "edge_cache_ttl", [])
    automatic_https_rewrites = lookup(each.value["actions"], "automatic_https_rewrites", [])
    browser_cache_ttl        = lookup(each.value["actions"], "browser_cache_ttl", [])
    browser_check            = lookup(each.value["actions"], "browser_check", [])
    bypass_cache_on_cookie   = lookup(each.value["actions"], "bypass_cache_on_cookie", [])
    cache_on_cookie          = lookup(each.value["actions"], "cache_on_cookie", [])
    cache_by_device_type     = lookup(each.value["actions"], "cache_by_device_type", [])
    cache_deception_armor    = lookup(each.value["actions"], "cache_deception_armor", [])

    dynamic "cache_key_fields" {
      for_each = lookup(each.value["actions"], "cache_key_fields", [])
      content {
        query_string {
          exclude = contains(keys(cache_key_fields.value), "query_string") ? lookup(cache_key_fields.value["query_string"], "exclude", null) : null
          include = contains(keys(cache_key_fields.value), "query_string") ? lookup(cache_key_fields.value["query_string"], "include", null) : null
          ignore  = contains(keys(cache_key_fields.value), "query_string") ? lookup(cache_key_fields.value["query_string"], "ignore", null) : null
        }
        header {
          exclude        = contains(keys(cache_key_fields.value), "header") ? lookup(cache_key_fields.value["header"], "exclude", null) : null
          include        = contains(keys(cache_key_fields.value), "header") ? lookup(cache_key_fields.value["header"], "include", null) : null
          check_presence = contains(keys(cache_key_fields.value), "header") ? lookup(cache_key_fields.value["header"], "check_presence", null) : null
        }
        cookie {
          check_presence = contains(keys(cache_key_fields.value), "cookie") ? lookup(cache_key_fields.value["cookie"], "check_presence", null) : null
          include        = contains(keys(cache_key_fields.value), "cookie") ? lookup(cache_key_fields.value["cookie"], "include", null) : null
        }
        host {
          resolved = contains(keys(cache_key_fields.value), "host") ? lookup(cache_key_fields.value["host"], "resolved", null) : null
        }
        user {
          lang        = contains(keys(cache_key_fields.value), "user") ? lookup(cache_key_fields.value["user"], "lang", null) : null
          device_type = contains(keys(cache_key_fields.value), "user") ? lookup(cache_key_fields.value["user"], "device_type", null) : null
          geo         = contains(keys(cache_key_fields.value), "user") ? lookup(cache_key_fields.value["user"], "geo", null) : null
        }
      }
    }

    cache_level = lookup(each.value["actions"], "cache_level", [])

    dynamic "cache_ttl_by_status" {
      for_each = lookup(each.value["actions"], "cache_ttl_by_status", [])
      content {
        codes = cache_ttl_by_status.value["codes"]
        ttl   = cache_ttl_by_status.value["ttl"]
      }
    }
    email_obfuscation      = lookup(each.value["actions"], "email_obfuscation", [])
    explicit_cache_control = lookup(each.value["actions"], "explicit_cache_control", [])
    dynamic "forwarding_url" {
      for_each = lookup(each.value["actions"], "forwarding_url", [])
      content {
        status_code = forwarding_url.value["status_code"]
        url         = forwarding_url.value["url"]
      }
    }
    host_header_override = lookup(each.value["actions"], "host_header_override", [])
    ip_geolocation       = lookup(each.value["actions"], "ip_geolocation", [])
    dynamic "minify" {
      for_each = lookup(each.value["actions"], "minify", [])
      content {
        html = minify.value["html"]
        css  = minify.value["css"]
        js   = minify.value["js"]
      }
    }
    mirage                      = lookup(each.value["actions"], "mirage", [])
    opportunistic_encryption    = lookup(each.value["actions"], "opportunistic_encryption", [])
    origin_error_page_pass_thru = lookup(each.value["actions"], "origin_error_page_pass_thru", [])
    polish                      = lookup(each.value["actions"], "polish", [])
    resolve_override            = lookup(each.value["actions"], "resolve_override", [])
    respect_strong_etag         = lookup(each.value["actions"], "respect_strong_etag", [])
    response_buffering          = lookup(each.value["actions"], "response_buffering", [])
    rocket_loader               = lookup(each.value["actions"], "rocket_loader", [])
    security_level              = lookup(each.value["actions"], "security_level", [])
    server_side_exclude         = lookup(each.value["actions"], "server_side_exclude", [])
    sort_query_string_for_cache = lookup(each.value["actions"], "sort_query_string_for_cache", [])
    ssl                         = lookup(each.value["actions"], "ssl", [])
    true_client_ip_header       = lookup(each.value["actions"], "true_client_ip_header", [])
    waf                         = lookup(each.value["actions"], "waf", [])
  }
}
