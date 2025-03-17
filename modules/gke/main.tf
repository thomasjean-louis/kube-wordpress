resource "google_container_cluster" "primary" {
  name     = "gke-cluster-${var.environment}"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_container_node_pool" "main_nodes" {
  name       = "node-pool-${var.environment}"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    preemptible  = false
  }
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.environment
  }
}
