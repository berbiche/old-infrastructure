variable "cloudflare_email" {}
variable "cloudflare_api_token" {}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}
