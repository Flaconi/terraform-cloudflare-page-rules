variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}
variable "domain" {
  description = "Cloudflare domain to apply rules for."
  type        = string
}
variable "page_rules" {
  description = "List of Cloudflare page rule objects."
  type = list(object({
    target = string
    status = optional(string, "active")
    actions = object({
      always_use_https         = optional(bool, false)
      disable_apps             = optional(bool, false)
      disable_performance      = optional(bool, false)
      disable_railgun          = optional(bool, false)
      disable_security         = optional(bool, false)
      disable_zaraz            = optional(bool, false)
      edge_cache_ttl           = optional(number)
      automatic_https_rewrites = optional(string)
      browser_cache_ttl        = optional(number)
      browser_check            = optional(string)
      bypass_cache_on_cookie   = optional(string)
      cache_on_cookie          = optional(string)
      cache_by_device_type     = optional(string)
      cache_deception_armor    = optional(string)

      cache_key_fields = optional(list(object({
        query_string = object({
          exclude = optional(list(string), [])
          include = optional(list(string), [])
          ignore  = optional(bool, false)
        })
        header = object({
          exclude        = optional(list(string), [])
          include        = optional(list(string), [])
          check_presence = optional(list(string), [])
        })
        cookie = object({
          include        = optional(list(string), [])
          check_presence = optional(list(string), [])
        })
        host = object({
          resolved = optional(bool, false)
        })
        user = object({
          lang        = optional(bool, false)
          device_type = optional(bool, false)
          geo         = optional(bool, false)
        })
      })), [])

      cache_level = optional(string)

      cache_ttl_by_status = optional(list(object({
        codes = string
        ttl   = number
      })), [])

      email_obfuscation      = optional(string)
      explicit_cache_control = optional(string)

      forwarding_url = optional(list(object({
        status_code = string
        url         = string
      })), [])

      host_header_override = optional(string)
      ip_geolocation       = optional(string)

      minify = optional(list(object({
        html = string
        css  = string
        js   = string
      })), [])

      mirage                      = optional(string)
      opportunistic_encryption    = optional(string)
      origin_error_page_pass_thru = optional(string)
      polish                      = optional(string)
      resolve_override            = optional(string)
      respect_strong_etag         = optional(string)
      response_buffering          = optional(string)
      rocket_loader               = optional(string)
      security_level              = optional(string)
      server_side_exclude         = optional(string)
      sort_query_string_for_cache = optional(string)
      ssl                         = optional(string)
      true_client_ip_header       = optional(string)
      waf                         = optional(string)
    })
  }))
  default = []
}
