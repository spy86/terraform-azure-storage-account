###########################
# Common vars
###########################
variable "environment" {
  description = "Var used for backend container name key"
  type = string
  default = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
}
variable "region" {
  description = "Region in which resources are deployed"
  type = string
  default = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "The location/region where the storage account is created. Changing this forces a new resource to be created."
  default = "West Europe"
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type = string
}
############################
#Storage Account variable
############################
variable "storage_account_name" {
    description = "The name of the storage account. Changing this forces a new resource to be created."
    type = string
}
variable "storage_replication_type" {
    description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
    type = string
    default = "LRS"
}
variable "storage_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type = string
  default = "Standard"
}
variable "storage_min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts."
  type = string
  default = "TLS1_2"
}
variable "containers_enabled" {
  description = "Defines whether the storage should be empty or whether containers should be created"
  type = string
  default = "false"
}
variable "storage_container_name" {
  description = "The name of the Container's which should be created within the Storage Account."
  type        = set(string)
}
variable "queue_enabled" {
  description = "Defines whether the storage should be empty or whether queue should be created"
  type = string
  default = "false"
}
variable "storage_queue_name" {
  description = "The name of the Queue's which should be created within the Storage Account."
  type        = set(string)
}
variable "table_enabled" {
  description = "Defines whether the storage should be empty or whether table should be created"
  type = string
  default = "false"
}
variable "storage_table_name" {
  description = "The name of the Tables's which should be created within the Storage Account."
  type        = set(string)
}