terraform {
  required_version = "~> 1.5.0"

  required_providers {
    /*
      API provisioning support for Proxmox
      see
        - https://registry.terraform.io/providers/Telmate/proxmox/latest
    */
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }

    /*
      Convert a butane configuration to an ignition JSON configuration

      WARNING: The current flatcar stable release requires ignition v3.3.0 configurations, which
      are supported by the v0.12 provider. The v0.13 CT provider generated v3.4.0 ignition
      configurations which are not supported with Flatcar v3510.2.6. This is all clearly documented in
      the git [README.md](https://github.com/poseidon/terraform-provider-ct)

      see
        - https://github.com/poseidon/terraform-provider-ct
        - https://registry.terraform.io/providers/poseidon/ct/latest
        - https://registry.terraform.io/providers/poseidon/ct/latest/docs
        - https://www.flatcar.org/docs/latest/provisioning/config-transpiler/
    */
    ct = {
      source  = "poseidon/ct"
      version = "0.12.0"
    }

    /*
      see
        - https://registry.terraform.io/providers/hashicorp/null
    */
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_tls_insecure = var.pm_tls_insecure

  pm_user             = var.pm_user
  pm_password         = var.pm_password
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
}