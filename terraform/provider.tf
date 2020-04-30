provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_token
}

provider "digitalocean" {
  version = "~> 1.17"
  token   = var.digitalocean_api_token
}
