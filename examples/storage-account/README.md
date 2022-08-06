## How to use

```
provider "azurerm" {
features {}
}

module "storage-account" {
  source  = "spy86/storage-account/azure"
  version = "1.0.6"
  resource_group_name = "weu-test-rg"
  storage_account_name = "609ae79b3d32"  
  environment = "dev"
  region = "weu"
  resource_group_location = "West Europe"
  storage_min_tls_version = "TLS1_2"
  storage_replication_type = "LRS"
  storage_tier = "Standard"
  containers_enabled = "false"
  storage_container_name = []
  queue_enabled = "false"
  storage_queue_name = []
  table_enabled = "false"
  storage_table_name = []

  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}
```