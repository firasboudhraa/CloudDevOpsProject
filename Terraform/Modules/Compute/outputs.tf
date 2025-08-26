//output "public_ip_address" {
//  description = "The public IP of the Jenkins VM"
//  value       = azurerm_public_ip.this.ip_address
//}

output "private_ip_address" {
  description = "The private IP of the Jenkins VM"
  value       = azurerm_linux_virtual_machine.this.private_ip_address
}
