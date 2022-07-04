# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.17"
    }
  }
  required_version = "~> 1.0"
  experiments      = [module_variable_optional_attrs]
}
