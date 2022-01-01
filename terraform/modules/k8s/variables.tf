variable "client_id" {}
variable "client_secret" {}
variable "resource_group_name" {}
variable "location" {}

variable "agent_count" {
  default = 1
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "aks"
}

variable "cluster_name" {
  default = "test"
}
