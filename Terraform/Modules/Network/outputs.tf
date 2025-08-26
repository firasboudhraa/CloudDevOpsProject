output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "resource_group_name" {
  description = "The name of the resource group created in the network module"
  value       = azurerm_resource_group.this.name
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = azurerm_subnet.private.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.this.id
}