resource "azurerm_storage_account" "demo_storage" {
  name = "DevOpsDemo-Storage"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"
  location = "${var.location}"
  account_type = "Standard_LRS"

  tags {
group = "TerraformAzureDemo"
  }
}

resource "azurerm_storage_container" "demo_cont" {
  name = "DevOpsDemo_vhds"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"
  storage_account_name = "${azurerm_storage_account.demo_storage.name}"
  container_access_type = "private"
}