//output "public_ip_address" {
//  description = "Public IP of the Jenkins VM"
//  value       = module.compute.public_ip_address
//}

output "private_ip_address" {
  description = "Private IP of the Jenkins VM"
  value       = module.compute.private_ip_address
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.network.private_subnet_id
}
