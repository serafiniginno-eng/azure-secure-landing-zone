# Creamos el Grupo de Seguridad de Red (NSG)
resource "azurerm_network_security_group" "spoke_nsg" {
  name                = "nsg-secure-workload"
  location            = azurerm_resource_group.main_rg.location
  resource_group_name = azurerm_resource_group.main_rg.name

  # Regla 1: Denegar todo el tráfico entrante desde Internet (Zero Trust)
  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  # Regla 2: Permitir solo tráfico interno seguro
  security_rule {
    name                       = "AllowInternalOnly"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
}
