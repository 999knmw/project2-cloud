resource "azurerm_resource_group" "rg" {
  name     = "${var.team_name}-rg"
  location = var.location
  tags = {
    Project     = "CloudProject2"
    Environment = "Production"
    Team        = var.team_name
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.team_name}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags = { Project = "CloudProject2" }
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "vm_public_ip" {
  name                = "${var.team_name}-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = { Project = "CloudProject2" }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.team_name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = ["0.0.0.0/0"]
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefixes    = ["0.0.0.0/0"]
    destination_address_prefix = "*"
  }
  tags = { Project = "CloudProject2" }
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.team_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
  tags = { Project = "CloudProject2" }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "${var.team_name}-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.vm_size
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    Project     = "CloudProject2"
    Environment = "Production"
    OS          = "Ubuntu"
  }
}

resource "azurerm_virtual_machine_extension" "docker_setup" {
  name                 = "docker-install"
  virtual_machine_id   = azurerm_linux_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROTECTED_SETTINGS
  {
    "commandToExecute": "bash -c 'curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh && sudo docker run -d --restart always -p 80:80 ${var.docker_image}'"
  }
  PROTECTED_SETTINGS

  depends_on = [azurerm_linux_virtual_machine.vm]
}