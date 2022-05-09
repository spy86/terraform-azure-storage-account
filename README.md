<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.azstorageaccount](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.st_container](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/storage_queue) | resource |
| [azurerm_storage_table.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/storage_table) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_containers_enabled"></a> [containers\_enabled](#input\_containers\_enabled) | Defines whether the storage should be empty or whether containers should be created | `string` | `"false"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_queue_enabled"></a> [queue\_enabled](#input\_queue\_enabled) | Defines whether the storage should be empty or whether queue should be created | `string` | `"false"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the storage account is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the storage account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | The name of the Container's which should be created within the Storage Account. | `set(string)` | n/a | yes |
| <a name="input_storage_min_tls_version"></a> [storage\_min\_tls\_version](#input\_storage\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2 for new storage accounts. | `string` | `"TLS1_2"` | no |
| <a name="input_storage_queue_name"></a> [storage\_queue\_name](#input\_storage\_queue\_name) | The name of the Queue's which should be created within the Storage Account. | `set(string)` | n/a | yes |
| <a name="input_storage_replication_type"></a> [storage\_replication\_type](#input\_storage\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. | `string` | `"LRS"` | no |
| <a name="input_storage_table_name"></a> [storage\_table\_name](#input\_storage\_table\_name) | The name of the Tables's which should be created within the Storage Account. | `set(string)` | n/a | yes |
| <a name="input_storage_tier"></a> [storage\_tier](#input\_storage\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_table_enabled"></a> [table\_enabled](#input\_table\_enabled) | Defines whether the storage should be empty or whether table should be created | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account. |
| <a name="output_primary_access_key"></a> [primary\_access\_key](#output\_primary\_access\_key) | The primary access key for the storage account. |
| <a name="output_secondary_access_key"></a> [secondary\_access\_key](#output\_secondary\_access\_key) | The secondary access key for the storage account. |
<!-- END_TF_DOCS -->

## How to use

```
provider "azurerm" {
features {}
}

module "storage-account" {
  source  = "spy86/storage-account/azure"
  version = "1.0.5"
  resource_group_name = "weu-test-rg"
  storage_account_name = "609ae79b3d32"  
  environment = "dev"
  region = "weu"
  resource_group_location = "West Europe"
  storage_min_tls_version = "TLS1_2"
  storage_replication_type = "LRS"
  storage_tier = "Standard"
  containers_enabled = "true"
  storage_container_name = ["container01", "container02"]
  queue_enabled = "true"
  storage_queue_name = ["queue01", "queue02"]
  table_enabled = "true"
  storage_table_name = ["table01", "table02"]

  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}
```