resource "azurerm_storage_account" "azstorageaccount" {
  name                     = "${var.tag_environment}${var.storage_account_name}${var.region}"
  resource_group_name      = "${data.azurerm_resource_group.rg.name}"
  location                 = "${data.azurerm_resource_group.rg.location}"
  account_tier             = "${var.storage_tier}"
  account_replication_type = "${var.storage_replication_type}"
  min_tls_version          = "${var.storage_min_tls_version}"

  tags = "${var.default_tags}"
}