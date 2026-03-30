# Configuración del Proveedor
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Recurso principal usando tus variables
resource "azurerm_resource_group" "main_rg" {
  name     = "rg-secure-landing-zone"
  location = var.location
}

# Redes que definiste en tu esquema
resource "azurerm_virtual_network" "hub_vnet" {
  name                = "vnet-hub"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name
  address_space       = var.hub_prefix
}
