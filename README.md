# Terraform module: Cloudflare Page Rules


[![lint](https://github.com/flaconi/terraform-cloudflare-pagerules/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-cloudflare-pagerules/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-cloudflare-pagerules/workflows/test/badge.svg)](https://github.com/flaconi/terraform-cloudflare-pagerules/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-cloudflare-pagerules.svg)](https://github.com/flaconi/terraform-cloudflare-pagerules/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Priority of rules

This module omits the `priority` key for rulesets and auto-calculates those by the order they appear in the `page_rules` list.


## Example

`terraform.tfvars`:
```hcl
domain = "<domain.tld>"

page_rules = [
  {
    target   = "<target>"
    status   = "disabled"
    actions = {
      forwarding_url = [{
        status_code = "<status_code>"
        url         = "<url>"
      }]
    }
  },
  {
    target   = "<target>"
    actions = {
      always_use_https = "true"
    }
  }
]
```

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.21 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.21 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_api_token"></a> [api\_token](#input\_api\_token)

Description: The Cloudflare API token.

Type: `string`

### <a name="input_domain"></a> [domain](#input\_domain)

Description: Cloudflare domain to apply rules for.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules)

Description: List of Cloudflare page rule objects.

Type:

```hcl
list(object({
    target = string
    status = string
    actions = object({
      always_use_https         = optional(bool)
      disable_apps             = optional(bool)
      disable_performance      = optional(bool)
      disable_railgun          = optional(bool)
      disable_security         = optional(bool)
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
          exclude = optional(list(string))
          include = optional(list(string))
          ignore  = optional(bool)
        })
        header = object({
          exclude        = optional(list(string))
          include        = optional(list(string))
          check_presence = optional(list(string))
        })
        cookie = object({
          include        = optional(list(string))
          check_presence = optional(list(string))
        })
        host = object({
          resolved = string
        })
        user = object({
          lang        = string
          device_type = string
          geo         = string
        })
      })))

      cache_level = optional(string)

      cache_ttl_by_status = optional(list(object({
        codes = string
        ttl   = number
      })))

      email_obfuscation      = optional(string)
      explicit_cache_control = optional(string)

      forwarding_url = optional(list(object({
        status_code = string
        url         = string
      })))

      host_header_override = optional(string)
      ip_geolocation       = optional(string)

      minify = optional(list(object({
        html = string
        css  = string
        js   = string
      })))

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
```

Default: `[]`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | Current zone information. |
| <a name="output_page_rules"></a> [page\_rules](#output\_page\_rules) | Created Cloudflare page rules for the current zone. |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**
