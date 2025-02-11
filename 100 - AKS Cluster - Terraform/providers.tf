terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "3.74.0"
        }
    }
    backend "azurerm" {
    resource_group_name  = "rg-learn-k8s"
    storage_account_name = "tfk8sstate"
    container_name       = "tfstate"
    key                  = "k8s/terraform.tfstate"
    }
}

provider "azurerm" {
  features {
  }
  skip_provider_registration = true 
}
