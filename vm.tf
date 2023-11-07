 
resource "azurerm_public_ip" "example" {
  name                = var.public-ip-name
  location            = "East US 2"
  resource_group_name = var.rg-name
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "example" {
  name                = var.nic-name
  location            = azurerm_resource_group.example.location
  resource_group_name = var.rg-name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_virtual_machine" "example" {
  # for_each              = each.servers
  name                  = var.vm-name
  location              = azurerm_resource_group.example.location
  resource_group_name   = var.rg-name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = var.test? "Standard_B2s" : "Standard_DS1_v2"

  # admin_ssh_key {
  #   username   = "ashok"                  
  #   public_key = file("$(path.module)/terraform-azure.pub")
  # }

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.7"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = 30
  }

  os_profile {
    computer_name  = "vasu"
    admin_username = "vasuperni"
    admin_password = "Vasuperni@1997"
  }

  os_profile_linux_config {
    disable_password_authentication = false
    # ssh_keys {
    #   path     = "~/vpc/practice/"
    #   key_data = file("~/vpc/practice/.ssh/terraform-azure.pub")  # Path to your public SSH key
    # }
  }
  
  
  
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsg-name
  location            = azurerm_resource_group.example.location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

