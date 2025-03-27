terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.98.0" # Use the latest stable version
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true # Optional, if provider registration fails
}