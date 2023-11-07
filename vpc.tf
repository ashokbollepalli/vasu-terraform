resource "azurerm_virtual_network" "example" {
  name                = var.vpc-name
  resource_group_name = var.rg-name
  location            = "East US 2"
  address_space       = var.vpc-cidr
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet-name
  resource_group_name  = var.rg-name
  virtual_network_name = var.vpc-name
  address_prefixes     = var.subnet-cidr
}