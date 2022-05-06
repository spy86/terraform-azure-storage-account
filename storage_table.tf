resource "azurerm_storage_table" "main" {
  for_each = {
    for k, v in "${var.storage_table_name}" : k => v
    if "${var.table_enabled}"
  }

  name                 = each.value
  storage_account_name = "${var.storage_account_name}"
}