locals {
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
      # priority = idx + 1
      priority = length(var.page_rules) - idx
    }
    )
  }
}
