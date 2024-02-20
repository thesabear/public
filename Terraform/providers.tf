terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://host:port/api2/json"
    pm_api_token_secret = "pm_api_token_secret"
    pm_api_token_id = "pm_api_token_id"
}