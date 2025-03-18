variable "project_id" {
  type        = string
}

variable "region" {
  type        = string
  default     = "us-east1"
}

variable "zone" {
  type        = string
  default     = "us-east1-a"
}

variable "environment" {
  description = "Environment name (admin, dev, prod)"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the cluster"
  type        = number
  default     = 1
}

variable "node_machine_type" {
  description = "Machin type for the node"
  type        = string
}

variable "node_disk_size_gb" {
  type = number
  default = 50
}
