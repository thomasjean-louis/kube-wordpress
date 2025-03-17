module "gke" {
  source            = "./modules/gke"
  project_id        = var.project_id
  region            = var.region
  environment       = var.environment
  node_count        = var.node_count
  node_machine_type = var.node_machine_type
}