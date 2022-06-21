# https://github.com/cloudflare/terraform-provider-cloudflare
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.17.0"
    }
  }
  required_version = "~> 1.0"
}
