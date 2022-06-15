variable "domain" {
  description = "Cloudflare domain to apply rules for."
  type        = string
}

variable "page_rules" {
  description = "Cloudflare page rule configuration list"
  default     = []
}
