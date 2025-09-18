resource "cloudflare_page_rule" "this" {
  zone_id  = local.zone_id
  for_each = local.page_rules
  target   = each.value["target"]

  priority = each.value["priority"]
  status   = each.value["status"]
  actions  = each.value["actions"]
}
