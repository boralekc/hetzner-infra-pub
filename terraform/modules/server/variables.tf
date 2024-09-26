variable "network_name" {
  description = "The name of the vpc network"
  type        = string
}

variable "zone" {
  description = "Region"
  type        = string
  default     = "dev"
}

variable "server_name" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
}

variable "hcloud_token" {
  description = "API токен для доступа к Hetzner Cloud"
  sensitive   = true
}

variable "os_version" {
  description = "Token"
  type        = string
}

variable "server_type" {
  description = "Token"
  type        = string
}

variable "location" {
  description = "Token"
  type        = string
}

variable "public_key" {
  description = "Token"
  type        = string
}