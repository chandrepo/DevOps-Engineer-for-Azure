provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "webserver_rg" {
  name     = "${var.prefix}-rg"
  location = var.location
}


resource "azurerm_virtual_network" "webserver_vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name
  tags = {
    WebServer = "development"
  }
}

resource "azurerm_subnet" "webserver_subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.webserver_rg.name
  virtual_network_name = azurerm_virtual_network.webserver_vnet.name 
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_public_ip" "webserver_publicip" {
  name                = "${var.prefix}-publicip"
  resource_group_name = azurerm_resource_group.webserver_rg.name
  location            = azurerm_resource_group.webserver_rg.location
  allocation_method   = "Static"
  tags = {
    WebServer = "development"
  }
}

resource "azurerm_network_interface" "webserver_nic" {
  count               = var.instance_count
  name                = "${var.prefix}-nic${count.index}"
  resource_group_name = azurerm_resource_group.webserver_rg.name
  location            = azurerm_resource_group.webserver_rg.location

  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.webserver_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    WebServer = "development"
  }
}

resource "azurerm_availability_set" "webserver_avset" {
  name                         = "${var.prefix}-avset"
  location                     = azurerm_resource_group.webserver_rg.location
  resource_group_name          = azurerm_resource_group.webserver_rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags = {
    WebServer = "development"
  }
}

resource "azurerm_network_security_group" "webserver_nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "nginxport"
    priority                   = 100
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    destination_address_prefix = "VirtualNetwork"
  }
  tags = {
    WebServer = "development"
  }
}


resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.webserver_subnet.id
  network_security_group_id = azurerm_network_security_group.webserver_nsg.id
}
resource "azurerm_lb" "webserver_lb" {
  name                = "${var.prefix}-lb"
  sku                 = "Basic"
  location            = azurerm_resource_group.webserver_rg.location
  resource_group_name = azurerm_resource_group.webserver_rg.name

  frontend_ip_configuration {
    name                 = "WebserverPublicIP"
    public_ip_address_id = azurerm_public_ip.webserver_publicip.id
  }
  tags = {
    WebServer = "development"
  }
}

resource "azurerm_lb_backend_address_pool" "webserver_backendpool" {
  resource_group_name = azurerm_resource_group.webserver_rg.name
  loadbalancer_id     = azurerm_lb.webserver_lb.id
  name                = "${var.prefix}-backendpool"
}

resource "azurerm_lb_rule" "webserver_lbrule" {
  resource_group_name            = azurerm_resource_group.webserver_rg.name
  loadbalancer_id                = azurerm_lb.webserver_lb.id
  name                           = "${var.prefix}-lbrule"
  protocol                       = "Tcp"
  frontend_port                  = 80 
  backend_port                   = 80
  frontend_ip_configuration_name = "WebserverPublicIP"
  backend_address_pool_id        = azurerm_lb_backend_address_pool.webserver_backendpool.id
  probe_id                       = azurerm_lb_probe.webserver_lbprobe.id

}

resource "azurerm_lb_probe" "webserver_lbprobe" {
  resource_group_name = azurerm_resource_group.webserver_rg.name
  loadbalancer_id     = azurerm_lb.webserver_lb.id
  name                = "${var.prefix}-lbprobe"
  port                = 80
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backendpoolassosiation" {
  count                   = var.instance_count
  backend_address_pool_id = azurerm_lb_backend_address_pool.webserver_backendpool.id
  ip_configuration_name   = "primary"
  network_interface_id    = element(azurerm_network_interface.webserver_nic.*.id, count.index)
}

resource "azurerm_linux_virtual_machine" "webserver_vms" {
  count                           = var.instance_count
  name                            = "${var.prefix}-vm${count.index}"
  resource_group_name             = azurerm_resource_group.webserver_rg.name
  location                        = azurerm_resource_group.webserver_rg.location
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  availability_set_id             = azurerm_availability_set.webserver_avset.id
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.webserver_nic[count.index].id,
  ]
  source_image_id = "/subscriptions/9761a7ff-23aa-4bfa-a301-9206bfa2a9ce/resourceGroups/PackerResourceGroup/providers/Microsoft.Compute/images/MyNginxImage"

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  tags = {
    WebServer = "development"
  }
}

output "Output_Values" {
  value = formatlist("%s :   %s", 
                [   
                    "Public IP Address",
                    "Packer Image ID"
                ], 
                [   
                    "${azurerm_public_ip.webserver_publicip.ip_address} ",
                    "${azurerm_linux_virtual_machine.webserver_vms[0].source_image_id}"
                ]
          )
}
