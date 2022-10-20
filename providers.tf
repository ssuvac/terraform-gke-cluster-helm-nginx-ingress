provider "google" {
    credentials = file(var.gcp_credentials)
    project = var.gcp_project_id
    region = var.gcp_region 
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

###############################################################################
data "google_client_config" "provider" {}

provider "helm" {
  kubernetes {
    host = module.gke.endpoint
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
    token = data.google_client_config.provider.access_token

  }
}
