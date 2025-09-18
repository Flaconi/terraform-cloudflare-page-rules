locals {
  zone_id = lookup(data.cloudflare_zones.this.result[0], "id")
  #   page_rules = [
  #     {
  #       target   = "<target>"
  #       status   = "<status>"
  #       actions = {
  #         forwarding_url = [{
  #           status_code = "<status_code>"
  #           url         = "<url>"
  #         }]
  #       }
  #     },
  #     {
  #       target   = "<target>"
  #       status   = "<status>"
  #       actions = {
  #         always_use_https = "<always_use_https>"
  #       }
  #     }
  #   ]
  page_rules = { for idx, item in var.page_rules : item["target"] => merge(
    item,
    {
      priority = length(var.page_rules) - idx
    }
    )
  }
}
