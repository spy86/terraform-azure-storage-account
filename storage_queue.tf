resource "azurerm_storage_queue" "main" {
  for_each = {
    for k, v in "${var.storage_queue_name}" : k => v
    if "${var.queue_enabled}"
  }

  name                 = each.value
  storage_account_name = "${var.environment}${var.storage_account_name}${var.region}"

depends_on = [ azurerm_storage_account.azstorageaccount ] 
}