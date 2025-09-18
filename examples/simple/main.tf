provider "cloudflare" {
  api_token = var.api_token
}

module "example" {
  source = "./../../"
  domain = var.domain
  page_rules = [
    {
      target = "<target>"
      status = "disabled"
      actions = {
        forwarding_url = [{
          status_code = "301"
          url         = "some.example.com"
        }]
      }
    },
    {
      target = "<target>"
      actions = {
        always_use_https = "true"
      }
    }
  ]
}
