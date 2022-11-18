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

provider "gitlab" {
    token = var.gitlab_password
}

module "gitlab_kubernetes_agent_registration" {
  source = "gitlab.com/gitlab-org/kubernetes-agent-terraform-register-agent/local"
  version = "0.0.2"

  gitlab_project_id = var.gitlab_project_id
  gitlab_username = var.gitlab_username
  gitlab_password = var.gitlab_password
  gitlab_graphql_api_url = var.gitlab_graphql_api_url
  agent_name = var.agent_name
  token_name = var.token_name
  token_description = var.token_description
}