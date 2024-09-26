variable "cluster_name" {
  description = "The name of the postgres cluster "
  type        = string
}

variable "type_cluster" {
  description = "Type of the cluster"
  type        = string
  default     = "dev"
}

variable "version_cluster" {
  description = "Version of the postgre cluster"
  type        = string
}

variable "size_cluster" {
  description = "Size of the cluster"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "name_db_deutschhub" {
  description = "Database name"
  type        = string
}

variable "name_db_deutschlern" {
  description = "Database name"
  type        = string
}

variable "token" {
  description = "Token"
  type        = string
}