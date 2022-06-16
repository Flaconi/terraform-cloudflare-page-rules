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
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.9.1 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.9.1 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | The Cloudflare API token. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Cloudflare domain to apply rules for. | `string` | n/a | yes |
| <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules) | List of Cloudflare page rule objects. | `list` | `[]` | no |

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
