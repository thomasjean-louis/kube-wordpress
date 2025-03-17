variable "project_id" {
  type        = string
}

variable "region" {
  type        = string
  default     = "europe-west1"
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
  default     = "e2-micro"
}
