# terraform-module-template
Template for Terraform modules

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | n/a |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Cloudflare domain to apply rules for. | `string` | n/a | yes |
| <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules) | Cloudflare page rule configuration list | `list` | `[]` | no |

## Optional Inputs

No optional inputs.

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | Current zone information. |
| <a name="output_rules"></a> [rules](#output\_rules) | Created Cloudflare page rules for the current zone. |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**
