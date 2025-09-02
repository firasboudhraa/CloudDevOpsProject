resource "azurerm_resource_group" "this" {
  name     = var.project_name
  location = var.location
}


resource "azurerm_virtual_network" "this" {
  name                = "${var.project_name}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  tags = {
    Project = var.project_name
  }
}

resource "azurerm_subnet" "public" {
  name                 = "${var.project_name}-subnet-public"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.public_subnet_cidr]
}

resource "azurerm_subnet" "private" {
  name                 = "${var.project_name}-subnet-private"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.private_subnet_cidr]
}

resource "azurerm_network_security_group" "this" {
  name                = "${var.project_name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    security_rule {
    name                       = "AllowJenkins"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

   security_rule {
    name                       = "AllowSonarQube"
    priority                   = 111
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowGrafana"
    priority                   = 112
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "30001"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPrometheus"
    priority                   = 113
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "30002"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Project = var.project_name
  }
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.this.id
}
