module "server" {
  source       = "./modules/server"
  network_name = "k3s-network"
  zone         = "eu-central"
  server_name  = "k3s"
  server_type  = "cx32"
  os_version   = "ubuntu-24.04"
  location     = "nbg1"
  public_key   = var.PUBLIC_KEY
  hcloud_token = var.HCLOUD_TOKEN
}

# module "database" {
#   source              = "./modules/postgres"
#   cluster_name        = "postgres-cluster"
#   type_cluster        = "pg"
#   version_cluster     = "16"
#   size_cluster        = "db-s-1vcpu-1gb"
#   region              = "fra1"
#   name_db_deutschhub  = var.DB_DEUTSCHHUB
#   name_db_deutschlern = var.DB_DEUTSCHLERN
#   token         = var.TOKEN
# }