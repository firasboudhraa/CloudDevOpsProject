variable "project_name" {
  description = "Project name used for resource naming and tags"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Jenkins VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Jenkins VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}
