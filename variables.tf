variable "api_token" {
  description = "The Cloudflare API token."
  type        = string
}
variable "domain" {
  description = "Cloudflare domain to apply rules for."
  type        = string
}
variable "page_rules" {
  description = "List of Cloudflare page rule objects."
  type = list(object({
    target      = string
    status      = bool
    action      = list(string)
  }))
  default = []
}
