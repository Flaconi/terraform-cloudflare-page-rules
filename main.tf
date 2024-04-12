resource "cloudflare_page_rule" "page_rules" {
  zone_id  = lookup(data.cloudflare_zones.domain.zones[0], "id")
  for_each = local.page_rules
  target   = each.value["target"]

  priority = each.value["priority"]
  status   = each.value["status"]

  actions {
    always_use_https         = each.value["actions"]["always_use_https"]
    disable_apps             = each.value["actions"]["disable_apps"]
    disable_performance      = each.value["actions"]["disable_performance"]
    disable_railgun          = each.value["actions"]["disable_railgun"]
    disable_security         = each.value["actions"]["disable_security"]
    disable_zaraz            = each.value["actions"]["disable_zaraz"]
    edge_cache_ttl           = each.value["actions"]["edge_cache_ttl"]
    automatic_https_rewrites = each.value["actions"]["automatic_https_rewrites"]
    browser_cache_ttl        = each.value["actions"]["browser_cache_ttl"]
    browser_check            = each.value["actions"]["browser_check"]
    bypass_cache_on_cookie   = each.value["actions"]["bypass_cache_on_cookie"]
    cache_on_cookie          = each.value["actions"]["cache_on_cookie"]
    cache_by_device_type     = each.value["actions"]["cache_by_device_type"]
    cache_deception_armor    = each.value["actions"]["cache_deception_armor"]

    dynamic "cache_key_fields" {
      for_each = each.value["actions"]["cache_key_fields"]
      content {
        query_string {
          exclude = cache_key_fields.value["query_string"]["exclude"]
          include = cache_key_fields.value["query_string"]["include"]
          ignore  = cache_key_fields.value["query_string"]["ignore"]
        }
        header {
          exclude        = cache_key_fields.value["header"]["exclude"]
          include        = cache_key_fields.value["header"]["include"]
          check_presence = cache_key_fields.value["header"]["check_presence"]
        }
        cookie {
          check_presence = cache_key_fields.value["cookie"]["check_presence"]
          include        = cache_key_fields.value["cookie"]["include"]
        }
        host {
          resolved = cache_key_fields.value["host"]["resolved"]
        }
        user {
          lang        = cache_key_fields.value["user"]["lang"]
          device_type = cache_key_fields.value["user"]["device_type"]
          geo         = cache_key_fields.value["user"]["geo"]
        }
      }
    }

    cache_level = each.value["actions"]["cache_level"]

    dynamic "cache_ttl_by_status" {
      for_each = each.value["actions"]["cache_ttl_by_status"]
      content {
        codes = cache_ttl_by_status.value["codes"]
        ttl   = cache_ttl_by_status.value["ttl"]
      }
    }
    email_obfuscation      = each.value["actions"]["email_obfuscation"]
    explicit_cache_control = each.value["actions"]["explicit_cache_control"]
    dynamic "forwarding_url" {
      for_each = each.value["actions"]["forwarding_url"]
      content {
        status_code = forwarding_url.value["status_code"]
        url         = forwarding_url.value["url"]
      }
    }
    host_header_override = each.value["actions"]["host_header_override"]
    ip_geolocation       = each.value["actions"]["ip_geolocation"]
    dynamic "minify" {
      for_each = each.value["actions"]["minify"]
      content {
        html = minify.value["html"]
        css  = minify.value["css"]
        js   = minify.value["js"]
      }
    }
    mirage                      = each.value["actions"]["mirage"]
    opportunistic_encryption    = each.value["actions"]["opportunistic_encryption"]
    origin_error_page_pass_thru = each.value["actions"]["origin_error_page_pass_thru"]
    polish                      = each.value["actions"]["polish"]
    resolve_override            = each.value["actions"]["resolve_override"]
    respect_strong_etag         = each.value["actions"]["respect_strong_etag"]
    response_buffering          = each.value["actions"]["response_buffering"]
    rocket_loader               = each.value["actions"]["rocket_loader"]
    security_level              = each.value["actions"]["security_level"]
    server_side_exclude         = each.value["actions"]["server_side_exclude"]
    sort_query_string_for_cache = each.value["actions"]["sort_query_string_for_cache"]
    ssl                         = each.value["actions"]["ssl"]
    true_client_ip_header       = each.value["actions"]["true_client_ip_header"]
    waf                         = each.value["actions"]["waf"]
  }
}
