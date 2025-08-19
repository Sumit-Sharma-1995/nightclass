module "azurerm_resource_group" {
  source      = "../child_module/Azure_resource_group"
  rg_name     = "yamlrg"
  rg_location = "East US"

}

module "azurerm_storage_account" {
  depends_on = [module.azurerm_resource_group]
  source     = "../child_module/Azure_storage_account"
  stg_name   = "yamlstg"

  resource_group_name      = "yamlrg"
  resource_group_location  = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_storage_account]
  source            = "../child_module/Azure_vnet"
  vnet_name         = "yamlvnet"
  address_space     = ["10.0.0.0/16"]
  location          = "East US"
  resource_group_name = module.azurerm_resource_group.azurerm_resource_group.name
  
}
import {
  to = module.azurerm_resource_group.azurerm_resource_group.discussion
  id = "/subscriptions/2775dd26-3d9b-4b17-b5d0-b8edea927622/resourceGroups/yamlrg"
}

import {
  to = module.azurerm_storage_account.azurerm_storage_account.storage_account
  id = "/subscriptions/2775dd26-3d9b-4b17-b5d0-b8edea927622/resourceGroups/yamlrg/providers/Microsoft.Storage/storageAccounts/yamlstg"
}
