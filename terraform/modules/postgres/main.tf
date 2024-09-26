terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.token
}

resource "digitalocean_database_cluster" "postgres-example" {
  name       = var.cluster_name
  engine     = var.type_cluster
  version    = var.version_cluster
  size       = var.size_cluster
  region     = var.region
  node_count = 1
}

# Создание баз данных в кластере
resource "digitalocean_database_db" "database-deutschhub" {
  cluster_id = digitalocean_database_cluster.postgres-example.id
  name       = var.name_db_deutschhub
}

resource "digitalocean_database_db" "database-deutschlern" {
  cluster_id = digitalocean_database_cluster.postgres-example.id
  name       = var.name_db_deutschlern
}
