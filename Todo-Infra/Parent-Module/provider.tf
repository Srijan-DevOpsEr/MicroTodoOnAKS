terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg-test-backend-config"
    storage_account_name = "strgtestbackendconfig"
    container_name = "containertestbackendconfig"
    key = "key1.tfstate"
    
  }
}

provider "azurerm" {
features {}
subscription_id = "cc39b8c9-7cc9-49d0-98c3-2a043fb93dac"
}