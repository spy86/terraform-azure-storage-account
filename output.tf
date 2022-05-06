output "id" {
  description = "The ID of the Storage Account."
  value = "${azurerm_storage_account.azstorageaccount.id}"
  sensitive = false
}
output "primary_access_key" {
  description = "The primary access key for the storage account."
  value = "${azurerm_storage_account.azstorageaccount.primary_access_key}"
  sensitive = true
}
output "secondary_access_key" {
  description = "The secondary access key for the storage account."
  value = "${azurerm_storage_account.azstorageaccount.secondary_access_key}"
  sensitive = true
}