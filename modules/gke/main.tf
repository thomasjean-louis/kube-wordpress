resource "google_container_cluster" "primary" {
  name     = "gke-cluster-${var.environment}"
  location = var.region
  node_locations = ["us-east1-b", "us-east1-c", "us-east1-d"]

  remove_default_node_pool = true
  initial_node_count       = 1

  node_config {
    disk_size_gb = var.node_disk_size_gb
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_container_node_pool" "main_nodes" {
  name       = "node-pool-${var.environment}"
  location           = google_container_cluster.primary.location
  cluster    = google_container_cluster.primary.name
  node_locations     = [var.zone]
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    preemptible  = false
    disk_type = "pd-standard"  # Use HDD instead of SSD
    disk_size_gb = var.node_disk_size_gb 
  }
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.environment
  }
}
