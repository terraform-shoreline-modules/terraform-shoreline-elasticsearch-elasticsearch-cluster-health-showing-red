terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "elasticsearch_cluster_health_showing_red" {
  source    = "./modules/elasticsearch_cluster_health_showing_red"

  providers = {
    shoreline = shoreline
  }
}