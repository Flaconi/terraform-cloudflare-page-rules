output "domain" {
  description = "Current zone information."
  value       = data.cloudflare_zones.domain
}

output "page_rules" {
  description = "Created Cloudflare page rules for the current zone."
  value       = cloudflare_page_rule.page_rules
}
