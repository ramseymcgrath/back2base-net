terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.0.0"
    }
    datadog = {
      source = "DataDog/datadog"
    }
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.0.0" # Refer to docs for latest version
    }
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
    }
  }
  cloud {
    organization = "RamseyMcGrath"
    hostname     = "app.terraform.io"

    workspaces {
      name = "back2base-net"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

provider "auth0" {
  domain        = var.auth0_domain
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
}

provider "ionoscloud" {
  token = var.ionoscloud_token
}
