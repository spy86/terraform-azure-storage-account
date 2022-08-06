resource "azurerm_storage_container" "st_container" {
  for_each = {
    for k, v in "${var.storage_container_name}" : k => v
    if "${var.containers_enabled}"
  }
  name                  = each.value
  storage_account_name  = "${var.environment}${var.storage_account_name}${var.region}"
  container_access_type = "private"

depends_on = [ azurerm_storage_account.azstorageaccount ] 
}