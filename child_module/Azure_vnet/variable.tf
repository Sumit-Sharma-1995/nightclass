variable "vnet_name" {
  description = "Name of the resource"
  type        = string
  
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  
}

variable "location" {
  description = "Location for the virtual network"
  type        = string
  
}

variable "resource_group_name" {
  description = "Name of the resource group where the virtual network will be created"
  type        = string
  
}