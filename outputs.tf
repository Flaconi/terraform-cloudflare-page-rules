output "domain" {
  description = "Current zone information."
  value       = data.cloudflare_zones.this.result[0]
}

output "page_rules" {
  description = "Created Cloudflare page rules for the current zone."
  value       = cloudflare_page_rule.this
}
