terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "k3s" {
  name       = "SSH for server"
  public_key = var.public_key
}

resource "hcloud_network" "network" {
  name     = var.network_name
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "network-subnet" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = var.zone
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_server" "server" {
  name        = var.server_name
  server_type = var.server_type
  image       = var.os_version
  location    = var.location

  ssh_keys = [hcloud_ssh_key.k3s.id]

  network {
    network_id = hcloud_network.network.id
    ip         = "10.0.1.5"
    alias_ips  = [
      "10.0.1.6",
      "10.0.1.7"
    ]
  }

  depends_on = [
    hcloud_network_subnet.network-subnet
  ]
}