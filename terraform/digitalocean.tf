# data "digitalocean_droplet" "dozer" {
#   name = "dozer.qt.rs"
# }

locals {
  all_ips = ["0.0.0.0/0", "::/0"]
}

resource "digitalocean_ssh_key" "default" {
  name       = "Automation key"
  public_key = file(pathexpand("~/.ssh/automation.pub"))
}

resource "digitalocean_droplet" "dozer" {
  #image       = "debian-10-x64"
  image       = "43710584" # debian-9-x64
  name        = "dozer.qt.rs"
  region      = "tor1"
  size        = "s-1vcpu-1gb"
  ssh_keys    = [digitalocean_ssh_key.default.id]
  monitoring  = true
  ipv6        = true
  resize_disk = false
  backups     = false
  tags        = ["proxy"]
}

#resource "digitalocean_droplet_snapshot" "dozer-snapshot" {
#  droplet_id = digitalocean_droplet.dozer.id
#  name       = ""
#}

resource "digitalocean_firewall" "default" {
  name        = "allow-all-outgoing-and-ingoing-icmp"
  droplet_ids = [digitalocean_droplet.dozer.id]

  inbound_rule {
    protocol         = "icmp"
    source_addresses = local.all_ips
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = local.all_ips
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = local.all_ips
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = local.all_ips
  }
}

resource "digitalocean_firewall" "ssh" {
  name        = "ssh"
  droplet_ids = [digitalocean_droplet.dozer.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = local.all_ips
  }
}

resource "digitalocean_firewall" "wireguard" {
  name        = "wireguard"
  droplet_ids = [digitalocean_droplet.dozer.id]

  inbound_rule {
    protocol         = "udp"
    port_range       = "51820"
    source_addresses = local.all_ips
  }
}
