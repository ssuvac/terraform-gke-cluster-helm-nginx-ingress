variable "gcp_credentials" {
    type = string 
    description = "Location of service account for GCP"
}

variable "gcp_project_id" {
    type = string
    description = "GCP project ID"
}

variable "gcp_region" {
    type = string
    description = "GCP Region"
  
}

variable "gke_cluster_name" {
    type = string
    description = "GKE cluster name"
  
}

variable "gke_zones" {
    type = list(string)
    description = "List of GKE zones"
  
}

variable "gke_regional" {
    type = bool
    description = "Regional cluster = False"
  
}

variable "gke_network" {
    type = string
    description = "VPC network name" 
}

variable "gke_subnetwork" {
    type = string
    description = "VPC subnetwork name" 
  
}

variable "gke_default_nodepool_name" {
    type = string
    description = "Default nodepool name"
  
}

variable "gke_service_account_name" {
    type = string
    description = "GKE service acccount name"
  
}



##########################################################################
variable "helm_release" {
  default     = "kube-prometheus-stack"
  description = "The name of the Helm release"
}


variable "helm_repository" {
  default     = "https://prometheus-community.github.io/helm-charts"
  description = "The repository where the Helm chart is stored"
}

variable "namespace" {
    type = string
    default = "monitoring"
  
}


#########################################################################
variable "gitlab_project_id" {
  type = string
}

variable "gitlab_username" {
  type = string
}

variable "gitlab_password" {
  type = string
}

variable "agent_name" {
  type = string
}

variable "token_name" {
  type    = string
  default = "kas-token"
}

variable "token_description" {
  type    = string
  default = "Token for KAS Agent Authentication"
}

variable "gitlab_graphql_api_url" {
  type    = string
  default = "https://gitlab.com/api/graphql"
}