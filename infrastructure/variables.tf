variable "cloudflare_api_token" {
  description = "API token for Cloudflare" 
  type = string
}

variable "datadog_api_key" {
  description = "API key for Datadog"
  type = string
}

variable "datadog_app_key" {
  description = "App key for Datadog"
  type = string
}

variable "auth0_domain" {
  description = "Domain for Auth0"
  type = string
}

variable "auth0_client_id" {
  description = "Client ID for Auth0"
  type = string
}

variable "auth0_client_secret" {
  description = "Client secret for Auth0"
  type = string
}

variable "ionoscloud_token" {
  description = "Token for Ionos Cloud"
  type = string
}
