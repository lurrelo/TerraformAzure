resource "azurerm_network_security_group" "demo_nsg_web" {
  name = "DevOpsDemo-Web-NSG"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
name = "AllowSSH"
priority = 100
direction = "Inbound"
access         = "Allow"
protocol = "Tcp"
source_port_range       = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
name = "AllowHTTP"
priority= 200
direction= "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range       = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  tags {
group = "TerraformAzureDemo"
  }

  resource "azurerm_network_security_group" "demo_nsg_db" {
  name = "DevOpsDemo-DB-NSG"
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
name = "AllowMySQL"
priority= 200
direction= "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range       = "*"
    destination_port_range     = "3306"
    source_address_prefix      = "${var.subnet1_cidr}"
    destination_address_prefix = "*"
  }

  tags {
group = "TerraformAzureDemo"
  }
}