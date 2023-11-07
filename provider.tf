terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.79.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  # region  = "East US 2"

}

terraform {
  backend "azurerm" {
    resource_group_name  = "testing"
    storage_account_name = "testingvasanthi"
    container_name       = "testingcontainer"
    key                  = "terraform.tfstate"
    subscription_id = "8c75f483-a30c-4ca7-bbb2-7ff7d1f66fbc"
  }
}

  